From: Colin King <colin.king@canonical.com>
Date: Mon, 02 Nov 2020 12:06:14 +0000
Subject: [PATCH] mm/process_vm_access: remove redundant initialization of iov_r
Message-Id: <20201102120614.694917-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer iov_r is being initialized with a value that is never read
and it is being updated later with a new value.  The initialization is
redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 mm/process_vm_access.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/process_vm_access.c b/mm/process_vm_access.c
index 702250f148e7..4bcc11958089 100644
--- a/mm/process_vm_access.c
+++ b/mm/process_vm_access.c
@@ -260,7 +260,7 @@ static ssize_t process_vm_rw(pid_t pid,
 	struct iovec iovstack_l[UIO_FASTIOV];
 	struct iovec iovstack_r[UIO_FASTIOV];
 	struct iovec *iov_l = iovstack_l;
-	struct iovec *iov_r = iovstack_r;
+	struct iovec *iov_r;
 	struct iov_iter iter;
 	ssize_t rc;
 	int dir = vm_write ? WRITE : READ;
-- 
2.27.0
