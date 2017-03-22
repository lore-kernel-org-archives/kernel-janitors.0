From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 22 Mar 2017 11:19:50 +0000
Subject: [PATCH] vmci: Fix a couple integer overflow tests
Message-Id: <20170322111950.GA11279@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michal Hocko <mhocko@suse.com>, Jorgen Hansen <jhansen@vmware.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Andy King <acking@vmware.com>, Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

The "DIV_ROUND_UP(size, PAGE_SIZE)" operation can overflow if "size" is
more than ULLONG_MAX - PAGE_SIZE.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/misc/vmw_vmci/vmci_queue_pair.c b/drivers/misc/vmw_vmci/vmci_queue_pair.c
index 498c0854305f..06c4974ee8dd 100644
--- a/drivers/misc/vmw_vmci/vmci_queue_pair.c
+++ b/drivers/misc/vmw_vmci/vmci_queue_pair.c
@@ -298,8 +298,11 @@ static void *qp_alloc_queue(u64 size, u32 flags)
 	size_t pas_size;
 	size_t vas_size;
 	size_t queue_size = sizeof(*queue) + sizeof(*queue->kernel_if);
-	const u64 num_pages = DIV_ROUND_UP(size, PAGE_SIZE) + 1;
+	u64 num_pages;
 
+	if (size > SIZE_MAX - PAGE_SIZE)
+		return NULL;
+	num_pages = DIV_ROUND_UP(size, PAGE_SIZE) + 1;
 	if (num_pages >
 		 (SIZE_MAX - queue_size) /
 		 (sizeof(*queue->kernel_if->u.g.pas) +
@@ -624,9 +627,12 @@ static struct vmci_queue *qp_host_alloc_queue(u64 size)
 {
 	struct vmci_queue *queue;
 	size_t queue_page_size;
-	const u64 num_pages = DIV_ROUND_UP(size, PAGE_SIZE) + 1;
+	u64 num_pages;
 	const size_t queue_size = sizeof(*queue) + sizeof(*(queue->kernel_if));
 
+	if (size > SIZE_MAX - PAGE_SIZE)
+		return NULL;
+	num_pages = DIV_ROUND_UP(size, PAGE_SIZE) + 1;
 	if (num_pages > (SIZE_MAX - queue_size) /
 		 sizeof(*queue->kernel_if->u.h.page))
 		return NULL;
