From: ronnie sahlberg <ronniesahlberg@gmail.com>
Date: Thu, 29 Aug 2019 04:09:35 +0000
Subject: Re: [PATCH][cifs-next] cifs: ensure variable rc is initialized at the after_open label
Message-Id: <CAN05THSTwX_a7hry4EpD86EEr7NaZ75XUhDKpr_Dgwqqt+rBuw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190829000006.24187-1-colin.king@canonical.com> <CAH2r5mtSSwS7_E2WkS3Lsk02BEf_UwZ4H9oCEFTSf94U=4Cm9Q@mail.gmail.com>
In-Reply-To: <CAH2r5mtSSwS7_E2WkS3Lsk02BEf_UwZ4H9oCEFTSf94U=4Cm9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steve French <smfrench@gmail.com>
Cc: Colin King <colin.king@canonical.com>, Steve French <sfrench@samba.org>, CIFS <linux-cifs@vger.kernel.org>, samba-technical <samba-technical@lists.samba.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

On Thu, Aug 29, 2019 at 2:00 PM Steve French <smfrench@gmail.com> wrote:
>
> Merged into cifs-2.6.git for-next
>
> Ronnie,
> You ok with merging this as a distinct patch?

Sure thing.
Thanks for the fix Colin.


>
> On Wed, Aug 28, 2019 at 7:02 PM Colin King <colin.king@canonical.com> wrote:
> >
> > From: Colin Ian King <colin.king@canonical.com>
> >
> > A previous fix added a jump to after_open which now leaves variable
> > rc in a uninitialized state. A couple of the cases in the following
> > switch statement do not set variable rc, hence the error check on rc
> > at the end of the switch statement is reading a garbage value in rc
> > for those specific cases. Fix this by initializing rc to zero before
> > the switch statement.
> >
> > Fixes: 955a9c5b39379 ("cifs: create a helper to find a writeable handle by path name")
> > Addresses-Coverity: ("Uninitialized scalar variable")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> >  fs/cifs/smb2inode.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/fs/cifs/smb2inode.c b/fs/cifs/smb2inode.c
> > index 70342bcd89b4..939fc7b2234c 100644
> > --- a/fs/cifs/smb2inode.c
> > +++ b/fs/cifs/smb2inode.c
> > @@ -116,6 +116,7 @@ smb2_compound_op(const unsigned int xid, struct cifs_tcon *tcon,
> >         smb2_set_next_command(tcon, &rqst[num_rqst]);
> >   after_open:
> >         num_rqst++;
> > +       rc = 0;
> >
> >         /* Operation */
> >         switch (command) {
> > --
> > 2.20.1
> >
>
>
> --
> Thanks,
>
> Steve
