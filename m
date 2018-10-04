From: Colin King <colin.king@canonical.com>
Date: Thu, 04 Oct 2018 12:11:18 +0000
Subject: [PATCH][liquidio-next] liquidio: fix a couple of spelling mistakes
Message-Id: <20181004121118.18014-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Derek Chickles <derek.chickles@caviumnetworks.com>, Satanand Burla <satananda.burla@caviumnetworks.com>, Felix Manlunas <felix.manlunas@caviumnetworks.com>, Raghu Vatsavayi <raghu.vatsavayi@caviumnetworks.com>, "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistakes in dev_dbg warning messages

"Reloade" -> "Reload"
"chang" -> "change"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/cavium/liquidio/lio_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cavium/liquidio/lio_core.c b/drivers/net/ethernet/cavium/liquidio/lio_core.c
index eb96b0613cf6..825a28e5b544 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_core.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_core.c
@@ -1732,7 +1732,7 @@ int liquidio_set_fec(struct lio *lio, int on_off)
 	if (oct->props[lio->ifidx].fec ! 	    oct->props[lio->ifidx].fec_boot) {
 		dev_dbg(&oct->pci_dev->dev,
-			"Reloade driver to chang fec to %s\n",
+			"Reload driver to change fec to %s\n",
 			oct->props[lio->ifidx].fec ? "on" : "off");
 	}
 
@@ -1796,7 +1796,7 @@ int liquidio_get_fec(struct lio *lio)
 	if (oct->props[lio->ifidx].fec ! 	    oct->props[lio->ifidx].fec_boot) {
 		dev_dbg(&oct->pci_dev->dev,
-			"Reloade driver to chang fec to %s\n",
+			"Reload driver to change fec to %s\n",
 			oct->props[lio->ifidx].fec ? "on" : "off");
 	}
 
-- 
2.17.1
