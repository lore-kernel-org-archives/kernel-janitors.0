From: Alan Tull <atull@kernel.org>
Date: Thu, 27 Apr 2017 14:34:04 +0000
Subject: Re: [PATCH] fpga: region: Fix some error handling
Message-Id: <CANk1AXRwS_zBoPHf7YRAtu1Dje0_gVxYXrP718bA3-grUJgyQQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170427091345.a6vpeapnesey7k6d@mwanda>
In-Reply-To: <20170427091345.a6vpeapnesey7k6d@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

On Thu, Apr 27, 2017 at 4:13 AM, Dan Carpenter <dan.carpenter@oracle.com> w=
rote:

Hi Dan,

Thanks but this fix is already in linux-next:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit?=
id=E73bbf64907c88d3bb811756fc25548131524035

Alan

> We need to release some resources if fpga_region_get_manager() fails.
>
> Fixes: 0fa20cdfcc1f ("fpga: fpga-region: device tree control for FPGA")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/fpga/fpga-region.c b/drivers/fpga/fpga-region.c
> index ae4c61aada99..3b6b2f4182a1 100644
> --- a/drivers/fpga/fpga-region.c
> +++ b/drivers/fpga/fpga-region.c
> @@ -245,7 +245,8 @@ static int fpga_region_program_fpga(struct fpga_regio=
n *region,
>         mgr =3D fpga_region_get_manager(region);
>         if (IS_ERR(mgr)) {
>                 pr_err("failed to get fpga region manager\n");
> -               return PTR_ERR(mgr);
> +               ret =3D PTR_ERR(mgr);
> +               goto err_put_region;
>         }
>
>         ret =3D fpga_region_get_bridges(region, overlay);
> @@ -281,6 +282,7 @@ static int fpga_region_program_fpga(struct fpga_regio=
n *region,
>         fpga_bridges_put(&region->bridge_list);
>  err_put_mgr:
>         fpga_mgr_put(mgr);
> +err_put_region:
>         fpga_region_put(region);
>
>         return ret;
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
