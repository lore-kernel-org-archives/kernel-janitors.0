From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Date: Mon, 22 May 2017 19:24:38 +0000
Subject: Re: [PATCH 1/3] RDS: IB: Delete an error message for a failed memory allocation in rds_ib_add_one()
Message-Id: <3b02a3d1-17c9-3d8b-7edb-db640c0ea017@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <44b46c51-3665-5f14-dd3b-6e6f230258a7@users.sourceforge.net>
 <e3491aaa-f471-c67c-43dc-41d592159c8e@users.sourceforge.net>
In-Reply-To: <e3491aaa-f471-c67c-43dc-41d592159c8e-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, netdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, rds-devel-N0ozoZBvEnrZJqsBc5GL+g@public.gmane.org, "David S. Miller" <davem-fT/PcQaiUtIeIZ0/mPfg9Q@public.gmane.org>, Sowmini Varadhan <sowmini.varadhan-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On 5/22/2017 7:11 AM, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 22 May 2017 15:34:28 +0200
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>   net/rds/ib.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/net/rds/ib.c b/net/rds/ib.c
> index 7a64c8db81ab..c5514d058171 100644
> --- a/net/rds/ib.c
> +++ b/net/rds/ib.c
> @@ -166,8 +166,5 @@ static void rds_ib_add_one(struct ib_device *device)
> -	if (!rds_ibdev->vector_load) {
> -		pr_err("RDS/IB: %s failed to allocate vector memory\n",
> -			__func__);
> +	if (!rds_ibdev->vector_load)
>   		goto put_dev;
> -	}
>   
Well the ENOMEM is not carried here so the message was usefu
but its not critical so its fine to clean that up.

Acked-by: Santosh Shilimkar <santosh.shilimkar@oracle.com>
