From: Colin King <colin.king@canonical.com>
Date: Mon, 14 Dec 2020 22:35:39 +0000
Subject: [PATCH][next] selftests/bpf: fix spelling mistake "tranmission" -> "transmission"
Message-Id: <20201214223539.83168-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200826085907.43095-1-colin.king@canonical.com>
In-Reply-To: <20200826085907.43095-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, Shuah Khan <shuah@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, netdev@vger.kernel.org, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There are two spelling mistakes in output messages. Fix these.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 tools/testing/selftests/bpf/xdpxceiver.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/xdpxceiver.c b/tools/testing/selftests/bpf/xdpxceiver.c
index 014dedaa4dd2..1e722ee76b1f 100644
--- a/tools/testing/selftests/bpf/xdpxceiver.c
+++ b/tools/testing/selftests/bpf/xdpxceiver.c
@@ -715,7 +715,7 @@ static void worker_pkt_dump(void)
 		int payload = *((uint32_t *)(pkt_buf[iter]->payload + PKT_HDR_SIZE));
 
 		if (payload = EOT) {
-			ksft_print_msg("End-of-tranmission frame received\n");
+			ksft_print_msg("End-of-transmission frame received\n");
 			fprintf(stdout, "---------------------------------------\n");
 			break;
 		}
@@ -747,7 +747,7 @@ static void worker_pkt_validate(void)
 			}
 
 			if (payloadseqnum = EOT) {
-				ksft_print_msg("End-of-tranmission frame received: PASS\n");
+				ksft_print_msg("End-of-transmission frame received: PASS\n");
 				sigvar = 1;
 				break;
 			}
-- 
2.29.2
