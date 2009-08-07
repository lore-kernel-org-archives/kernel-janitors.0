From: "Davidlohr Bueso A." <dave@gnu.org>
Date: Fri, 07 Aug 2009 19:44:29 +0000
Subject: Re: [PATCH] drivers/scsi: Check NULL for kmalloc() return
Message-Id: <20090807194429.GA23615@fencepost.gnu.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090807183953.GA22286@fencepost.gnu.org> <Pine.LNX.4.64.0908072054080.8253@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908072054080.8253@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>, kraxel@bytesex.org
Cc: linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 07, 2009 at 08:54:44PM +0200, Julia Lawall wrote:
> On Fri, 7 Aug 2009, Davidlohr Bueso A. wrote:
> 
> > Verify that ch->dt is not NULL before using it:
> > ch-dt[elem] = value;
> 
> It looks like buffer should be freed as well?

The way I see it, this is done in ch_remove()

Davidlohr

> 
> julia
> 
> > Signed-off-by: Davidlohr Bueso
> > 
> > ---
> >  drivers/scsi/ch.c |    4 ++++
> >  1 files changed, 4 insertions(+), 0 deletions(-)
> > 
> > diff --git a/drivers/scsi/ch.c b/drivers/scsi/ch.c
> > index 7b1633a..96cbd20 100644
> > --- a/drivers/scsi/ch.c
> > +++ b/drivers/scsi/ch.c
> > @@ -353,6 +353,10 @@ ch_readconfig(scsi_changer *ch)
> >         /* look up the devices of the data transfer elements */
> >         ch->dt = kmalloc(ch->counts[CHET_DT]*sizeof(struct scsi_device),
> >                          GFP_KERNEL);
> > +
> > +       if (!ch->dt)
> > +               return -ENOMEM;
> > +
> >         for (elem = 0; elem < ch->counts[CHET_DT]; elem++) {
> >                 id  = -1;
> >                 lun = 0;
> > --
> > To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> > 
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
