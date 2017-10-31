From: Colin King <colin.king@canonical.com>
Date: Tue, 31 Oct 2017 14:02:49 +0000
Subject: [PATCH] staging: android: ion: remove redundant variable table
Message-Id: <20171031140249.25280-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Laura Abbott <labbott@redhat.com>, Sumit Semwal <sumit.semwal@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, Riley Andrews <riandrews@android.com>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Variable table is being set but is never read, it is therefore
redundant and can be removed. Cleans up clang warning:

drivers/staging/android/ion/ion.c:112:2: warning: Value stored to 'table' is never read

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/staging/android/ion/ion.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/ion/ion.c
index 93e2c90fa77d..a7d9b0e98572 100644
--- a/drivers/staging/android/ion/ion.c
+++ b/drivers/staging/android/ion/ion.c
@@ -81,7 +81,6 @@ static struct ion_buffer *ion_buffer_create(struct ion_heap *heap,
 					    unsigned long flags)
 {
 	struct ion_buffer *buffer;
-	struct sg_table *table;
 	int ret;
 
 	buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
@@ -109,7 +108,6 @@ static struct ion_buffer *ion_buffer_create(struct ion_heap *heap,
 		goto err1;
 	}
 
-	table = buffer->sg_table;
 	buffer->dev = dev;
 	buffer->size = len;
 
-- 
2.14.1

