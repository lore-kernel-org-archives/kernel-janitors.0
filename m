From: Tanmay Inamdar <tinamdar@apm.com>
Date: Mon, 30 Jan 2017 23:17:22 +0000
Subject: Re: [patch] PCI: xgene: double free on init error
Message-Id: <CACoXjckjK9EE9g0H6GaWzGcm9ALwJd5sg5Xnik-tu47wLmCCkw@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170121044949.GB15269@mwanda> <20170130230322.GA20550@bhelgaas-glaptop.roam.corp.google.com>
In-Reply-To: <20170130230322.GA20550@bhelgaas-glaptop.roam.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Duc Dang <dhdang@apm.com>, Bjorn Helgaas <bhelgaas@google.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hi,

On Mon, Jan 30, 2017 at 3:03 PM, Bjorn Helgaas <helgaas@kernel.org> wrote:
>
> On Sat, Jan 21, 2017 at 07:49:49AM +0300, Dan Carpenter wrote:
> > The "port" variable was allocated with devm_kzalloc() so if we free it
> > with kfree() it will be freed twice.  Also I changed it to propogate the
> > error from devm_ioremap_resource() instead of returning -ENOMEM.
> >
> > Fixes: c5d460396100 ("PCI: Add MCFG quirks for X-Gene host controller")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> Waiting for Tanmay's ack, ping :)
>
> > diff --git a/drivers/pci/host/pci-xgene.c b/drivers/pci/host/pci-xgene.c
> > index 7c3b54b..142a166 100644
> > --- a/drivers/pci/host/pci-xgene.c
> > +++ b/drivers/pci/host/pci-xgene.c
> > @@ -246,14 +246,11 @@ static int xgene_pcie_ecam_init(struct pci_config_window *cfg, u32 ipversion)
> >       ret = xgene_get_csr_resource(adev, &csr);
> >       if (ret) {
> >               dev_err(dev, "can't get CSR resource\n");
> > -             kfree(port);
> >               return ret;
> >       }
> >       port->csr_base = devm_ioremap_resource(dev, &csr);
> > -     if (IS_ERR(port->csr_base)) {
> > -             kfree(port);
> > -             return -ENOMEM;
> > -     }
> > +     if (IS_ERR(port->csr_base))
> > +             return PTR_ERR(port->csr_base);
> >
> >       port->cfg_base = cfg->win;
> >       port->version = ipversion;

Sorry for delay. Patch looks good to me. Thanks.

Acked-by: Tanmay Inamdar <tinamdar@apm.com>

Thanks,
Tanmay
