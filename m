From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 02 Feb 2015 10:22:36 +0000
Subject: [PATCH v3 0/3] netlabel: Deletion of a few unnecessary checks
Message-Id: <54CF4FEC.2010906@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <54CD4B5F.9010502@users.sourceforge.net>	<CAHC9VhQ5C32zRqG0emVUoMmuvBsV+TXvdNn+54iVyCPBNk9dDQ@mail.gmail.com>	<54CDFCDA.9010802@users.sourceforge.net> <20150201.123054.366525761630045391.davem@davemloft.net>
In-Reply-To: <20150201.123054.366525761630045391.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>, Paul Moore <paul@paul-moore.com>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 2 Feb 2015 11:15:56 +0100

Further update suggestions were taken into account after patches were applied
from static source code analysis.

Markus Elfring (3):
  Deletion of an unnecessary check before the function call "cipso_v4_doi_putdef"
  Deletion of an unnecessary check before the function call "cipso_v4_doi_free"
  Less function calls in netlbl_mgmt_add_common() after error detection

 net/netlabel/netlabel_cipso_v4.c |  3 +--
 net/netlabel/netlabel_mgmt.c     | 50 +++++++++++++++++++---------------------
 2 files changed, 25 insertions(+), 28 deletions(-)

-- 
2.2.2

