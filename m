From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 14 Sep 2020 06:32:56 +0000
Subject: Re: [PATCH] MAINTAINERS: mark linux-samsung-soc list non-moderated
Message-Id: <alpine.DEB.2.21.2009140819130.17999@felia>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200914061353.17535-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200914061353.17535-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>, linux-samsung-soc@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Mon, 14 Sep 2020, Lukas Bulwahn wrote:

> In fifteen entries mentioning linux-samsung-soc@vger.kernel.org in
> MAINTAINERS, seven entries mention the list being moderated for
> non-subscribers and eight entries do not. Clearly only one can be right,
> though.
> 
> Joe Perches suggested that all vger.kernel.org are not moderated for
> non-subscribers.
> 
> Remove all the remarks from the entries following Joe's suggestion.
> 
> Link: https://lore.kernel.org/lkml/da6f30896a8fd78635b3ca454d77a5292a9aa76d.camel@perches.com/
> Suggested-by: Joe Perches <joe@perches.com>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
> applies cleanly on v5.9-rc5 and next-20200911
> 
> Krzysztof, please pick this minor non-urgent cleanup patch.
> 
> This patch submission will also show me if linux-samsung-soc is moderated
> or not. I have not subscribed to linux-samsung-soc and if it shows up
> quickly in the archive, the list is probably not moderated, and hence,
> validating the patch.
> 

The patch showed up within seconds in the archive:

https://lore.kernel.org/linux-samsung-soc/20200914061353.17535-1-lukas.bulwahn@gmail.com/


So, linux-samsung-soc seems not be moderated. So, this validates this 
patch.

Lukas
 
>  MAINTAINERS | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0d0862b19ce5..de8741d24cb0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2399,7 +2399,7 @@ ARM/SAMSUNG EXYNOS ARM ARCHITECTURES
>  M:	Kukjin Kim <kgene@kernel.org>
>  M:	Krzysztof Kozlowski <krzk@kernel.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> -L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
>  Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
>  F:	Documentation/arm/samsung/
> @@ -2441,7 +2441,7 @@ F:	drivers/media/platform/s5p-g2d/
>  
>  ARM/SAMSUNG S5P SERIES HDMI CEC SUBSYSTEM SUPPORT
>  M:	Marek Szyprowski <m.szyprowski@samsung.com>
> -L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/s5p-cec.txt
> @@ -13321,7 +13321,7 @@ PCI DRIVER FOR SAMSUNG EXYNOS
>  M:	Jingoo Han <jingoohan1@gmail.com>
>  L:	linux-pci@vger.kernel.org
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> -L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
>  F:	drivers/pci/controller/dwc/pci-exynos.c
>  
> @@ -13729,7 +13729,7 @@ M:	Tomasz Figa <tomasz.figa@gmail.com>
>  M:	Krzysztof Kozlowski <krzk@kernel.org>
>  M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> -L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
>  Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git
> @@ -15275,7 +15275,7 @@ F:	include/linux/mfd/samsung/
>  SAMSUNG S3C24XX/S3C64XX SOC SERIES CAMIF DRIVER
>  M:	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
>  L:	linux-media@vger.kernel.org
> -L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
>  F:	drivers/media/platform/s3c-camif/
>  F:	include/media/drv-intf/s3c_camif.h
> @@ -15324,7 +15324,7 @@ SAMSUNG SOC CLOCK DRIVERS
>  M:	Sylwester Nawrocki <s.nawrocki@samsung.com>
>  M:	Tomasz Figa <tomasz.figa@gmail.com>
>  M:	Chanwoo Choi <cw00.choi@samsung.com>
> -L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
>  S:	Supported
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git
>  F:	Documentation/devicetree/bindings/clock/exynos*.txt
> @@ -15338,7 +15338,7 @@ M:	Kukjin Kim <kgene@kernel.org>
>  M:	Krzysztof Kozlowski <krzk@kernel.org>
>  M:	Andi Shyti <andi@etezian.org>
>  L:	linux-spi@vger.kernel.org
> -L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/spi/spi-samsung.txt
>  F:	drivers/spi/spi-s3c*
> -- 
> 2.17.1
> 
> 
