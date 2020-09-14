From: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 14 Sep 2020 09:25:36 +0000
Subject: Re: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
Message-Id: <f6bc41d3-5ce4-b9ea-e2bb-e0cee4de3179@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: Joe Perches <joe@perches.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org



On 14/09/2020 07:31, Lukas Bulwahn wrote:
> Commit 637cfacae96f ("PCI: mediatek: Add MediaTek PCIe host controller
> support") does not mention that linux-mediatek@lists.infradead.org is
> moderated for non-subscribers, but the other eight entries for
> linux-mediatek@lists.infradead.org do.
> 
> Adjust this entry to be consistent with all others.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Maybe rephrase the commit message to something like:
"Mark linux-mediatek@lists.infraded.org as moderated for the MediaTek PCIe host 
controller entry, as the list actually is moderated."

Anyway:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> applies cleanly on v5.9-rc5 and next-20200911
> 
> Ryder, please ack.
> 
> Bjorn, Matthias, please pick this minor non-urgent clean-up patch.
> 
> This patch submission will also show me if linux-mediatek is moderated or
> not. I have not subscribed to linux-mediatek and if it shows up quickly in
> the archive, the list is probably not moderated; and if it takes longer, it
> is moderated, and hence, validating the patch.

I can affirm the list is moderated :)

> 
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5e6e36542c62..83c83d7ef2a5 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -13485,7 +13485,7 @@ F:	drivers/pci/controller/dwc/pcie-histb.c
>   PCIE DRIVER FOR MEDIATEK
>   M:	Ryder Lee <ryder.lee@mediatek.com>
>   L:	linux-pci@vger.kernel.org
> -L:	linux-mediatek@lists.infradead.org
> +L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>   S:	Supported
>   F:	Documentation/devicetree/bindings/pci/mediatek*
>   F:	drivers/pci/controller/*mediatek*
> 
