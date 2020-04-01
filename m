From: Colin King <colin.king@canonical.com>
Date: Wed, 01 Apr 2020 23:27:36 +0000
Subject: [PATCH][next] net: atlantic: fix missing | operator when assigning rec->llc
Message-Id: <20200401232736.410028-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Igor Russkikh <irusskikh@marvell.com>, "David S . Miller" <davem@davemloft.net>, Mark Starovoytov <mstarovoitov@marvell.com>, Dmitry Bogdanov <dbogdanov@marvell.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

rec->llc is currently being assigned twice, once with the lower 8 bits
from packed_record[8] and then re-assigned afterwards with data from
packed_record[9].  This looks like a type, I believe the second assignment
should be using the |= operator rather than a direct assignment.

Addresses-Coverity: ("Unused value")
Fixes: b8f8a0b7b5cb ("net: atlantic: MACSec ingress offload HW bindings")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/net/ethernet/aquantia/atlantic/macsec/macsec_api.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/macsec/macsec_api.c b/drivers/net/ethernet/aquantia/atlantic/macsec/macsec_api.c
index 97901c114bfa..fbe9d88b13c7 100644
--- a/drivers/net/ethernet/aquantia/atlantic/macsec/macsec_api.c
+++ b/drivers/net/ethernet/aquantia/atlantic/macsec/macsec_api.c
@@ -491,7 +491,7 @@ get_ingress_preclass_record(struct aq_hw_s *hw,
 	rec->snap[1] = packed_record[8] & 0xFF;
 
 	rec->llc = (packed_record[8] >> 8) & 0xFF;
-	rec->llc = packed_record[9] << 8;
+	rec->llc |= packed_record[9] << 8;
 
 	rec->mac_sa[0] = packed_record[10];
 	rec->mac_sa[0] |= packed_record[11] << 16;
-- 
2.25.1
