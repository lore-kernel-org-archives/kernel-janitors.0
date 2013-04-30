From: Bjorn Helgaas <bhelgaas@google.com>
Date: Tue, 30 Apr 2013 16:45:35 +0000
Subject: Re: [patch] PCI: set ->mask_pos correctly
Message-Id: <CAErSpo64WyM=4c3WC8hy-xy2gNgWtkJVTqzawRU6d6=t6nxnoQ@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130430074454.GF7237@elgon.mountain>
In-Reply-To: <20130430074454.GF7237@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Tue, Apr 30, 2013 at 1:44 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The "+" operation has higher precedence than "?:" and ->msi_cap is
> always non-zero here so the original statement is equivalent to:
>
>         entry->mask_pos = PCI_MSI_MASK_64;
>
> Which wasn't the intent.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Ouch, my fault, sorry about that.  Thanks for finding this.  I put
this in my for-linus branch and will try to get this in before
v3.10-rc1.

How did you find this?  I guess MSI didn't work right on a device with
32-bit message address and per-vector masking?

Bjorn

> diff --git a/drivers/pci/msi.c b/drivers/pci/msi.c
> index d40bed7..2c10752 100644
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -563,8 +563,10 @@ static int msi_capability_init(struct pci_dev *dev, int nvec)
>         entry->msi_attrib.default_irq   = dev->irq;     /* Save IOAPIC IRQ */
>         entry->msi_attrib.pos           = dev->msi_cap;
>
> -       entry->mask_pos = dev->msi_cap + (control & PCI_MSI_FLAGS_64BIT) ?
> -               PCI_MSI_MASK_64 : PCI_MSI_MASK_32;
> +       if (control & PCI_MSI_FLAGS_64BIT)
> +               entry->mask_pos = dev->msi_cap + PCI_MSI_MASK_64;
> +       else
> +               entry->mask_pos = dev->msi_cap + PCI_MSI_MASK_32;
>         /* All MSIs are unmasked by default, Mask them all */
>         if (entry->msi_attrib.maskbit)
>                 pci_read_config_dword(dev, entry->mask_pos, &entry->masked);
