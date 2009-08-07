From: "Davidlohr Bueso A." <dave@gnu.org>
Date: Fri, 07 Aug 2009 20:42:21 +0000
Subject: Re: [PATCH] drivers/scsi: Check NULL for kmalloc() return
Message-Id: <20090807204221.GA2380@fencepost.gnu.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090807183953.GA22286@fencepost.gnu.org> <Pine.LNX.4.64.0908072054080.8253@ask.diku.dk> <20090807194429.GA23615@fencepost.gnu.org> <Pine.LNX.4.64.0908072155260.8253@ask.diku.dk> <20090807201700.GB23615@fencepost.gnu.org> <154e089b0908071333l1d19545ay2dfaee89366120a5@mail.gmail.com>
In-Reply-To: <154e089b0908071333l1d19545ay2dfaee89366120a5@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Hannes Eder <hannes@hanneseder.net>
Cc: Julia Lawall <julia@diku.dk>, kraxel@bytesex.org, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 07, 2009 at 10:33:36PM +0200, Hannes Eder wrote:
> On Fri, Aug 7, 2009 at 22:17, Davidlohr Bueso A.<dave@gnu.org> wrote:
> > On Fri, Aug 07, 2009 at 09:56:48PM +0200, Julia Lawall wrote:
> >> On Fri, 7 Aug 2009, Davidlohr Bueso A. wrote:
> >>
> >> > On Fri, Aug 07, 2009 at 08:54:44PM +0200, Julia Lawall wrote:
> >> > > On Fri, 7 Aug 2009, Davidlohr Bueso A. wrote:
> >> > >
> >> > > > Verify that ch->dt is not NULL before using it:
> >> > > > ch-dt[elem] = value;
> >> > >
> >> > > It looks like buffer should be freed as well?
> >> >
> >> > The way I see it, this is done in ch_remove()
> >>
> >> I don't see that at all.  buffer appears to be a variable that is local to
> >> ch_readconfig and is passed down to other functions, but never saved
> >> anywhere.  Furthermore buffer is freed in the normal exit of the function,
> >> so it seems likely that it should be freed on an early exit as well.
> >
> > Sorry, misread, for some reason I thought you were talking about freeing ch->dt, correting patch.
> >
> > Thanks,
> > Davidlohr
> >
> > Signed-off-by: Davidlohr Bueso <dave@gnu.org>
> >
> > ---
> >  drivers/scsi/ch.c |    6 ++++++
> >  1 files changed, 6 insertions(+), 0 deletions(-)
> >
> > diff --git a/drivers/scsi/ch.c b/drivers/scsi/ch.c
> > index 7b1633a..bb42ceb 100644
> > --- a/drivers/scsi/ch.c
> > +++ b/drivers/scsi/ch.c
> > @@ -353,6 +353,12 @@ ch_readconfig(scsi_changer *ch)
> >        /* look up the devices of the data transfer elements */
> >        ch->dt = kmalloc(ch->counts[CHET_DT]*sizeof(struct scsi_device),
> >                         GFP_KERNEL);
> > +
> > +       if (!ch->dt) {
> > +               free(buffer);
> 
> kfree(buffer) ?

Wow, unbelievable, that'll teach me!

Signed-off-by: Davidlohr Bueso <dave@gnu.org>
---
 drivers/scsi/ch.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/drivers/scsi/ch.c b/drivers/scsi/ch.c
index 7b1633a..fe11c1d 100644
--- a/drivers/scsi/ch.c
+++ b/drivers/scsi/ch.c
@@ -353,6 +353,12 @@ ch_readconfig(scsi_changer *ch)
        /* look up the devices of the data transfer elements */
        ch->dt = kmalloc(ch->counts[CHET_DT]*sizeof(struct scsi_device),
                         GFP_KERNEL);
+
+       if (!ch->dt) {
+               kfree(buffer);
+               return -ENOMEM;
+       }
+
        for (elem = 0; elem < ch->counts[CHET_DT]; elem++) {
                id  = -1;
                lun = 0;
