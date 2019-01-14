From: Devesh Sharma <devesh.sharma@broadcom.com>
Date: Mon, 14 Jan 2019 10:30:26 +0000
Subject: Re: [PATCH] RDMA/bnxt_re: fix a size calculation
Message-Id: <CANjDDBhjBKFmFYDODP8yLRMkXjPa1U7V17SgkvtEpPQAZZAW0Q@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190110130019.GA27017@kadam>
In-Reply-To: <20190110130019.GA27017@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Jan 10, 2019 at 6:30 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> This is from static analysis not from testing.  Depending on the value
> of rcfw->cmdq_depth, then this might not cause an issue at runtime.
>
> The BITS_TO_LONGS() macro tells us how many longs it take to hold a
> bitmap.  In other words, it divides by the number if bits per long and
> rounds up.  Then we want to take that number and multiple by
> sizeof(long) to get the number of bytes to allocate.
>
> The code here does the multiplication first so the rounding up is done
> in the wrong place.  So imagine we want to allocate 1 bit, then
> "(1 * 8) / 64 = 1" when we round up.  But it should be
> "(1 / 64) * 8 = 8".  In other words, because of the rounding difference
> we might allocate up to "sizeof(long) - 1" bytes fewer than intended.
>
> Fixes: 1ac5a4047975 ("RDMA/bnxt_re: Add bnxt_re RoCE driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/infiniband/hw/bnxt_re/qplib_rcfw.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/infiniband/hw/bnxt_re/qplib_rcfw.c b/drivers/infiniband/hw/bnxt_re/qplib_rcfw.c
> index 326805461265..742346ea5b0d 100644
> --- a/drivers/infiniband/hw/bnxt_re/qplib_rcfw.c
> +++ b/drivers/infiniband/hw/bnxt_re/qplib_rcfw.c
> @@ -684,8 +684,7 @@ int bnxt_qplib_enable_rcfw_channel(struct pci_dev *pdev,
>         /* General */
>         rcfw->seq_num = 0;
>         set_bit(FIRMWARE_FIRST_FLAG, &rcfw->flags);
> -       bmap_size = BITS_TO_LONGS(rcfw->cmdq_depth *
> -                                 sizeof(unsigned long));
> +       bmap_size = BITS_TO_LONGS(rcfw->cmdq_depth) * sizeof(unsigned long);
>         rcfw->cmdq_bitmap = kzalloc(bmap_size, GFP_KERNEL);
>         if (!rcfw->cmdq_bitmap)
>                 return -ENOMEM;
> --
> 2.17.1

Thanks for supplying this fix, it was on my list for my upcoming cleanup series.

Acked-By: Devesh Sharma <devesh.sharma@broadcom.com>
