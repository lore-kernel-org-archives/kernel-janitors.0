From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 20 Jan 2013 17:27:22 +0000
Subject: [patch v2] usb: gadget: precedence bug in show_requests()
Message-Id: <20130120172722.GA11248@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The intent here was to have parenthesis around the (ci->hw_ep_max / 2)
so that it counts like "0 1 2 0 1 2".  In the current code, the mod
operation happens first so it counts like "0 0 1 1 2 2".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: fixed the changelog.  mod and divide have the same precedence

diff --git a/drivers/usb/chipidea/debug.c b/drivers/usb/chipidea/debug.c
index 3bc244d..3cd223c 100644
--- a/drivers/usb/chipidea/debug.c
+++ b/drivers/usb/chipidea/debug.c
@@ -709,7 +709,7 @@ static ssize_t show_requests(struct device *dev, struct device_attribute *attr,
 
 			n += scnprintf(buf + n, PAGE_SIZE - n,
 					"EP=%02i: TD=%08X %s\n",
-					i % ci->hw_ep_max/2, (u32)req->dma,
+					i % (ci->hw_ep_max / 2), (u32)req->dma,
 					((i < ci->hw_ep_max/2) ? "RX" : "TX"));
 
 			for (j = 0; j < qSize; j++)
