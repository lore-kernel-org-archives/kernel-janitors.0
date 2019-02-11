From: Devesh Sharma <devesh.sharma@broadcom.com>
Date: Mon, 11 Feb 2019 13:53:31 +0000
Subject: Re: [PATCH][next] RDMA/bnxt_re: fix or'ing of data into an uninitialized struct member
Message-Id: <CANjDDBj=kzvaWZfwe6rrJki9crfCGxUaBi2Pc+Cb3+MSWYtAVA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190211133415.9020-1-colin.king@canonical.com>
In-Reply-To: <20190211133415.9020-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Selvin Xavier <selvin.xavier@broadcom.com>, Somnath Kotur <somnath.kotur@broadcom.com>, Sriharsha Basavapatna <sriharsha.basavapatna@broadcom.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma <linux-rdma@vger.kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Mon, Feb 11, 2019 at 7:04 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> The struct member comp_mask has not been initialized however a bit
> pattern is being bitwise or'd into the member and hence other bit
> fields in comp_mask may contain any garbage from the stack. Fix this
> by making the bitwise or into an assignment.
>
> Fixes: 95b86d1c91ad ("RDMA/bnxt_re: Update kernel user abi to pass chip context")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/infiniband/hw/bnxt_re/ib_verbs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/infiniband/hw/bnxt_re/ib_verbs.c b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
> index 1d7469e23cde..de5cb9a61a78 100644
> --- a/drivers/infiniband/hw/bnxt_re/ib_verbs.c
> +++ b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
> @@ -3720,7 +3720,7 @@ struct ib_ucontext *bnxt_re_alloc_ucontext(struct ib_device *ibdev,
>         }
>         spin_lock_init(&uctx->sh_lock);
>
> -       resp.comp_mask |= BNXT_RE_UCNTX_CMASK_HAVE_CCTX;
> +       resp.comp_mask = BNXT_RE_UCNTX_CMASK_HAVE_CCTX;
>         chip_met_rev_num = rdev->chip_ctx.chip_num;
>         chip_met_rev_num |= ((u32)rdev->chip_ctx.chip_rev & 0xFF) <<
>                              BNXT_RE_CHIP_ID0_CHIP_REV_SFT;
> --
> 2.20.1
>
Thanks  that was missed!

Acked-By: Devesh Sharma <devesh.sharma@broadcom.com>
