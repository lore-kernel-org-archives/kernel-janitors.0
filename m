From: Jeff Layton <jlayton@samba.org>
Date: Mon, 25 Oct 2010 15:31:35 +0000
Subject: Re: [patch] cifs: cifs_convert_address() returns zero on error
Message-Id: <20101025113135.152f52ee@corrin.poochiereds.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101025050256.GX5985@bicker>
In-Reply-To: <20101025050256.GX5985@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Steve French <sfrench-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, Suresh Jayaraman <sjayaraman-l3A5Bk7waGM@public.gmane.org>, Shirish Pargaonkar <shirishpargaonkar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-cifs-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, samba-technical-w/Ol4Ecudpl8XjKLYN78aQ@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Mon, 25 Oct 2010 07:02:56 +0200
Dan Carpenter <error27@gmail.com> wrote:

> The cifs_convert_address() returns zero on error but this caller is
> testing for negative returns.
> 
> Btw. "i" is unsigned here, so it's never negative.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> 
> diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
> index 7e73176..ad6a4ea 100644
> --- a/fs/cifs/connect.c
> +++ b/fs/cifs/connect.c
> @@ -1064,7 +1064,7 @@ cifs_parse_mount_options(char *options, const char *devname,
>  			}
>  			i = cifs_convert_address((struct sockaddr *)&vol->srcaddr,
>  						 value, strlen(value));
> -			if (i < 0) {
> +			if (i = 0) {
>  				printk(KERN_WARNING "CIFS:  Could not parse"
>  				       " srcaddr: %s\n",
>  				       value);
> --
> To unsubscribe from this list: send the line "unsubscribe linux-cifs" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Good catch. Looks right to me.

Reviewed-by:
-- 
Jeff Layton <jlayton@samba.org>
