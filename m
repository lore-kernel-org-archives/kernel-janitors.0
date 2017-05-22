From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 09:13:49 +0000
Subject: [PATCH 2/3] net: pktgen: Delete an error message for a failed memory allocation in pktgen_create_thr
Message-Id: <19b7151b-ce0d-54a9-c079-4d17c31c2339@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <79472009-7764-bb92-5f29-60bb21793cec@users.sourceforge.net>
In-Reply-To: <79472009-7764-bb92-5f29-60bb21793cec@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, John Fastabend <john.fastabend@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 10:38:46 +0200

Omit an extra message for a memory allocation failure in this function.

This issue was detected by using the Coccinelle software.

Link: http://events.linuxfoundation.org/sites/events/files/slides/LCJ16-Refactor_Strings-WSang_0.pdf
Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 net/core/pktgen.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/net/core/pktgen.c b/net/core/pktgen.c
index c89f4ad21187..51008ddc7af6 100644
--- a/net/core/pktgen.c
+++ b/net/core/pktgen.c
@@ -3760,7 +3760,5 @@ static int __net_init pktgen_create_thread(int cpu, struct pktgen_net *pn)
-	if (!t) {
-		pr_err("ERROR: out of memory, can't create new thread\n");
+	if (!t)
 		return -ENOMEM;
-	}
 
 	mutex_init(&t->if_lock);
 	t->cpu = cpu;
-- 
2.13.0

