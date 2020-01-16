From: Colin King <colin.king@canonical.com>
Date: Thu, 16 Jan 2020 09:29:03 +0000
Subject: [PATCH] selftests: fix spelling mistaked "chaigned" -> "chained"
Message-Id: <20200116092903.52690-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shuah Khan <shuah@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, Aleksa Sarai <cyphar@cyphar.com>, linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a literal string, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/openat2/resolve_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/openat2/resolve_test.c b/tools/testing/selftests/openat2/resolve_test.c
index 7a94b1da8e7b..bbafad440893 100644
--- a/tools/testing/selftests/openat2/resolve_test.c
+++ b/tools/testing/selftests/openat2/resolve_test.c
@@ -230,7 +230,7 @@ void test_openat2_opath_tests(void)
 		{ .name = "[in_root] garbage link to /root",
 		  .path = "cheeky/garbageself",	.how.resolve = RESOLVE_IN_ROOT,
 		  .out.path = "root",		.pass = true },
-		{ .name = "[in_root] chainged garbage links to /root",
+		{ .name = "[in_root] chained garbage links to /root",
 		  .path = "abscheeky/garbageself", .how.resolve = RESOLVE_IN_ROOT,
 		  .out.path = "root",		.pass = true },
 		{ .name = "[in_root] relative path to 'root'",
-- 
2.24.0
