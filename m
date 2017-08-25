From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Fri, 25 Aug 2017 05:22:53 +0000
Subject: [PATCH] usb: chipidea: usb2: check memory allocation failure
Message-Id: <20170825052253.28472-1-christophe.jaillet@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter.Chen@nxp.com, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Check memory allocation failure and return -ENOMEM in such a case, as
already done few lines below for another memory allocation.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/usb/chipidea/ci_hdrc_usb2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_usb2.c b/drivers/usb/chipidea/ci_hdrc_usb2.c
index d162cc0bb8ce..99425db9ba62 100644
--- a/drivers/usb/chipidea/ci_hdrc_usb2.c
+++ b/drivers/usb/chipidea/ci_hdrc_usb2.c
@@ -52,6 +52,8 @@ static int ci_hdrc_usb2_probe(struct platform_device *pdev)
 
 	if (!ci_pdata) {
 		ci_pdata = devm_kmalloc(dev, sizeof(*ci_pdata), GFP_KERNEL);
+		if (!ci_pdata)
+			return -ENOMEM;
 		*ci_pdata = ci_default_pdata;	/* struct copy */
 	}
 
-- 
2.11.0

