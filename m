From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 14 Sep 2020 05:31:10 +0000
Subject: [PATCH] MAINTAINERS: make linux-mediatek list remarks consistent
Message-Id: <20200914053110.23286-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>

Commit 637cfacae96f ("PCI: mediatek: Add MediaTek PCIe host controller
support") does not mention that linux-mediatek@lists.infradead.org is
moderated for non-subscribers, but the other eight entries for
linux-mediatek@lists.infradead.org do.

Adjust this entry to be consistent with all others.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on v5.9-rc5 and next-20200911

Ryder, please ack.

Bjorn, Matthias, please pick this minor non-urgent clean-up patch.

This patch submission will also show me if linux-mediatek is moderated or
not. I have not subscribed to linux-mediatek and if it shows up quickly in
the archive, the list is probably not moderated; and if it takes longer, it
is moderated, and hence, validating the patch.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5e6e36542c62..83c83d7ef2a5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13485,7 +13485,7 @@ F:	drivers/pci/controller/dwc/pcie-histb.c
 PCIE DRIVER FOR MEDIATEK
 M:	Ryder Lee <ryder.lee@mediatek.com>
 L:	linux-pci@vger.kernel.org
-L:	linux-mediatek@lists.infradead.org
+L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Supported
 F:	Documentation/devicetree/bindings/pci/mediatek*
 F:	drivers/pci/controller/*mediatek*
-- 
2.17.1
