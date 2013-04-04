From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 04 Apr 2013 06:31:24 +0000
Subject: [patch] staging: csr: info leak in unifi_cfg_get_info()
Message-Id: <20130404063124.GB6494@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"cfg_ap_config" has a number of fields which are not cleared before we
copy them to the user.  I've added a memset() at the beginning to set
everything to zero.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/csr/unifi_sme.c b/drivers/staging/csr/unifi_sme.c
index 7d19e63..9029503 100644
--- a/drivers/staging/csr/unifi_sme.c
+++ b/drivers/staging/csr/unifi_sme.c
@@ -876,6 +876,8 @@ int unifi_cfg_get_info(unifi_priv_t *priv, unsigned char *arg)
             {
 #ifdef CSR_SUPPORT_WEXT_AP
                 uf_cfg_ap_config_t cfg_ap_config;
+
+		memset(&cfg_ap_config, 0, sizeof(cfg_ap_config));
                 cfg_ap_config.channel = priv->ap_config.channel;
                 cfg_ap_config.beaconInterval = priv->ap_mac_config.beaconInterval;
                 cfg_ap_config.wmmEnabled = priv->ap_mac_config.wmmEnabled;
