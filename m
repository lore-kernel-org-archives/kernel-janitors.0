From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 02 Feb 2018 20:08:42 +0000
Subject: [PATCH 0/2] HSI: ssi_protocol: Adjustments for two function implementations
Message-Id: <14dd4865-f983-ba7d-3068-f6450a8de7ea@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, "David S. Miller" <davem@davemloft.net>, Kees Cook <keescook@chromium.org>, Sebastian Reichel <sre@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 2 Feb 2018 21:03:45 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation in ssi_protocol_probe()
  Fix a typo in two comment lines

 drivers/hsi/clients/ssi_protocol.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

-- 
2.16.1

