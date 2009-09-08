From: Davidlohr Bueso <dave@gnu.org>
Date: Tue, 08 Sep 2009 04:26:55 +0000
Subject: [PATCH resend] s2io: Remove unnecessary casts
Message-Id: <1252384015.6396.11.camel@dbueso-pc>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi David,

Don't know why my email client corrupted the patch, anyways, here it is without white spaces.

No need to cast kmalloc.

Thanks,
Davidlohr


Signed-off-by: Davidlohr Bueso <dave@gnu.org>

---
 drivers/net/s2io.c |   12 ++++++++----
 1 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/s2io.c b/drivers/net/s2io.c
index 458daa0..2bc62d3 100644
--- a/drivers/net/s2io.c
+++ b/drivers/net/s2io.c
@@ -870,8 +870,10 @@ static int init_shared_mem(struct s2io_nic *nic)
 				while (k != rxd_count[nic->rxd_mode]) {
 					ba = &mac_control->rings[i].ba[j][k];
 
-					ba->ba_0_org = (void *) kmalloc
-					    (BUF0_LEN + ALIGN_SIZE, GFP_KERNEL);
+					ba->ba_0_org = kmalloc
+						(BUF0_LEN + ALIGN_SIZE,
+						 GFP_KERNEL);
+
 					if (!ba->ba_0_org)
 						return -ENOMEM;
 					mem_allocated +@@ -881,9 +883,10 @@ static int init_shared_mem(struct s2io_nic *nic)
 					tmp &= ~((unsigned long) ALIGN_SIZE);
 					ba->ba_0 = (void *) tmp;
 
-					ba->ba_1_org = (void *) kmalloc
-					    (BUF1_LEN + ALIGN_SIZE, GFP_KERNEL);
+					ba->ba_1_org = kmalloc
+						(BUF1_LEN + ALIGN_SIZE,
+						 GFP_KERNEL);
+
 					if (!ba->ba_1_org)
 						return -ENOMEM;
 					mem_allocated
--
1.6.0.4


