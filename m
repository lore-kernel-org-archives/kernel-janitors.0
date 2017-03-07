From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 07 Mar 2017 19:32:07 +0000
Subject: Re: [patch] PCI: dwc: uninitialized variable in dw_handle_msi_irq()
Message-Id: <20170307192754.GC4120@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170217232618.GC26717@mwanda>
 <933041dd-288f-4cde-c10f-5b0b3ab49f15@synopsys.com>
 <20170307190955.GE21358@bhelgaas-glaptop.roam.corp.google.com>
In-Reply-To: <20170307190955.GE21358@bhelgaas-glaptop.roam.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Joao Pinto <Joao.Pinto@synopsys.com>, Jingoo Han <jingoohan1@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 07, 2017 at 01:09:55PM -0600, Bjorn Helgaas wrote:
> On Wed, Feb 22, 2017 at 03:08:07PM -0800, Joao Pinto wrote:
> > Hi Dan,
> >=20
> > =C0s 3:26 PM de 2/17/2017, Dan Carpenter escreveu:
> > > The bug is that "val" is unsigned long but we only initialize 32 bits
> > > of it.  Then we test "if (val)" and that might be true not because we
> > > set the bits but because some were never initialized.
> > >=20
> > > Fixes: f342d940ee0e ("PCI: exynos: Add support for MSI")
> > > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > > ---
> > > Static analysis.  Not tested.
> >=20
> > What you are statiting makes perfect sense, since the register is indee=
d 32 bits
> > and can have undesirable behavior in 64-bit systems for example.
> > We have more examples like this for MSI related operations in pcie-desi=
gnware.
> > Could you please change them as well just?
> >=20
> > For example, the irq variable declaration is also not consistent as you=
 can see
> > in these examples:
> >=20
> >  static void dw_msi_setup_msg(struct pcie_port *pp, unsigned int irq, u=
32 pos)
> >=20
> >  static int dw_pcie_msi_map(struct irq_domain *domain, unsigned int irq,
> >                            irq_hw_number_t hwirq)
> >=20
> >  static void dw_pcie_msi_clear_irq(struct pcie_port *pp, int irq)
> >=20
> >  static void dw_pcie_msi_set_irq(struct pcie_port *pp, int irq)
>=20
> Where are we with this?  It sounds like there's a real problem here,
> and Dan's original patch fixes one case of it.  But if there are other
> similar cases, we should fix them all at once.
>=20
> Since this doesn't sound like an urgent bug fix (I don't see user
> problem reports), I guess I'll wait for an updated patch?

Oh...  Hm.  I misread.  I thought that Joao was going to send a patch.

Looking at it more closely now, I think my patch is sufficient.  Perhaps
I have misunderstood something but I don't see any other bugs here
beyond the one I fixed.

regards,
dan carpenter


--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
