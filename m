From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 07 Oct 2016 19:43:56 +0000
Subject: [PATCH 0/2] [media] dvb-tc90522: Fine-tuning for two function implementations
Message-Id: <906cc86f-bac0-fd47-8a6f-d3310b10fd08@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Akihiro Tsukada <tskd08@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Ira Krufky <mkrufky@linuxtv.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 7 Oct 2016 21:38:12 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use kmalloc_array()
  Rename a jump label

 drivers/media/dvb-frontends/tc90522.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.10.1

