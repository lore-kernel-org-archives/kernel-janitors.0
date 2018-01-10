From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 19:28:33 +0000
Subject: [PATCH 4/7] VMCI: Delete an unnecessary null pointer check in qp_broker_create()
Message-Id: <423462ca-25f1-3249-2609-ecfb0da6d987@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2747f123-a95d-bc68-b858-0327dce3758b@users.sourceforge.net>
In-Reply-To: <2747f123-a95d-bc68-b858-0327dce3758b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Alexey Dobriyan <adobriyan@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 10 Jan 2018 19:00:24 +0100

The exception handling code should usually only be reached with a valid
pointer in the local variable "entry" at the end of this function.
Thus remove an extra null pointer check here.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index 381e25c69c1f..7d4437240099 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -1434,12 +1434,9 @@ static int qp_broker_create(struct vmci_handle handle,
 	return VMCI_SUCCESS;
 
  error:
-	if (entry != NULL) {
-		qp_host_free_queue(entry->produce_q, guest_produce_size);
-		qp_host_free_queue(entry->consume_q, guest_consume_size);
-		kfree(entry);
-	}
-
+	qp_host_free_queue(entry->produce_q, guest_produce_size);
+	qp_host_free_queue(entry->consume_q, guest_consume_size);
+	kfree(entry);
 	return result;
 }
 
-- 
2.15.1

