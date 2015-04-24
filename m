From: Julia Lawall <julia.lawall@lip6.fr>
Date: Fri, 24 Apr 2015 10:10:18 +0000
Subject: Re: [PATCH] fs/compat: remove redundant 'less than zero' check
Message-Id: <alpine.DEB.2.10.1504241209450.3424@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1429870070-30310-1-git-send-email-firogm@gmail.com>
In-Reply-To: <1429870070-30310-1-git-send-email-firogm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Firo Yang <firogm@gmail.com>
Cc: viro@zeniv.linux.org.uk, kernel-janitors@vger.kernel.org, linux-fsdevel@vger.kernel.org



On Fri, 24 Apr 2015, Firo Yang wrote:

> Smatch complains about the check in compat.c.
> fs/compat.c:565 compat_rw_copy_check_uvector() warn:
> unsigned 'nr_segs' is never less than zero.
>
> I think, there is no reason to check if the value nr_segs
> is less than zero. So I removed it.

It would be good to explain why you think this.  What other statements in
the code imply this property?

julia

>
> Signed-off-by: Firo Yang <firogm@gmail.com>
> ---
>  fs/compat.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/compat.c b/fs/compat.c
> index 6fd272d..beaf15b 100644
> --- a/fs/compat.c
> +++ b/fs/compat.c
> @@ -562,7 +562,7 @@ ssize_t compat_rw_copy_check_uvector(int type,
>  		goto out;
>
>  	ret = -EINVAL;
> -	if (nr_segs > UIO_MAXIOV || nr_segs < 0)
> +	if (nr_segs > UIO_MAXIOV)
>  		goto out;
>  	if (nr_segs > fast_segs) {
>  		ret = -ENOMEM;
> --
> 2.1.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
