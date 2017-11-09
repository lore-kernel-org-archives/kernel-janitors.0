From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 09 Nov 2017 14:15:09 +0000
Subject: [PATCH] samples/sockmap: Make signal handling safer
Message-Id: <8e064bc1-c762-1ca6-4a67-9d50793753f6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, "David S. Miller" <davem@davemloft.net>, John Fastabend <john.fastabend@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 9 Nov 2017 15:06:16 +0100

Use the data type "sig_atomic_t" for the variable "running"
so that it can be safely modified by a signal handler.

Fixes: 69e8cc134bcbf0ccfcf852c400b8e6788d1d0038 ("bpf: sockmap sample program")
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 samples/sockmap/sockmap_user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/sockmap/sockmap_user.c b/samples/sockmap/sockmap_user.c
index 7cc9d228216f..6e3ebbb1f8f4 100644
--- a/samples/sockmap/sockmap_user.c
+++ b/samples/sockmap/sockmap_user.c
@@ -39,7 +39,7 @@
 #include "../bpf/bpf_util.h"
 #include "../bpf/libbpf.h"
 
-int running;
+static sig_atomic_t running;
 void running_handler(int a);
 
 /* randomly selected ports for testing on lo */
-- 
2.15.0

