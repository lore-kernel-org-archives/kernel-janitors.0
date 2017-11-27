From: Colin King <colin.king@canonical.com>
Date: Mon, 27 Nov 2017 13:24:15 +0000
Subject: [PATCH] atm: fore200e: use %pK to format kernel addresses instead of %x
Message-Id: <20171127132415.10753-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chas Williams <3chas3@gmail.com>, linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Don't use %x and casting to print out a kernel address, instead use the
%pK and remove the casting.  Cleans up smatch warning:

drivers/atm/fore200e.c:3093 fore200e_proc_read() warn: argument 3 to %08x
specifier is cast from pointer

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/atm/fore200e.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/atm/fore200e.c b/drivers/atm/fore200e.c
index 126855e6cb7d..6ebc4e4820fc 100644
--- a/drivers/atm/fore200e.c
+++ b/drivers/atm/fore200e.c
@@ -3083,8 +3083,8 @@ fore200e_proc_read(struct atm_dev *dev, loff_t* pos, char* page)
 	    ASSERT(fore200e_vcc);
 
 	    len = sprintf(page,
-			  "  %08x  %03d %05d %1d   %09lu %05d/%05d      %09lu %05d/%05d\n",
-			  (u32)(unsigned long)vcc,
+			  "  %pK  %03d %05d %1d   %09lu %05d/%05d      %09lu %05d/%05d\n",
+			  vcc,
 			  vcc->vpi, vcc->vci, fore200e_atm2fore_aal(vcc->qos.aal),
 			  fore200e_vcc->tx_pdu,
 			  fore200e_vcc->tx_min_pdu > 0xFFFF ? 0 : fore200e_vcc->tx_min_pdu,
-- 
2.14.1

