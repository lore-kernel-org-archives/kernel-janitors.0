From: Colin King <colin.king@canonical.com>
Date: Thu, 05 Apr 2018 10:50:10 +0000
Subject: [PATCH] orangefs: make struct orangefs_file_vm_ops static
Message-Id: <20180405105010.11210-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, devel@lists.orangefs.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The struct orangefs_file_vm_ops is local to the source and does not need
to be in global scope, so make it static.

Cleans up sparse warning:
fs/orangefs/file.c:547:35: warning: symbol 'orangefs_file_vm_ops' was not
declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 fs/orangefs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/orangefs/file.c b/fs/orangefs/file.c
index 26358efbf794..84f44365bfb3 100644
--- a/fs/orangefs/file.c
+++ b/fs/orangefs/file.c
@@ -544,7 +544,7 @@ static int orangefs_fault(struct vm_fault *vmf)
 	return filemap_fault(vmf);
 }
 
-const struct vm_operations_struct orangefs_file_vm_ops = {
+static const struct vm_operations_struct orangefs_file_vm_ops = {
 	.fault = orangefs_fault,
 	.map_pages = filemap_map_pages,
 	.page_mkwrite = filemap_page_mkwrite,
-- 
2.15.1

