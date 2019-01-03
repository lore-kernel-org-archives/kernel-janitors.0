From: YueHaibing <yuehaibing@huawei.com>
Date: Thu, 03 Jan 2019 03:12:41 +0000
Subject: [PATCH -next] um: Remove duplicated include from vector_user.c
Message-Id: <1546485161-142907-1-git-send-email-yuehaibing@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, YueHaibing <yuehaibing@huawei.com>
Cc: linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Remove duplicated include.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/um/drivers/vector_user.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/um/drivers/vector_user.c b/arch/um/drivers/vector_user.c
index d2c17dd..b3f7b3c 100644
--- a/arch/um/drivers/vector_user.c
+++ b/arch/um/drivers/vector_user.c
@@ -16,14 +16,12 @@
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <fcntl.h>
-#include <sys/types.h>
 #include <sys/socket.h>
 #include <net/ethernet.h>
 #include <netinet/ip.h>
 #include <netinet/ether.h>
 #include <linux/if_ether.h>
 #include <linux/if_packet.h>
-#include <sys/socket.h>
 #include <sys/wait.h>
 #include <sys/uio.h>
 #include <linux/virtio_net.h>
@@ -31,7 +29,6 @@
 #include <stdlib.h>
 #include <os.h>
 #include <um_malloc.h>
-#include <sys/uio.h>
 #include "vector_user.h"
 
 #define ID_GRE 0
