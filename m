From: Davidlohr Bueso <dave@gnu.org>
Date: Fri, 14 Aug 2009 02:03:28 +0000
Subject: [PATCH] s2io: Remove unnecessary casts
Message-Id: <20090814020328.GA21588@fencepost.gnu.org>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ram.vepa@neterion.com, santosh.rastapur@neterion.com, sivakumar.subramani@neterion.com, sreenivasa.honnur@neterion.com, anil.murthy@neterion.com
Cc: netdev@vger.kernel.org, kernel-janitors@vger.kernel.org


No need to cast kmalloc.

Signed-off-by: Davidlohr Bueso <dave@gnu.org>

---
 drivers/net/s2io.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/net/s2io.c b/drivers/net/s2io.c
index 458daa0..43a5abf 100644
--- a/drivers/net/s2io.c
+++ b/drivers/net/s2io.c
@@ -870,8 +870,7 @@ static int init_shared_mem(struct s2io_nic *nic)
                                while (k != rxd_count[nic->rxd_mode]) {
                                        ba = &mac_control->rings[i].ba[j][k];
 
-                                       ba->ba_0_org = (void *) kmalloc
-                                           (BUF0_LEN + ALIGN_SIZE, GFP_KERNEL);
+                                       ba->ba_0_org = kmalloc(BUF0_LEN + ALIGN_SIZE, GFP_KERNEL);
                                        if (!ba->ba_0_org)
                                                return -ENOMEM;
                                        mem_allocated +@@ -881,8 +880,7 @@ static int init_shared_mem(struct s2io_nic *nic)
                                        tmp &= ~((unsigned long) ALIGN_SIZE);
                                        ba->ba_0 = (void *) tmp;
 
-                                       ba->ba_1_org = (void *) kmalloc
-                                           (BUF1_LEN + ALIGN_SIZE, GFP_KERNEL);
+                                       ba->ba_1_org = kmalloc(BUF1_LEN + ALIGN_SIZE, GFP_KERNEL);
                                        if (!ba->ba_1_org)
                                                return -ENOMEM;
                                        mem_allocated
