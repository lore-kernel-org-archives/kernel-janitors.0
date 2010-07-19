From: Jeff Layton <jlayton@redhat.com>
Date: Mon, 19 Jul 2010 18:50:20 +0000
Subject: Re: [PATCH 10/15] fs: cifs: check kmalloc() result
Message-Id: <20100719145020.205ece82@tlielax.poochiereds.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279296925-25147-1-git-send-email-segooon@gmail.com>
	<1279298130.26876.12.camel@shaggy-w500>
In-Reply-To: <1279298130.26876.12.camel@shaggy-w500>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
Cc: linux-cifs@vger.kernel.org, Kulikov Vasiliy <segooon@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Steve French <sfrench@samba.org>, Joe Perches <joe@perches.com>, Tejun Heo <tj@kernel.org>, samba-technical@lists.samba.org

On Fri, 16 Jul 2010 11:35:30 -0500
Dave Kleikamp <shaggy@linux.vnet.ibm.com> wrote:

> On Fri, 2010-07-16 at 20:15 +0400, Kulikov Vasiliy wrote:
> > If kmalloc() fails exit with -ENOMEM.
> 
> Looks good to me.  Add my ack if you want it.
> 
> > Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>
> 
> Acked-by: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
> 
> > ---
> >  fs/cifs/readdir.c |    5 +++++
> >  1 files changed, 5 insertions(+), 0 deletions(-)
> > 
> > diff --git a/fs/cifs/readdir.c b/fs/cifs/readdir.c
> > index daf1753..d5e591f 100644
> > --- a/fs/cifs/readdir.c
> > +++ b/fs/cifs/readdir.c
> > @@ -847,6 +847,11 @@ int cifs_readdir(struct file *file, void *direntry, filldir_t filldir)
> >  		end_of_smb = cifsFile->srch_inf.ntwrk_buf_start + max_len;
> > 
> >  		tmp_buf = kmalloc(UNICODE_NAME_MAX, GFP_KERNEL);
> > +		if (tmp_buf = NULL) {
> > +			rc = -ENOMEM;
> > +			break;
> > +		}
> > +
> >  		for (i = 0; (i < num_to_fill) && (rc = 0); i++) {
> >  			if (current_entry = NULL) {
> >  				/* evaluate whether this case is an error */
> 

Looks good to me too.

Acked-by: Jeff Layton <jlayton@redhat.com>
