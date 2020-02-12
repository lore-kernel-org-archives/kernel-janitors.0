From: Colin King <colin.king@canonical.com>
Date: Wed, 12 Feb 2020 10:38:29 +0000
Subject: [PATCH][next] selftests/resctrl: fix spelling mistake "Errror" -> "Error"
Message-Id: <20200212103829.41424-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Shuah Khan <shuah@kernel.org>, linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two spelling mistakes in error messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/resctrl/fill_buf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/resctrl/fill_buf.c b/tools/testing/selftests/resctrl/fill_buf.c
index 84d2a8b9657a..79c611c99a3d 100644
--- a/tools/testing/selftests/resctrl/fill_buf.c
+++ b/tools/testing/selftests/resctrl/fill_buf.c
@@ -181,7 +181,7 @@ fill_cache(unsigned long long buf_size, int malloc_and_init, int memflush,
 		ret = fill_cache_write(start_ptr, end_ptr, resctrl_val);
 
 	if (ret) {
-		printf("\n Errror in fill cache read/write...\n");
+		printf("\n Error in fill cache read/write...\n");
 		return -1;
 	}
 
@@ -205,7 +205,7 @@ int run_fill_buf(unsigned long span, int malloc_and_init_memory,
 	ret = fill_cache(cache_size, malloc_and_init_memory, memflush, op,
 			 resctrl_val);
 	if (ret) {
-		printf("\n Errror in fill cache\n");
+		printf("\n Error in fill cache\n");
 		return -1;
 	}
 
-- 
2.25.0
