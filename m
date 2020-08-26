From: Colin King <colin.king@canonical.com>
Date: Wed, 26 Aug 2020 08:59:07 +0000
Subject: [PATCH][next] selftests/bpf: fix spelling mistake "scoket" -> "socket"
Message-Id: <20200826085907.43095-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Jiri Olsa <jolsa@kernel.org>, linux-kselftest@vger.kernel.org, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake an a check error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/bpf/prog_tests/d_path.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/prog_tests/d_path.c b/tools/testing/selftests/bpf/prog_tests/d_path.c
index 058765da17e6..4ce2bb799afb 100644
--- a/tools/testing/selftests/bpf/prog_tests/d_path.c
+++ b/tools/testing/selftests/bpf/prog_tests/d_path.c
@@ -38,7 +38,7 @@ static int trigger_fstat_events(pid_t pid)
 		return ret;
 	/* unmountable pseudo-filesystems */
 	sockfd = socket(AF_INET, SOCK_STREAM, 0);
-	if (CHECK(sockfd < 0, "trigger", "scoket failed\n"))
+	if (CHECK(sockfd < 0, "trigger", "socket failed\n"))
 		goto out_close;
 	/* mountable pseudo-filesystems */
 	procfd = open("/proc/self/comm", O_RDONLY);
-- 
2.27.0
