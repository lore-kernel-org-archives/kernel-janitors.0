From: Steve Wise <swise@opengridcomputing.com>
Date: Thu, 25 Jul 2013 18:43:28 +0000
Subject: Re: [patch] RDMA/cxgb3: stack info leak in iwch_craete_cq()
Message-Id: <51F171D0.7050204@opengridcomputing.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130725170409.GB7026@elgon.mountain>
In-Reply-To: <20130725170409.GB7026-mgFCXtclrQlZLf2FXnZxJA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: Steve Wise <swise-ut6Up61K2wZBDgjK7y7TUQ@public.gmane.org>, Roland Dreier <roland-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 7/25/2013 12:04 PM, Dan Carpenter wrote:
> The "uresp.reserved" field isn't initialized.  It's at the end, of the
> struct here so we don't need to copy it to the user.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/infiniband/hw/cxgb3/iwch_provider.c b/drivers/infiniband/hw/cxgb3/iwch_provider.c
> index e87f220..b8e26f2 100644
> --- a/drivers/infiniband/hw/cxgb3/iwch_provider.c
> +++ b/drivers/infiniband/hw/cxgb3/iwch_provider.c
> @@ -226,7 +226,7 @@ static struct ib_cq *iwch_create_cq(struct ib_device *ibdev, int entries, int ve
>   			mm->len = PAGE_ALIGN(((1UL << uresp.size_log2) + 1) *
>   					     sizeof(struct t3_cqe));
>   			uresp.memsize = mm->len;
> -			resplen = sizeof uresp;
> +			resplen = sizeof uresp - sizeof uresp.reserved;
>   		}
>   		if (ib_copy_to_udata(udata, &uresp, resplen)) {
>   			kfree(mm);

How did you find this?

What if, in the future, the iwch_create_cq_resp struct is changed and 
stuff added to the end?  I'm not sure this optimization is worth it?


