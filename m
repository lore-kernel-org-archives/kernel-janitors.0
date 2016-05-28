From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 28 May 2016 04:46:18 +0000
Subject: Re: [patch] usb: f_fs: off by one bug in _ffs_func_bind()
Message-Id: <20160528044618.GQ11011@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160527112311.GC3255@mwanda>
In-Reply-To: <20160527112311.GC3255@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, May 27, 2016 at 07:25:30PM +0200, walter harms wrote:
> 
> 
> Am 27.05.2016 14:23, schrieb Michal Nazarewicz:
> > On Fri, May 27 2016, Dan Carpenter wrote:
> >> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> >> index 73515d5..7fff81a 100644
> >> --- a/drivers/usb/gadget/function/f_fs.c
> >> +++ b/drivers/usb/gadget/function/f_fs.c
> >> @@ -2777,11 +2777,11 @@ static int _ffs_func_bind(struct usb_configuration *c,
> >>  	       ffs->raw_descs_length);
> >>  
> >>  	memset(vla_ptr(vlabuf, d, inums), 0xff, d_inums__sz);
> >> -	for (ret = ffs->eps_count; ret; --ret) {
> >> +	for (i = 0; i < ffs->eps_count; i++) {
> >>  		struct ffs_ep *ptr;
> >>  
> >>  		ptr = vla_ptr(vlabuf, d, eps);
> > 
> > As pointed by Walter, this could be moved outside.  Maybe
> > 
> > 	i = ffs->eps_count;
> > 	for (struct ffs_ep *ptr = vla_ptr(vlabuf, d, eps); i; ++ptr, --i)
> > 		ptr->num = -1;
> > 
> 
> I think staying with an array here improves readability.
> 

I'm surprised you didn't comment on the --i.  I was thinking about you
when I changed it to a ++ loop.  Also in the kernel we have to declare
variables at the start of the block.

Anyway, let me send a v2.

regards,
dan carpenter

