From: YueHaibing <yuehaibing@huawei.com>
Date: Fri, 10 Jan 2020 01:35:17 +0000
Subject: [PATCH net-next] sfc: remove duplicated include from ef10.c
Message-Id: <20200110013517.37685-1-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S . Miller" <davem@davemloft.net>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jakub Kicinski <jakub.kicinski@netronome.com>
Cc: YueHaibing <yuehaibing@huawei.com>, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/net/ethernet/sfc/ef10.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/ethernet/sfc/ef10.c b/drivers/net/ethernet/sfc/ef10.c
index dc037dd927f8..fa460831af7d 100644
--- a/drivers/net/ethernet/sfc/ef10.c
+++ b/drivers/net/ethernet/sfc/ef10.c
@@ -16,7 +16,6 @@
 #include "workarounds.h"
 #include "selftest.h"
 #include "ef10_sriov.h"
-#include "rx_common.h"
 #include <linux/in.h>
 #include <linux/jhash.h>
 #include <linux/wait.h>
