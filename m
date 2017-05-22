From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 09:11:43 +0000
Subject: [PATCH 0/3] net-pktgen: Adjustments for some function implementations
Message-Id: <79472009-7764-bb92-5f29-60bb21793cec@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>, John Fastabend <john.fastabend@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 22 May 2017 11:01:23 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Improve four size determinations
  Delete an error message for a failed memory allocation in pktgen_create_thread()
  Adjust five checks for null pointers

 net/core/pktgen.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

-- 
2.13.0

