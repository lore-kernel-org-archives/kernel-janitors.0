From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 31 Aug 2017 19:55:37 +0000
Subject: [PATCH 0/3] [media] mb86a20s: Adjustments for mb86a20s_attach()
Message-Id: <9571ee6c-5137-15f4-4cdb-9f03b5cb9268@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>, Nicolas Iooss <nicolas.iooss_linux@m4x.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 31 Aug 2017 21:46:12 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation
  Improve a size determination
  Delete a jump target

 drivers/media/dvb-frontends/mb86a20s.c | 23 +++++++----------------
 1 file changed, 7 insertions(+), 16 deletions(-)

-- 
2.14.1

