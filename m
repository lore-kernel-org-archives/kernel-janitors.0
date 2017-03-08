From: Devesh Sharma <devesh.sharma@broadcom.com>
Date: Wed, 08 Mar 2017 15:27:22 +0000
Subject: Re: [PATCH 21/26] IB/ocrdma: Improve another size determination in ocrdma_create_srq()
Message-Id: <CANjDDBi8xNG-nK9VU_7f--CUCCkF76p0LRVnM9V_qH3-YXEzpA@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc421509-4069-da8a-b308-60b49ea91ada@users.sourceforge.net> <53b2ab35-8b0c-5cdd-dbc9-d38c7cf9e580@users.sourceforge.net>
In-Reply-To: <53b2ab35-8b0c-5cdd-dbc9-d38c7cf9e580-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: linux-rdma <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Devesh Sharma <devesh.sharma-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Selvin Xavier <selvin.xavier-1wcpHE2jlwO1Z/+hSey0Gg@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

Acked-By: Devesh Sharma <devesh.sharma@broadcom.com>

On Wed, Mar 8, 2017 at 6:54 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 8 Mar 2017 10:10:50 +0100
>
> Replace the specification of a data type by a pointer dereference
> as the parameter for the operator "sizeof" to make the corresponding size
> determination a bit safer according to the Linux coding style convention.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/infiniband/hw/ocrdma/ocrdma_verbs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
> index af8798fd35b1..bedc229be89d 100644
> --- a/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
> +++ b/drivers/infiniband/hw/ocrdma/ocrdma_verbs.c
> @@ -1915,7 +1915,7 @@ struct ib_srq *ocrdma_create_srq(struct ib_pd *ibpd,
>                 if (srq->idx_bit_fields = NULL)
>                         goto arm_err;
>                 memset(srq->idx_bit_fields, 0xff,
> -                      srq->bit_fields_len * sizeof(u32));
> +                      srq->bit_fields_len * sizeof(*srq->idx_bit_fields));
>         }
>
>         if (init_attr->attr.srq_limit) {
> --
> 2.12.0
>
