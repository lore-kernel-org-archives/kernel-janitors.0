From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 09 Jun 2012 15:57:19 +0000
Subject: [patch] iwlwifi: turn on a lockdep assertion
Message-Id: <20120609155718.GB6488@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Berg <johannes.berg@intel.com>
Cc: Wey-Yi Guy <wey-yi.w.guy@intel.com>, Intel Linux Wireless <ilw@linux.intel.com>, "John W. Linville" <linville@tuxdriver.com>, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

CMD_SYNC is zero so the if (cmd->flags & CMD_SYNC) is never true.  I
think it should be if (cmd->flags = CMD_SYNC).  This enables a lockdep
assertion.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/net/wireless/iwlwifi/iwl-agn-lib.c b/drivers/net/wireless/iwlwifi/iwl-agn-lib.c
index e55ec6c..c5ccdfa 100644
--- a/drivers/net/wireless/iwlwifi/iwl-agn-lib.c
+++ b/drivers/net/wireless/iwlwifi/iwl-agn-lib.c
@@ -1259,7 +1259,7 @@ int iwl_dvm_send_cmd(struct iwl_priv *priv, struct iwl_host_cmd *cmd)
 	 * the mutex, this ensures we don't try to send two
 	 * (or more) synchronous commands at a time.
 	 */
-	if (cmd->flags & CMD_SYNC)
+	if (cmd->flags = CMD_SYNC)
 		lockdep_assert_held(&priv->mutex);
 
 	if (priv->ucode_owner = IWL_OWNERSHIP_TM &&
