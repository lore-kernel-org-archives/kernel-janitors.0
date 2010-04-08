From: Bart Van Assche <bvanassche@acm.org>
Date: Thu, 08 Apr 2010 10:13:42 +0000
Subject: Re: [patch] infiniband: checking the wrong variable
Message-Id: <g2ge2e108261004080313t32c2e1besd8a95e2f9bf418f9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100407093901.GG5157@bicker>
In-Reply-To: <20100407093901.GG5157@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <error27-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tejun Heo <tj-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Christoph Lameter <cl-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Jack Morgenstein <jackm-LDSdmyG8hGV8YrgS2mwiifqBs+8SCbDb@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

On Wed, Apr 7, 2010 at 11:39 AM, Dan Carpenter <error27@gmail.com> wrote:
> The intent here was to check the "mfrpl->mapped_page_list" allocation.
> We checked "mfrpl->ibfrpl.page_list" earlier.
>
> Signed-off-by: Dan Carpenter <error27@gmail.com>
>
> diff --git a/drivers/infiniband/hw/mlx4/mr.c b/drivers/infiniband/hw/mlx4=
/mr.c
> index 56147b2..1d27b9a 100644
> --- a/drivers/infiniband/hw/mlx4/mr.c
> +++ b/drivers/infiniband/hw/mlx4/mr.c
> @@ -240,7 +240,7 @@ struct ib_fast_reg_page_list *mlx4_ib_alloc_fast_reg_=
page_list(struct ib_device
> =A0 =A0 =A0 =A0mfrpl->mapped_page_list =3D dma_alloc_coherent(&dev->dev->=
pdev->dev,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 size, &mfrpl->map,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GFP_KERNEL);
> - =A0 =A0 =A0 if (!mfrpl->ibfrpl.page_list)
> + =A0 =A0 =A0 if (!mfrpl->mapped_page_list)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_free;
>
> =A0 =A0 =A0 =A0WARN_ON(mfrpl->map & 0x3f);

Hello Dan,

Have you already had the time to check whether this fix should be
backported to already released kernels, and if so, to which kernel
versions ? The easiest way to ask for backporting is to add "Cc:
<stable@kernel.org>" in a patch.

Bart.
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
