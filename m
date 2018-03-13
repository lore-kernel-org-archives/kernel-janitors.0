From: Colin King <colin.king@canonical.com>
Date: Tue, 13 Mar 2018 10:30:48 +0000
Subject: [PATCH][next] lib: make function test_ubsan_misaligned_access static
Message-Id: <20180313103048.28513-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>, Jinbum Park <jinb.park7@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The function test_ubsan_misaligned_access is local to the source and does
not need to be in global scope, so make it static.

Cleans up sparse warning:
lib/test_ubsan.c:91:6: warning: symbol 'test_ubsan_misaligned_access' was
not declared. Should it be static?

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 lib/test_ubsan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_ubsan.c b/lib/test_ubsan.c
index 58dedff36b17..280f4979d00e 100644
--- a/lib/test_ubsan.c
+++ b/lib/test_ubsan.c
@@ -88,7 +88,7 @@ static void test_ubsan_null_ptr_deref(void)
 	val = *ptr;
 }
 
-void test_ubsan_misaligned_access(void)
+static void test_ubsan_misaligned_access(void)
 {
 	volatile char arr[5] __aligned(4) = {1, 2, 3, 4, 5};
 	volatile int *ptr, val = 6;
-- 
2.15.1

