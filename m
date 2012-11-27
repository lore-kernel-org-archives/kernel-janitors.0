From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 27 Nov 2012 17:29:35 +0000
Subject: [patch] atm: forever loop loading ambassador firmware
Message-Id: <20121127172935.GB1059@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <chas@cmf.nrl.navy.mil>, David Woodhouse <dwmw2@infradead.org>
Cc: linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

There was a forever loop introduced here when we converted this to
request_firmware() back in 2008.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
Spotted in code reading.  Untested.

diff --git a/drivers/atm/ambassador.c b/drivers/atm/ambassador.c
index 89b30f3..ff7bb8a 100644
--- a/drivers/atm/ambassador.c
+++ b/drivers/atm/ambassador.c
@@ -1961,6 +1961,7 @@ static int __devinit ucode_init (loader_block * lb, amb_dev * dev) {
     res = loader_verify(lb, dev, rec);
     if (res)
       break;
+    rec = ihex_next_binrec(rec);
   }
   release_firmware(fw);
   if (!res)
