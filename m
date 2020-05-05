From: YueHaibing <yuehaibing@huawei.com>
Date: Tue, 05 May 2020 09:59:10 +0000
Subject: [PATCH net-next] net: ipa: remove duplicated include from ipa_mem.c
Message-Id: <20200505100307.191806-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Elder <elder@kernel.org>, "David S . Miller" <davem@davemloft.net>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ipa/ipa_mem.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
index aa8f6b0f3d50..3ef814119aab 100644
--- a/drivers/net/ipa/ipa_mem.c
+++ b/drivers/net/ipa/ipa_mem.c
@@ -17,7 +17,6 @@
 #include "ipa_data.h"
 #include "ipa_cmd.h"
 #include "ipa_mem.h"
-#include "ipa_data.h"
 #include "ipa_table.h"
 #include "gsi_trans.h"
