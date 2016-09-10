From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 07:15:37 +0000
Subject: [PATCH 0/5] ATM-nicstar: Fine-tuning for three function implementations
Message-Id: <fe480e1f-285a-bb98-3550-b4fa354f8174@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-atm-general@lists.sourceforge.net, netdev@vger.kernel.org, Chas Williams <3chas3@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Sep 2016 09:10:01 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Use kmalloc_array() in get_scq()
  Improve another size determination in get_scq()
  Improve another size determination in ns_init_card()
  Refactor a kmalloc() call in ns_init_card()
  Refactor a dev_alloc_skb() call in dequeue_rx()

 drivers/atm/nicstar.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

-- 
2.10.0

