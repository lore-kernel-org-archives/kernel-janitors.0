From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 06 May 2017 16:12:46 +0000
Subject: [PATCH 0/2] batman-adv: Fine-tuning for three function implementations
Message-Id: <512d2e7c-0967-9303-2b68-6c9ef53d6ed2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: b.a.t.m.a.n@lists.open-mesh.org, netdev@vger.kernel.org, Antonio Quartulli <a@unstable.cc>, "David S. Miller" <davem@davemloft.net>, Marek Lindner <mareklindner@neomailbox.ch>, Simon Wunderlich <sw@simonwunderlich.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 6 May 2017 18:03:45 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Replace a seq_puts() call by seq_putc() in two functions
  Combine two seq_puts() calls into one call in batadv_nc_nodes_seq_print_text()

 net/batman-adv/bat_iv_ogm.c     | 2 +-
 net/batman-adv/bat_v.c          | 2 +-
 net/batman-adv/network-coding.c | 4 +---
 3 files changed, 3 insertions(+), 5 deletions(-)

-- 
2.12.2

