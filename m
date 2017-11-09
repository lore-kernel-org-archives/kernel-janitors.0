From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 09 Nov 2017 12:45:24 +0000
Subject: [PATCH] samples/sockmap: Fix duplicate error messages in sockmap_test_sockets()
Message-Id: <01568b12-0d05-2932-271c-6471ec94b0ba@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, "David S. Miller" <davem@davemloft.net>, John Fastabend <john.fastabend@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 9 Nov 2017 13:37:28 +0100

Duplicate error messages were used so far in this function implementation.
Make them unique instead.

This issue was detected by using the Coccinelle software.

Fixes: 69e8cc134bcbf0ccfcf852c400b8e6788d1d0038 ("bpf: sockmap sample program")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 samples/sockmap/sockmap_user.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/sockmap/sockmap_user.c b/samples/sockmap/sockmap_user.c
index 7cc9d228216f..c021f8a23d6c 100644
--- a/samples/sockmap/sockmap_user.c
+++ b/samples/sockmap/sockmap_user.c
@@ -117,7 +117,7 @@ static int sockmap_test_sockets(int rate, int dot)
 	addr.sin_port = htons(S2_PORT);
 	err = listen(s2, 32);
 	if (err < 0) {
-		perror("listen s1 failed()\n");
+		perror("listen s2 failed()\n");
 		goto out;
 	}
 
@@ -145,7 +145,7 @@ static int sockmap_test_sockets(int rate, int dot)
 
 	p2 = accept(s2, NULL, NULL);
 	if (p2 < 0) {
-		perror("accept s1 failed()\n");
+		perror("accept s2 failed()\n");
 		goto out;
 	}
 
-- 
2.15.0

