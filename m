From: Lee Jones <lee.jones@linaro.org>
Date: Mon, 06 Jan 2014 11:01:45 +0000
Subject: Re: [PATCH 1/3] mfd: sta2x11-mfd: use named constants for pci_power_t values
Message-Id: <20140106110145.GM23772@lee--X1>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1388706031-22180-1-git-send-email-Julia.Lawall@lip6.fr>
 <1388706031-22180-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1388706031-22180-2-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: Samuel Ortiz <sameo@linux.intel.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 03 Jan 2014, Julia Lawall wrote:

> From: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
>=20
> // <smpl>
> @@
> expression pdev;
> @@
>=20
> pci_set_power_state(pdev,
> - 0
> + PCI_D0
>  )
> // </smpl>

I'm happy with the code and that you used Coccinelle to discover the
issue, but I feel a little more explanation would be helpful to
readers.

Why is (pci_power_t __force) 0 better than 0?

> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
>=20
> ---
>  drivers/mfd/sta2x11-mfd.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/mfd/sta2x11-mfd.c b/drivers/mfd/sta2x11-mfd.c
> index 0d42e40..5b72db0 100644
> --- a/drivers/mfd/sta2x11-mfd.c
> +++ b/drivers/mfd/sta2x11-mfd.c
> @@ -529,7 +529,7 @@ static int sta2x11_mfd_resume(struct pci_dev *pdev)
>  {
>  	int err;
> =20
> -	pci_set_power_state(pdev, 0);
> +	pci_set_power_state(pdev, PCI_D0);
>  	err =3D pci_enable_device(pdev);
>  	if (err)
>  		return err;
>=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
