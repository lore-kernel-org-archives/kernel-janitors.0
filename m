From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sun, 12 Sep 2010 18:56:26 +0000
Subject: [PATCH] staging: batman-adv: check kmalloc() return value
Message-Id: <1284317791-4744-1-git-send-email-segooon@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@suse.de>, Andrew Lunn <andrew@lunn.ch>, Sven Eckelmann <sven.eckelmann@gmx.de>, Marek Lindner <lindner_marek@yahoo.de>, Simon Wunderlich <siwu@hrz.tu-chemnitz.de>, Andreas Langer <an.langer@gmx.de>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

kmalloc() may fail, if so drop current packet.

Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>
---
 Compile tested.

 drivers/staging/batman-adv/routing.c |    6 ++++--
 drivers/staging/batman-adv/unicast.c |    8 ++++++--
 drivers/staging/batman-adv/unicast.h |    2 +-
 3 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/batman-adv/routing.c b/drivers/staging/batman-adv/routing.c
index e12fd99..e545260 100644
--- a/drivers/staging/batman-adv/routing.c
+++ b/drivers/staging/batman-adv/routing.c
@@ -1232,8 +1232,10 @@ int recv_ucast_frag_packet(struct sk_buff *skb, struct batman_if *recv_if)
 
 		orig_node->last_frag_packet = jiffies;
 
-		if (list_empty(&orig_node->frag_list))
-			create_frag_buffer(&orig_node->frag_list);
+		if (list_empty(&orig_node->frag_list)) {
+			if (create_frag_buffer(&orig_node->frag_list))
+				return NET_RX_DROP;
+		}
 
 		tmp_frag_entry  			search_frag_packet(&orig_node->frag_list,
diff --git a/drivers/staging/batman-adv/unicast.c b/drivers/staging/batman-adv/unicast.c
index f951abc..f7d2206 100644
--- a/drivers/staging/batman-adv/unicast.c
+++ b/drivers/staging/batman-adv/unicast.c
@@ -78,7 +78,7 @@ void create_frag_entry(struct list_head *head, struct sk_buff *skb)
 	return;
 }
 
-void create_frag_buffer(struct list_head *head)
+int create_frag_buffer(struct list_head *head)
 {
 	int i;
 	struct frag_packet_list_entry *tfp;
@@ -86,13 +86,17 @@ void create_frag_buffer(struct list_head *head)
 	for (i = 0; i < FRAG_BUFFER_SIZE; i++) {
 		tfp = kmalloc(sizeof(struct frag_packet_list_entry),
 			GFP_ATOMIC);
+		if (tfp = NULL) {
+			frag_list_free(head);
+			return -ENOMEM;
+		}
 		tfp->skb = NULL;
 		tfp->seqno = 0;
 		INIT_LIST_HEAD(&tfp->list);
 		list_add(&tfp->list, head);
 	}
 
-	return;
+	return 0;
 }
 
 struct frag_packet_list_entry *search_frag_packet(struct list_head *head,
diff --git a/drivers/staging/batman-adv/unicast.h b/drivers/staging/batman-adv/unicast.h
index 1d5cbeb..7973697 100644
--- a/drivers/staging/batman-adv/unicast.h
+++ b/drivers/staging/batman-adv/unicast.h
@@ -30,7 +30,7 @@ struct sk_buff *merge_frag_packet(struct list_head *head,
 	struct sk_buff *skb);
 
 void create_frag_entry(struct list_head *head, struct sk_buff *skb);
-void create_frag_buffer(struct list_head *head);
+int create_frag_buffer(struct list_head *head);
 struct frag_packet_list_entry *search_frag_packet(struct list_head *head,
 	struct unicast_frag_packet *up);
 void frag_list_free(struct list_head *head);
-- 
1.7.0.4

