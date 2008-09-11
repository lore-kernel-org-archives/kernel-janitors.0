From: "Richard Genoud" <richard.genoud@gmail.com>
Date: Thu, 11 Sep 2008 13:46:11 +0000
Subject: Re: [PATCH 1/5] drivers/infiniband/hw: Drop code after return
Message-Id: <80b317760809110646j1e9c5171v3fe78546cd62c9a7@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0809111432400.9593@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0809111432400.9593@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: rolandd@cisco.com, sean.hefty@intel.com, hal.rosenstock@gmail.com, general@lists.openfabrics.org, vigneshbabu@gmail.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

2008/9/11 Julia Lawall <julia@diku.dk>:
> From: Julia Lawall <julia@diku.dk>
>
> The break after the return serves no purpose.
>
> Signed-off-by: Julia Lawall <julia@diku.dk>
Reviewed-by: Richard Genoud <richard.genoud@gmail.com>
> ---
>  drivers/infiniband/hw/amso1100/c2_provider.c |    1 -
>  drivers/infiniband/hw/nes/nes_verbs.c        |    3 ---
>  2 files changed, 4 deletions(-)
>
> diff -u -p a/drivers/infiniband/hw/amso1100/c2_provider.c b/drivers/infiniband/hw/amso1100/c2_provider.c
> --- a/drivers/infiniband/hw/amso1100/c2_provider.c
> +++ b/drivers/infiniband/hw/amso1100/c2_provider.c
> @@ -272,7 +272,6 @@ static struct ib_qp *c2_create_qp(struct
>                pr_debug("%s: Invalid QP type: %d\n", __func__,
>                        init_attr->qp_type);
>                return ERR_PTR(-EINVAL);
> -               break;
>        }
>
>        if (err) {
> diff -u -p a/drivers/infiniband/hw/nes/nes_verbs.c b/drivers/infiniband/hw/nes/nes_verbs.c
> --- a/drivers/infiniband/hw/nes/nes_verbs.c
> +++ b/drivers/infiniband/hw/nes/nes_verbs.c
> @@ -1467,7 +1467,6 @@ static struct ib_qp *nes_create_qp(struc
>                default:
>                        nes_debug(NES_DBG_QP, "Invalid QP type: %d\n", init_attr->qp_type);
>                        return ERR_PTR(-EINVAL);
> -                       break;
>        }
>
>        /* update the QP table */
> @@ -2498,7 +2497,6 @@ static struct ib_mr *nes_reg_user_mr(str
>                        nes_debug(NES_DBG_MR, "Leaving, ibmr=%p", ibmr);
>
>                        return ibmr;
> -                       break;
>                case IWNES_MEMREG_TYPE_QP:
>                case IWNES_MEMREG_TYPE_CQ:
>                        nespbl = kzalloc(sizeof(*nespbl), GFP_KERNEL);
> @@ -2572,7 +2570,6 @@ static struct ib_mr *nes_reg_user_mr(str
>                        nesmr->ibmr.lkey = -1;
>                        nesmr->mode = req.reg_type;
>                        return &nesmr->ibmr;
> -                       break;
>        }
>
>        return ERR_PTR(-ENOSYS);
>
