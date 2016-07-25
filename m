From: Bjorn Helgaas <helgaas@kernel.org>
Date: Mon, 25 Jul 2016 17:29:33 +0000
Subject: Re: [PATCH] PCI: xilinx: Fix return value in case of error
Message-Id: <20160725172933.GB12484@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1468491046-1427-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1468491046-1427-1-git-send-email-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

On Thu, Jul 14, 2016 at 12:10:46PM +0200, Christophe JAILLET wrote:
> In function 'xilinx_pcie_init_irq_domain', the pattern used to check and
> return error is:
>=20
>    if (!var) {
>       dev_err(...);
>       return PTR_ERR(var);
>    }
>=20
> So the returned value in case of error is always 0, which means 'success'.
> Change it to return -ENODEV instead.
>=20
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Applied with S=F6ren's ack to pci/host-xilinx for v4.8, thanks!

> ---
>  drivers/pci/host/pcie-xilinx.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/pci/host/pcie-xilinx.c b/drivers/pci/host/pcie-xilin=
x.c
> index 4703aa3..a30e016 100644
> --- a/drivers/pci/host/pcie-xilinx.c
> +++ b/drivers/pci/host/pcie-xilinx.c
> @@ -550,7 +550,7 @@ static int xilinx_pcie_init_irq_domain(struct xilinx_=
pcie_port *port)
>  	pcie_intc_node =3D of_get_next_child(node, NULL);
>  	if (!pcie_intc_node) {
>  		dev_err(dev, "No PCIe Intc node found\n");
> -		return PTR_ERR(pcie_intc_node);
> +		return -ENODEV;
>  	}
> =20
>  	port->irq_domain =3D irq_domain_add_linear(pcie_intc_node, 4,
> @@ -558,7 +558,7 @@ static int xilinx_pcie_init_irq_domain(struct xilinx_=
pcie_port *port)
>  						 port);
>  	if (!port->irq_domain) {
>  		dev_err(dev, "Failed to get a INTx IRQ domain\n");
> -		return PTR_ERR(port->irq_domain);
> +		return -ENODEV;
>  	}
> =20
>  	/* Setup MSI */
> @@ -569,7 +569,7 @@ static int xilinx_pcie_init_irq_domain(struct xilinx_=
pcie_port *port)
>  							 &xilinx_pcie_msi_chip);
>  		if (!port->irq_domain) {
>  			dev_err(dev, "Failed to get a MSI IRQ domain\n");
> -			return PTR_ERR(port->irq_domain);
> +			return -ENODEV;
>  		}
> =20
>  		xilinx_pcie_enable_msi(port);
> --=20
> 2.7.4
>=20
>=20
> ---
> L'absence de virus dans ce courrier =E9lectronique a =E9t=E9 v=E9rifi=E9e=
 par le logiciel antivirus Avast.
> https://www.avast.com/antivirus
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
