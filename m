From: Bjorn Helgaas <helgaas@kernel.org>
Date: Thu, 27 Feb 2020 21:52:06 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust entry to moving cadence drivers
Message-Id: <20200227215206.GA146772@google.com>
List-Id: <kernel-janitors.vger.kernel.org>
In-Reply-To: <20200221185402.4703-1-lukas.bulwahn@gmail.com>
References: <20200221185402.4703-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200221185402.4703-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Tom Joseph <tjoseph@cadence.com>, Andrew Murray <andrew.murray@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Feb 21, 2020 at 07:54:02PM +0100, Lukas Bulwahn wrote:
> Commit de80f95ccb9c ("PCI: cadence: Move all files to per-device cadence
> directory") moved files of the pci cadence drivers, but did not adjust
> the entry in MAINTAINERS.
> 
> Since then, ./scripts/get_maintainer.pl --self-test complains:
> 
>   warning: no file matches F: drivers/pci/controller/pcie-cadence*
> 
> So, repair the MAINTAINERS entry now.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Applied to for-linus for v5.6, thanks!

> ---
> Tom, Andrew, please ack. Lorenzo, please pick this patch.
> applies cleanly on current master and next-20200221
> 
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4beb8dc4c7eb..d8f690f0e838 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12740,7 +12740,7 @@ M:	Tom Joseph <tjoseph@cadence.com>
>  L:	linux-pci@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/pci/cdns,*.txt
> -F:	drivers/pci/controller/pcie-cadence*
> +F:	drivers/pci/controller/cadence/
>  
>  PCI DRIVER FOR FREESCALE LAYERSCAPE
>  M:	Minghuan Lian <minghuan.Lian@nxp.com>
> -- 
> 2.17.1
> 
