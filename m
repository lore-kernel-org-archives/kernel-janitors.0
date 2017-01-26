From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Jan 2017 10:15:20 +0000
Subject: [PATCH 0/5] GTP: Fine-tuning for some function implementations
Message-Id: <698070a4-e08e-78e5-0214-df69783cce22@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>, "David S. Miller" <davem@davemloft.net>, Harald Welte <laforge@gnumonks.org>, Johannes Berg <johannes.berg@intel.com>, Pablo Neira <pablo@netfilter.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 26 Jan 2017 11:10:01 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (5):
  Use kmalloc_array() in gtp_hashtable_new()
  Improve another size determination in ipv4_pdp_add()
  Adjust 12 checks for null pointers
  Rename jump labels in gtp_encap_enable()
  Rename jump labels in gtp_hashtable_new()

 drivers/net/gtp.c | 46 ++++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

-- 
2.11.0

