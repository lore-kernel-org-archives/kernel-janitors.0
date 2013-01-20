From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 20 Jan 2013 14:50:44 +0000
Subject: [patch] usb: gadget: precedence bug in show_requests()
Message-Id: <20130120145044.GA32551@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The mod operation has higher precedence than the divide but the intent
was to divide first.  It's supposed to count through one time for RX
and a second time for TX but instead of doing "0 1 2 0 1 2" it does
"0 0 1 1 2 2".

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Static checker stuff.  Untested.

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
