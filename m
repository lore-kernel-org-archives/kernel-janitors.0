From: Dan Carpenter <error27@gmail.com>
Date: Wed, 26 May 2010 14:46:35 +0000
Subject: [patch 1/2] be2net: add unlock on error path
Message-Id: <20100526144634.GL22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sathya Perla <sathyap@serverengines.com>
Cc: Subbu Seetharaman <subbus@serverengines.com>, Sarveshwar Bandi <sarveshwarb@serverengines.com>, Ajit Khaparde <ajitk@serverengines.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

The unlock accidentally got removed from the error path in dd131e76e5:
"be2net: Bug fix to avoid disabling bottom half during firmware upgrade."

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/benet/be_cmds.c b/drivers/net/benet/be_cmds.c
index c911bfb..18d5789 100644
--- a/drivers/net/benet/be_cmds.c
+++ b/drivers/net/benet/be_cmds.c
@@ -1429,7 +1429,7 @@ int be_cmd_write_flashrom(struct be_adapter *adapter, struct be_dma_mem *cmd,
 	wrb = wrb_from_mccq(adapter);
 	if (!wrb) {
 		status = -EBUSY;
-		goto err;
+		goto err_unlock;
 	}
 	req = cmd->va;
 	sge = nonembedded_sgl(wrb);
@@ -1457,7 +1457,10 @@ int be_cmd_write_flashrom(struct be_adapter *adapter, struct be_dma_mem *cmd,
 	else
 		status = adapter->flash_status;
 
-err:
+	return status;
+
+err_unlock:
+	spin_unlock_bh(&adapter->mcc_lock);
 	return status;
 }
 
