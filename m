From: Laurence Oberman <loberman@redhat.com>
Date: Fri, 17 Feb 2017 15:55:44 +0000
Subject: Re: [PATCH] RDMA/bnxt_re: remove redundant initialization of rc to zero
Message-Id: <452436574.33358675.1487346943996.JavaMail.zimbra@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170217153522.30988-1-colin.king@canonical.com>
In-Reply-To: <20170217153522.30988-1-colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Selvin Xavier <selvin.xavier-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Devesh Sharma <devesh.sharma-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Somnath Kotur <somnath.kotur-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Sriharsha Basavapatna <sriharsha.basavapatna-dY08KVG/lbpWk0Htik3J/w@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org



----- Original Message -----
> From: "Colin King" <colin.king@canonical.com>
> To: "Selvin Xavier" <selvin.xavier@broadcom.com>, "Devesh Sharma" <devesh.sharma@broadcom.com>, "Somnath Kotur"
> <somnath.kotur@broadcom.com>, "Sriharsha Basavapatna" <sriharsha.basavapatna@broadcom.com>, "Doug Ledford"
> <dledford@redhat.com>, "Sean Hefty" <sean.hefty@intel.com>, "Hal Rosenstock" <hal.rosenstock@gmail.com>,
> linux-rdma@vger.kernel.org
> Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
> Sent: Friday, February 17, 2017 10:35:22 AM
> Subject: [PATCH] RDMA/bnxt_re: remove redundant initialization of rc to zero
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> rc is initialized to zero but is then updated by calls to
> bnxt_qplib_free_fast_reg_page_list and/or bnxt_qpliob_free_mrw
> so the initialization is redundant and can be removed.
> 
> Detected with CoverityScan, CID#1408448 ("Unused Value")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/bnxt_re/ib_verbs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/infiniband/hw/bnxt_re/ib_verbs.c
> b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
> index 33af2e3..17aa087 100644
> --- a/drivers/infiniband/hw/bnxt_re/ib_verbs.c
> +++ b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
> @@ -2818,7 +2818,7 @@ int bnxt_re_dereg_mr(struct ib_mr *ib_mr)
>  {
>  	struct bnxt_re_mr *mr = container_of(ib_mr, struct bnxt_re_mr, ib_mr);
>  	struct bnxt_re_dev *rdev = mr->rdev;
> -	int rc = 0;
> +	int rc;
>  
>  	if (mr->npages && mr->pages) {
>  		rc = bnxt_qplib_free_fast_reg_page_list(&rdev->qplib_res,
> --
> 2.10.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-rdma" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
Makes sense, looks fine.
Reviewed-by: Laurence Oberman <loberman@redhat.com>
