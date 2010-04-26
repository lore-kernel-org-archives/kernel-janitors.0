From: Dan Carpenter <error27@gmail.com>
Date: Mon, 26 Apr 2010 10:46:43 +0000
Subject: Re: [patch] cifs: change && to ||
Message-Id: <20100426104643.GR29093@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100426101006.GQ29093@bicker>
In-Reply-To: <20100426101006.GQ29093@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Apr 26, 2010 at 06:44:01AM -0400, Jeff Layton wrote:
> On Mon, 26 Apr 2010 12:10:06 +0200
> Dan Carpenter <error27@gmail.com> wrote:
> 
> > This is a typo, if pvolume_info were NULL it would oops.
> > 
> > This function is used in clean up and error handling.  The current code
> > never passes a NULL pvolume_info, but it could pass a NULL *pvolume_info
> > if the kmalloc() failed.
> > 
> > Signed-off-by: Dan Carpenter <error27@gmail.com>
> > 
> > diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> > index d9566bf..85a35a4 100644
> > --- a/fs/cifs/connect.c
> > +++ b/fs/cifs/connect.c
> > @@ -2262,7 +2262,7 @@ cleanup_volume_info(struct smb_vol **pvolume_info)
> >  {
> >  	struct smb_vol *volume_info;
> >  
> > -	if (!pvolume_info && !*pvolume_info)
> > +	if (!pvolume_info || !*pvolume_info)
> >  		return;
> >  
> >  	volume_info = *pvolume_info;
> 
> Good catch. I wonder though whether we can just eliminate that check
> altogether? In any case, this is clearly correct in the short term.

Nah, we can't.  If the kmalloc() that allocates *pvolume_info fails it
would lead to an OOPs.

regards,
dan carpenter

> 
> Acked-by: Jeff Layton <jlayton@redhat.com>
