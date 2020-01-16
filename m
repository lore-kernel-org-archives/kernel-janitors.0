From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 16 Jan 2020 02:26:57 +0000
Subject: [PATCH net-next] sfc: remove duplicated include from efx.c
Message-Id: <20200116022657.161109-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200110013517.37685-1-yuehaibing@huawei.com>
In-Reply-To: <20200110013517.37685-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Solarflare linux maintainers <linux-net-drivers@solarflare.com>, Edward Cree <ecree@solarflare.com>, Martin Habets <mhabets@solarflare.com>, davem@davemloft.net
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/sfc/efx.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/efx.c b/drivers/net/ethernet/sfc/efx.c
index 110e485e6624..4481f21a1f43 100644
--- a/drivers/net/ethernet/sfc/efx.c
+++ b/drivers/net/ethernet/sfc/efx.c
@@ -27,7 +27,6 @@
 #include "efx_channels.h"
 #include "rx_common.h"
 #include "tx_common.h"
-#include "rx_common.h"
 #include "nic.h"
 #include "io.h"
 #include "selftest.h"
