From: Karol Herbst <nouveau@karolherbst.de>
Date: Wed, 13 Jan 2016 12:30:10 +0000
Subject: Re: [patch] drm/nouveau/pci: reversed condition in nvkm_pcie_set_link()
Message-Id: <2041787627.38787.1452688210630.JavaMail.open-xchange@www.ud-mail.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160113122152.GC19993@mwanda>
In-Reply-To: <20160113122152.GC19993@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, kernel-janitors <kernel-janitors@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>

Hi Dan,

yeah I also catched that. I assume something went wrong in the review process,
because I am sure I didn't added that "pci ||" check myself ;) but who knows,
maybe I was tired working with ben on that, cause it was like 4am while doing
the last polishing steps.

nvm, I already send a patch to the nouveau ML:
http://lists.freedesktop.org/archives/nouveau/2016-January/023772.html

I just tried to poke ben the last day like several times, but he didn't seem to
be there yesterday

> Dan Carpenter <dan.carpenter@oracle.com> hat am 13. Januar 2016 um 13:21
> geschrieben:
> 
> The condition is reversed so this function is a no-op.
> 
> Fixes: bcc19d9bf5cd ('drm/nouveau/pci: implement generic code for pcie speed
> change')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c
> index b32954f..d71e5db 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pci/pcie.c
> @@ -119,7 +119,7 @@ nvkm_pcie_set_link(struct nvkm_pci *pci, enum
> nvkm_pcie_speed speed, u8 width)
>  struct pci_bus *pbus;
>  int ret;
> 
> - if (pci || !pci_is_pcie(pci->pdev))
> + if (!pci || !pci_is_pcie(pci->pdev))
>  return 0;
>  pbus = pci->pdev->bus;

>
