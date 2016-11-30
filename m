From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 30 Nov 2016 19:21:56 +0000
Subject: [patch] mwifiex: clean up some messy indenting
Message-Id: <20161130192156.GD28180@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Amitkumar Karwar <akarwar@marvell.com>, Karthik D A <karthida@marvell.com>
Cc: Nishant Sarmukadam <nishants@marvell.com>, Kalle Valo <kvalo@codeaurora.org>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

These lines were indented one tab extra.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
index f5dffdf..fdc6cc2 100644
--- a/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
+++ b/drivers/net/wireless/marvell/mwifiex/sta_cmd.c
@@ -1937,8 +1937,8 @@ int mwifiex_sta_prepare_cmd(struct mwifiex_private *priv, uint16_t cmd_no,
 		mwifiex_dbg(priv->adapter, ERROR,
 			    "0x%x command not supported by firmware\n",
 			    cmd_no);
-			return -EOPNOTSUPP;
-		}
+		return -EOPNOTSUPP;
+	}
 
 	/* Prepare command */
 	switch (cmd_no) {
