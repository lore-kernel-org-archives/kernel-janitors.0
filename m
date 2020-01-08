From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 08 Jan 2020 05:46:29 +0000
Subject: [PATCH] selftests: Uninitialized variable in test_cgcore_proc_migration()
Message-Id: <20200108054629.jtq36feyhxsfhf6u@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shuah Khan <shuah@kernel.org>, Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>
Cc: Tejun Heo <tj@kernel.org>, Roman Gushchin <guro@fb.com>, Alex Shi <alex.shi@linux.alibaba.com>, linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org

The "c_threads" variable is used in the error handling code before it
has been initialized

Fixes: 11318989c381 ("selftests: cgroup: Add task migration tests")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 tools/testing/selftests/cgroup/test_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/cgroup/test_core.c b/tools/testing/selftests/cgroup/test_core.c
index c5ca669feb2b..e19ce940cd6a 100644
--- a/tools/testing/selftests/cgroup/test_core.c
+++ b/tools/testing/selftests/cgroup/test_core.c
@@ -369,7 +369,7 @@ static void *dummy_thread_fn(void *arg)
 static int test_cgcore_proc_migration(const char *root)
 {
 	int ret = KSFT_FAIL;
-	int t, c_threads, n_threads = 13;
+	int t, c_threads = 0, n_threads = 13;
 	char *src = NULL, *dst = NULL;
 	pthread_t threads[n_threads];
 
-- 
2.11.0
