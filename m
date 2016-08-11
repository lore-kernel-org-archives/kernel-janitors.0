From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 11 Aug 2016 12:20:31 +0000
Subject: [PATCH v5 0/2] mfd: dm355evm_msp: Improve implementation of add_child()
Message-Id: <80dc4486-01d1-df66-c9c2-b71ee2251251@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>

Adjust jump targets together with three error messages.

Markus Elfring (2):
  Refactoring
  Change error messages

 drivers/mfd/dm355evm_msp.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

-- 
2.9.2

