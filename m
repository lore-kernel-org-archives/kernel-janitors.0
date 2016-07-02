From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 02 Jul 2016 19:00:36 +0000
Subject: [PATCH 0/2] Input-at32psif: Fine-tuning for OOM handling in psif_probe()
Message-Id: <4471604f-f401-bed9-39be-1aff2a92edf6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 2 Jul 2016 20:50:09 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Return directly after a failed kzalloc()
  Remove two OOM messages

 drivers/input/serio/at32psif.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

-- 
2.9.0

