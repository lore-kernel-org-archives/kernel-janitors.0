From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Aug 2016 07:27:39 +0000
Subject: [PATCH 0/2] tun: Fine-tuning for update_filter()
Message-Id: <9cf06275-924d-6c22-d8a8-f733a03cca23@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Paolo Abeni <pabeni@redhat.com>, Soheil Hassas Yeganeh <soheil@google.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Aug 2016 09:16:16 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use memdup_user()
  Rename a jump label

 drivers/net/tun.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

-- 
2.9.3

