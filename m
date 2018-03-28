From: Colin King <colin.king@canonical.com>
Date: Wed, 28 Mar 2018 10:07:01 +0000
Subject: [PATCH] samples/bpf: fix spelling mistake: "revieve" -> "receive"
Message-Id: <20180328100701.13289-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Trivial fix to spelling mistake in error message text

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 samples/bpf/cookie_uid_helper_example.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/bpf/cookie_uid_helper_example.c b/samples/bpf/cookie_uid_helper_example.c
index 9d751e209f31..8eca27e595ae 100644
--- a/samples/bpf/cookie_uid_helper_example.c
+++ b/samples/bpf/cookie_uid_helper_example.c
@@ -246,7 +246,7 @@ static void udp_client(void)
 		recv_len = recvfrom(s_rcv, &buf, sizeof(buf), 0,
 			     (struct sockaddr *)&si_me, &slen);
 		if (recv_len < 0)
-			error(1, errno, "revieve\n");
+			error(1, errno, "receive\n");
 		res = memcmp(&(si_other.sin_addr), &(si_me.sin_addr),
 			   sizeof(si_me.sin_addr));
 		if (res != 0)
-- 
2.15.1

