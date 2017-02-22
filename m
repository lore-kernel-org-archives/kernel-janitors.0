From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Wed, 22 Feb 2017 23:08:07 +0000
Subject: Re: [patch] PCI: dwc: uninitialized variable in dw_handle_msi_irq()
Message-Id: <933041dd-288f-4cde-c10f-5b0b3ab49f15@synopsys.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170217232618.GC26717@mwanda>
In-Reply-To: <20170217232618.GC26717@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, Joao Pinto <Joao.Pinto@synopsys.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

=C0s 3:26 PM de 2/17/2017, Dan Carpenter escreveu:
> The bug is that "val" is unsigned long but we only initialize 32 bits
> of it.  Then we test "if (val)" and that might be true not because we
> set the bits but because some were never initialized.
>=20
> Fixes: f342d940ee0e ("PCI: exynos: Add support for MSI")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static analysis.  Not tested.

What you are statiting makes perfect sense, since the register is indeed 32=
 bits
and can have undesirable behavior in 64-bit systems for example.
We have more examples like this for MSI related operations in pcie-designwa=
re.
Could you please change them as well just?

For example, the irq variable declaration is also not consistent as you can=
 see
in these examples:

 static void dw_msi_setup_msg(struct pcie_port *pp, unsigned int irq, u32 p=
os)

 static int dw_pcie_msi_map(struct irq_domain *domain, unsigned int irq,
                           irq_hw_number_t hwirq)

 static void dw_pcie_msi_clear_irq(struct pcie_port *pp, int irq)

 static void dw_pcie_msi_set_irq(struct pcie_port *pp, int irq)

 etc.

Thanks
Joao

>=20
> diff --git a/drivers/pci/dwc/pcie-designware.c b/drivers/pci/dwc/pcie-des=
ignware.c
> index af8f6e92e885..5bfc377b83e4 100644
> --- a/drivers/pci/dwc/pcie-designware.c
> +++ b/drivers/pci/dwc/pcie-designware.c
> @@ -257,17 +257,18 @@ static struct irq_chip dw_msi_irq_chip =3D {
>  /* MSI int handler */
>  irqreturn_t dw_handle_msi_irq(struct pcie_port *pp)
>  {
> -	unsigned long val;
> +	u32 val;
>  	int i, pos, irq;
>  	irqreturn_t ret =3D IRQ_NONE;
> =20
>  	for (i =3D 0; i < MAX_MSI_CTRLS; i++) {
>  		dw_pcie_rd_own_conf(pp, PCIE_MSI_INTR0_STATUS + i * 12, 4,
> -				(u32 *)&val);
> +				    &val);
>  		if (val) {
>  			ret =3D IRQ_HANDLED;
>  			pos =3D 0;
> -			while ((pos =3D find_next_bit(&val, 32, pos)) !=3D 32) {
> +			while ((pos =3D find_next_bit((unsigned long *)&val, 32,
> +						    pos)) !=3D 32) {
>  				irq =3D irq_find_mapping(pp->irq_domain,
>  						i * 32 + pos);
>  				dw_pcie_wr_own_conf(pp,
>=20

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
