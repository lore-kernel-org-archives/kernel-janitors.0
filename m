From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Feb 2016 11:15:36 +0000
Subject: [patch] mwifiex: fix an indenting mistake
Message-Id: <20160209111536.GC23998@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amitkumar Karwar <akarwar@marvell.com>, Xinming Hu <huxm@marvell.com>
Cc: Nishant Sarmukadam <nishants@marvell.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We recently added an indent level here but missed this line.  It needs
another tab.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/marvell/mwifiex/pcie.c b/drivers/net/wireless/marvell/mwifiex/pcie.c
index cc07214..efb19e2 100644
--- a/drivers/net/wireless/marvell/mwifiex/pcie.c
+++ b/drivers/net/wireless/marvell/mwifiex/pcie.c
@@ -2452,7 +2452,7 @@ static void mwifiex_pcie_fw_dump(struct mwifiex_adapter *adapter)
 			for (i = 0; i < 4; i++) {
 				mwifiex_read_reg_byte(adapter, reg, &read_reg);
 				memory_size |= (read_reg << (i * 8));
-			reg++;
+				reg++;
 			}
 		} else {
 			memory_size = MWIFIEX_FW_DUMP_MAX_MEMSIZE;
