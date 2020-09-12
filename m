From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Sat, 12 Sep 2020 12:13:46 +0000
Subject: [PATCH] MAINTAINERS: make linux-usb list remarks consistent
Message-Id: <20200912121346.2796-1-lukas.bulwahn@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, Joe Perches <joe@perches.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>

Commit f24f27b85ead ("MAINTAINERS: add entry for mediatek usb3 DRD IP
driver") claims linux-usb@vger.kernel.org is moderated for
non-subscribers, but all other 46 entries for linux-usb@vger.kernel.org
do not mention that.

Adjust this entry to be consistent with all others.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
applies cleanly on current master and next-20200911

Greg, please pick this minor non-urgent clean-up patch for your -next tree.

This patch submission will also show me if linux-usb is moderated or not.
I have not subscribed to linux-usb and if it shows up quickly in the
archive, the list is probably not moderated, and hence, validating the
patch.

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 26af84f97353..4396a8986518 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11112,7 +11112,7 @@ F:	net/dsa/tag_mtk.c
 
 MEDIATEK USB3 DRD IP DRIVER
 M:	Chunfeng Yun <chunfeng.yun@mediatek.com>
-L:	linux-usb@vger.kernel.org (moderated for non-subscribers)
+L:	linux-usb@vger.kernel.org
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-- 
2.17.1
