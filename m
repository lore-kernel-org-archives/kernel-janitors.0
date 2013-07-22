From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 22 Jul 2013 08:00:53 +0000
Subject: [patch] staging/gdm72xx: potential use after free in send_qos_list()
Message-Id: <20130722080052.GF14617@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Sometimes free_qos_entry() sometimes frees its argument.  I have moved
the dereference of "entry" ahead on line to avoid a use after free.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/gdm72xx/gdm_qos.c b/drivers/staging/gdm72xx/gdm_qos.c
index b795353..cc36924 100644
--- a/drivers/staging/gdm72xx/gdm_qos.c
+++ b/drivers/staging/gdm72xx/gdm_qos.c
@@ -250,8 +250,8 @@ static void send_qos_list(struct nic *nic, struct list_head *head)
 
 	list_for_each_entry_safe(entry, n, head, list) {
 		list_del(&entry->list);
-		free_qos_entry(entry);
 		gdm_wimax_send_tx(entry->skb, entry->dev);
+		free_qos_entry(entry);
 	}
 }
 
