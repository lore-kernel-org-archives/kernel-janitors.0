From: Colin King <colin.king@canonical.com>
Date: Wed, 02 May 2018 15:00:10 +0000
Subject: [PATCH] selftests: media_tests: fix spelling mistake: "iternations" -> "iterations"
Message-Id: <20180502150010.32333-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/media_tests/media_device_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/media_tests/media_device_test.c b/tools/testing/selftests/media_tests/media_device_test.c
index 421a367e4bb3..d8bb1e15d1d9 100644
--- a/tools/testing/selftests/media_tests/media_device_test.c
+++ b/tools/testing/selftests/media_tests/media_device_test.c
@@ -88,7 +88,7 @@ int main(int argc, char **argv)
 	       "other Oops in the dmesg. Enable KaSan kernel\n"
 	       "config option for use-after-free error detection.\n\n");
 
-	printf("Running test for %d iternations\n", count);
+	printf("Running test for %d iterations\n", count);
 
 	while (count > 0) {
 		ret = ioctl(fd, MEDIA_IOC_DEVICE_INFO, &mdi);
-- 
2.17.0

