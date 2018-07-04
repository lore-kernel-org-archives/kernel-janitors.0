From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 04 Jul 2018 09:33:34 +0000
Subject: [PATCH] vmci: type promotion bug in qp_host_get_user_memory()
Message-Id: <20180704093332.xi5jq6w4cmmekx5c@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, George Zhang <georgezhang@vmware.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The problem is that if get_user_pages_fast() fails and returns a
negative error code, it gets type promoted to a high positive value and
treated as a success.

Fixes: 06164d2b72aa ("VMCI: queue pairs implementation.")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index b4d7774cfe07..d95e8648e7b3 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -668,7 +668,7 @@ static int qp_host_get_user_memory(u64 produce_uva,
 	retval = get_user_pages_fast((uintptr_t) produce_uva,
 				     produce_q->kernel_if->num_pages, 1,
 				     produce_q->kernel_if->u.h.header_page);
-	if (retval < produce_q->kernel_if->num_pages) {
+	if (retval < (int)produce_q->kernel_if->num_pages) {
 		pr_debug("get_user_pages_fast(produce) failed (retval=%d)",
 			retval);
 		qp_release_pages(produce_q->kernel_if->u.h.header_page,
@@ -680,7 +680,7 @@ static int qp_host_get_user_memory(u64 produce_uva,
 	retval = get_user_pages_fast((uintptr_t) consume_uva,
 				     consume_q->kernel_if->num_pages, 1,
 				     consume_q->kernel_if->u.h.header_page);
-	if (retval < consume_q->kernel_if->num_pages) {
+	if (retval < (int)consume_q->kernel_if->num_pages) {
 		pr_debug("get_user_pages_fast(consume) failed (retval=%d)",
 			retval);
 		qp_release_pages(consume_q->kernel_if->u.h.header_page,
