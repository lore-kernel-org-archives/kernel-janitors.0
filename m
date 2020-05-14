From: Colin King <colin.king@canonical.com>
Date: Thu, 14 May 2020 12:15:29 +0000
Subject: [PATCH][next] selftest/bpf: fix spelling mistake "SIGALARM" -> "SIGALRM"
Message-Id: <20200514121529.259668-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Shuah Khan <shuah@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, Andrii Nakryiko <andriin@fb.com>, John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@chromium.org>, netdev@vger.kernel.org, bpf@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in an error message, fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/bpf/bench.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/bpf/bench.c b/tools/testing/selftests/bpf/bench.c
index 8c0dfbfe6088..14390689ef90 100644
--- a/tools/testing/selftests/bpf/bench.c
+++ b/tools/testing/selftests/bpf/bench.c
@@ -242,7 +242,7 @@ static void setup_timer()
 	last_time_ns = get_time_ns();
 	err = sigaction(SIGALRM, &sigalarm_action, NULL);
 	if (err < 0) {
-		fprintf(stderr, "failed to install SIGALARM handler: %d\n", -errno);
+		fprintf(stderr, "failed to install SIGALRM handler: %d\n", -errno);
 		exit(1);
 	}
 	timer_settings.it_interval.tv_sec = 1;
-- 
2.25.1
