From: Dan Carpenter <error27@gmail.com>
Date: Tue, 15 Mar 2011 07:03:24 +0000
Subject: [patch 2/2] iwlwifi: remove duplicate initialization in
Message-Id: <20110315070324.GR2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wey-Yi Guy <wey-yi.w.guy@intel.com>
Cc: Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

We initialize exit_pending twice.  It's the second initialization which
is correct.  That was added in d745d472af "iwlwifi: cancel scan when
down the device".

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/net/wireless/iwlwifi/iwl-agn.c b/drivers/net/wireless/iwlwifi/iwl-agn.c
index 321b18b..7adc60e 100644
--- a/drivers/net/wireless/iwlwifi/iwl-agn.c
+++ b/drivers/net/wireless/iwlwifi/iwl-agn.c
@@ -2537,7 +2537,7 @@ static void iwl_cancel_deferred_work(struct iwl_priv *priv);
 static void __iwl_down(struct iwl_priv *priv)
 {
 	unsigned long flags;
-	int exit_pending = test_bit(STATUS_EXIT_PENDING, &priv->status);
+	int exit_pending;
 
 	IWL_DEBUG_INFO(priv, DRV_NAME " is going down\n");
 
