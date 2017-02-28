From: Colin King <colin.king@canonical.com>
Date: Tue, 28 Feb 2017 11:47:33 +0000
Subject: [PATCH] staging: wilc1000: add check for kmalloc allocation failure.
Message-Id: <20170228114733.20228-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Aditya Shankar <aditya.shankar@microchip.com>, Ganesh Krishna <ganesh.krishna@microchip.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Add a sanity check that wid.val has been allocated, fixes a null
pointer deference on stamac when calling ether_add_copy.

Detected by CoverityScan, CID#1369537 ("Dereference null return value")

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/wilc1000/host_interface.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/wilc1000/host_interface.c b/drivers/staging/wilc1000/host_interface.c
index c307cce..e83fa21 100644
--- a/drivers/staging/wilc1000/host_interface.c
+++ b/drivers/staging/wilc1000/host_interface.c
@@ -1928,6 +1928,8 @@ static s32 Handle_Get_InActiveTime(struct wilc_vif *vif,
 	wid.type = WID_STR;
 	wid.size = ETH_ALEN;
 	wid.val = kmalloc(wid.size, GFP_KERNEL);
+	if (!wid.val)
+		return -ENOMEM;
 
 	stamac = wid.val;
 	ether_addr_copy(stamac, strHostIfStaInactiveT->mac);
-- 
2.10.2

