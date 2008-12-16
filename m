From: Julia Lawall <julia@diku.dk>
Date: Tue, 16 Dec 2008 15:12:16 +0000
Subject: [PATCH 2/11] drivers/infiniband: Move a dereference below a NULL
Message-Id: <Pine.LNX.4.64.0812161611540.20444@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rolandd@cisco.com, sean.hefty@intel.com, hal.rosenstock@gmail.com, general@lists.openfabrics.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In each case, if the NULL test is necessary, then the dereference should be
moved below the NULL test.

The semantic patch that makes this change is as follows:
(http://www.emn.fr/x-info/coccinelle/)

// <smpl>
@@
type T;
expression E;
identifier i,fld;
statement S;
@@

- T i = E->fld;
+ T i;
  ... when != E
      when != i
  if (E = NULL) S
+ i = E->fld;
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/infiniband/hw/nes/nes_cm.c  |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/drivers/infiniband/hw/nes/nes_cm.c b/drivers/infiniband/hw/nes/nes_cm.c
index 2caf9da..2194ee2 100644
--- a/drivers/infiniband/hw/nes/nes_cm.c
+++ b/drivers/infiniband/hw/nes/nes_cm.c
@@ -376,13 +376,14 @@ int schedule_nes_timer(struct nes_cm_node *cm_node, struct sk_buff *skb,
 		int close_when_complete)
 {
 	unsigned long  flags;
-	struct nes_cm_core *cm_core = cm_node->cm_core;
+	struct nes_cm_core *cm_core;
 	struct nes_timer_entry *new_send;
 	int ret = 0;
 	u32 was_timer_set;
 
 	if (!cm_node)
 		return -EINVAL;
+	cm_core = cm_node->cm_core;
 	new_send = kzalloc(sizeof(*new_send), GFP_ATOMIC);
 	if (!new_send)
 		return -1;
