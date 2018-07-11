From: Colin King <colin.king@canonical.com>
Date: Wed, 11 Jul 2018 10:59:11 +0000
Subject: [PATCH] staging: ks7010: remove redundant variable eth_proto
Message-Id: <20180711105911.30887-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sergio Paracuellos <sergio.paracuellos@gmail.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable eth_proto is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'eth_proto' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/ks7010/ks_hostif.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/ks7010/ks_hostif.c b/drivers/staging/ks7010/ks_hostif.c
index 0ecffab52ec2..a85975f63d26 100644
--- a/drivers/staging/ks7010/ks_hostif.c
+++ b/drivers/staging/ks7010/ks_hostif.c
@@ -354,7 +354,6 @@ void hostif_data_indication(struct ks_wlan_private *priv)
 	u16 auth_type;
 	unsigned char temp[256];
 	struct ether_hdr *eth_hdr;
-	unsigned short eth_proto;
 	struct ieee802_1x_hdr *aa1x_hdr;
 	size_t size;
 	int ret;
@@ -369,7 +368,6 @@ void hostif_data_indication(struct ks_wlan_private *priv)
 	get_word(priv);	/* Reserve Area */
 
 	eth_hdr = (struct ether_hdr *)(priv->rxp);
-	eth_proto = ntohs(eth_hdr->h_proto);
 
 	/* source address check */
 	if (ether_addr_equal(&priv->eth_addr[0], eth_hdr->h_source)) {
-- 
2.17.1

