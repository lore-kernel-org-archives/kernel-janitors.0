From: Rob Herring <robh@kernel.org>
Date: Thu, 07 May 2020 21:52:12 +0000
Subject: Re: [PATCH v2 RESEND] MAINTAINERS: correct typo in new NXP LAYERSCAPE GEN4
Message-Id: <20200507215212.GA6603@bogus>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200506052130.5780-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200506052130.5780-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, linux-arm-kernel@lists.infradead.org

On Wed,  6 May 2020 07:21:30 +0200, Lukas Bulwahn wrote:
> Commit 3edeb49525bb ("dt-bindings: PCI: Add NXP Layerscape SoCs PCIe Gen4
> controller") includes a new entry in MAINTAINERS, but slipped in a typo in
> one of the file entries.
> 
> Hence, since then, ./scripts/get_maintainer.pl --self-test complains:
> 
>   warning: no file matches F: \
>     drivers/pci/controller/mobibeil/pcie-layerscape-gen4.c
> 
> Correct the typo in PCI DRIVER FOR NXP LAYERSCAPE GEN4 CONTROLLER.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> Rob, please pick this patch (it is not urgent, though).
> 
> v1: https://lore.kernel.org/lkml/20200314142559.13505-1-lukas.bulwahn@gmail.com/
>   - already received: Reviewed-by: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
>   - Bjorn Helgaas' suggestion to squash this into commit 3edeb49525bb
>     ("dt-bindings: PCI: Add NXP Layerscape SoCs PCIe Gen4 controller") before
>     merging upstream did not happen.
> 
> v1 -> v2:
>   - v1 does not apply after reordering MAINTAINERS, i.e., commit 4400b7d68f6e
>     ("MAINTAINERS: sort entries by entry name") and commit 3b50142d8528
>     ("MAINTAINERS: sort field names for all entries").
>   - PATCH v2 applies on v5.7-rc1 now. Please pick v2 instead of v1.
> 
> v2-resend:
>   - resend of v2: https://lore.kernel.org/lkml/20200413070649.7014-1-lukas.bulwahn@gmail.com/ 
>   - still applies to v5.7-rc4 and next-20200505
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
