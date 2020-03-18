From: Bjorn Helgaas <helgaas@kernel.org>
Date: Wed, 18 Mar 2020 18:49:39 +0000
Subject: Re: [PATCH] MAINTAINERS: correct typo in new NXP LAYERSCAPE GEN4
Message-Id: <20200318184939.GA209856@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200314142559.13505-1-lukas.bulwahn@gmail.com>
References: <20200314142559.13505-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200314142559.13505-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, linux-arm-kernel@lists.infradead.org

On Sat, Mar 14, 2020 at 03:25:59PM +0100, Lukas Bulwahn wrote:
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
> applies cleanly on next-20200313
> 
> Hou, please ack.
> Rob, please pick this patch (it is not urgent, though).

3edeb49525bb ("dt-bindings: PCI: Add NXP Layerscape SoCs PCIe Gen4
controller") is on Lorenzo's pci/mobiveil branch and queued for v5.7.

But it hasn't been merged upstream yet, so we should squash this fix
into Lorenzo's branch so we don't need a fixup commit.

>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 32a95d162f06..77eede976d0f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12858,7 +12858,7 @@ L:	linux-pci@vger.kernel.org
>  L:	linux-arm-kernel@lists.infradead.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/pci/layerscape-pcie-gen4.txt
> -F:	drivers/pci/controller/mobibeil/pcie-layerscape-gen4.c
> +F:	drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
>  
>  PCI DRIVER FOR GENERIC OF HOSTS
>  M:	Will Deacon <will@kernel.org>
> 
> base-commit: 2e602db729948ce577bf07e2b113f2aa806b62c7
> -- 
> 2.17.1
> 
