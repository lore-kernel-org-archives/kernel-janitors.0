From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Aug 2016 16:43:16 +0000
Subject: [PATCH 0/3] hostap: Fine-tuning for a few functions
Message-Id: <f0cd7a82-e603-6a91-0afd-33bbd1658cab@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-wireless@vger.kernel.org, netdev@vger.kernel.org, Jouni Malinen <j@w1.fi>, Kalle Valo <kvalo@codeaurora.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 20 Aug 2016 18:35:43 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Use memdup_user()
  Delete an unnecessary jump label
  Delete unnecessary variable initialisations

 .../net/wireless/intersil/hostap/hostap_ioctl.c    | 36 ++++++++--------------
 1 file changed, 12 insertions(+), 24 deletions(-)

-- 
2.9.3

