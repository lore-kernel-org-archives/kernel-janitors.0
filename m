From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 04 May 2017 20:30:14 +0000
Subject: [PATCH 0/6] cxgb4: Fine-tuning for some function implementations
Message-Id: <a3216042-2461-b397-dfa1-1de178d58513@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, Casey Leedom <leedom@chelsio.com>, Ganesh Goudar <ganeshgr@chelsio.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 4 May 2017 22:23:45 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (6):
  Use seq_putc() in mboxlog_show()
  Combine substrings for 24 messages
  Adjust five checks for null pointers
  Replace seven seq_puts() calls by seq_putc()
  Use seq_puts() in cim_qcfg_show()
  Combine substrings for two messages

 drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.c |  42 +++----
 .../net/ethernet/chelsio/cxgb4vf/cxgb4vf_main.c    | 125 ++++++++++++---------
 2 files changed, 86 insertions(+), 81 deletions(-)

-- 
2.12.2

