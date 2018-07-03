From: Colin King <colin.king@canonical.com>
Date: Tue, 03 Jul 2018 07:38:08 +0000
Subject: [PATCH] misc: vmci: remove redundant variable is_local
Message-Id: <20180703073808.29752-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable is_local is being assigned but is never used hence it is
redundant and can be removed.

Cleans up clang warning:
warning: variable 'is_local' set but not used [-Wunused-but-set-variable]

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/misc/vmw_vmci/vmci_queue_pair.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index b4d7774cfe07..9ee47244a308 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -2214,7 +2214,6 @@ int vmci_qp_broker_map(struct vmci_handle handle,
 {
 	struct qp_broker_entry *entry;
 	const u32 context_id = vmci_ctx_get_id(context);
-	bool is_local = false;
 	int result;
 
 	if (vmci_handle_is_invalid(handle) || !context ||
@@ -2243,7 +2242,6 @@ int vmci_qp_broker_map(struct vmci_handle handle,
 		goto out;
 	}
 
-	is_local = entry->qp.flags & VMCI_QPFLAG_LOCAL;
 	result = VMCI_SUCCESS;
 
 	if (context_id != VMCI_HOST_CONTEXT_ID) {
@@ -2325,7 +2323,6 @@ int vmci_qp_broker_unmap(struct vmci_handle handle,
 {
 	struct qp_broker_entry *entry;
 	const u32 context_id = vmci_ctx_get_id(context);
-	bool is_local = false;
 	int result;
 
 	if (vmci_handle_is_invalid(handle) || !context ||
@@ -2354,8 +2351,6 @@ int vmci_qp_broker_unmap(struct vmci_handle handle,
 		goto out;
 	}
 
-	is_local = entry->qp.flags & VMCI_QPFLAG_LOCAL;
-
 	if (context_id != VMCI_HOST_CONTEXT_ID) {
 		qp_acquire_queue_mutex(entry->produce_q);
 		result = qp_save_headers(entry);
-- 
2.17.1

