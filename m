From: walter harms <wharms@bfs.de>
Date: Fri, 27 May 2016 11:45:31 +0000
Subject: Re: [patch] usb: f_fs: off by one bug in _ffs_func_bind()
Message-Id: <5748335B.80704@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160527112311.GC3255@mwanda>
In-Reply-To: <20160527112311.GC3255@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 27.05.2016 13:23, schrieb Dan Carpenter:
> This loop is supposed to set all the .num values to -1 but it's doesn't
> set the first element and it sets one element beyond the end of the
> array.  Really there is no reason for it to be done backwards.  And
> "ret" is the wrong variable to use for an iterator.
> 
> Fixes: ddf8abd25994 ('USB: f_fs: the FunctionFS driver')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I just spotted this reviewing the code, I have not tested it.  Please
> review carefully, the vla_ptr() macro is difficult to understand.
> 
> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
> index 73515d5..7fff81a 100644
> --- a/drivers/usb/gadget/function/f_fs.c
> +++ b/drivers/usb/gadget/function/f_fs.c
> @@ -2777,11 +2777,11 @@ static int _ffs_func_bind(struct usb_configuration *c,
>  	       ffs->raw_descs_length);
>  
>  	memset(vla_ptr(vlabuf, d, inums), 0xff, d_inums__sz);
> -	for (ret = ffs->eps_count; ret; --ret) {
> +	for (i = 0; i < ffs->eps_count; i++) {
>  		struct ffs_ep *ptr;
>  
>  		ptr = vla_ptr(vlabuf, d, eps);
> -		ptr[ret].num = -1;
> +		ptr[i].num = -1;
>  	}
>  

The patch is ok (programmers are bad at counting backward) but the
code got me a bit confused (easy done).

so far i understand:

ptr=vla_ptr(vlabuf, d, eps) expands into  ptr=vlabuf+d_eps__offset
so it is a const.

so why not move the assign out of the loop ?
struct ffs_ep *ptr=vla_ptr(vlabuf, d, eps);
for (i = 0; i < ffs->eps_count; i++)
	ptr[i].num = -1;


just my 2 cents,

re,
 wh


>  	/* Save pointers
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
