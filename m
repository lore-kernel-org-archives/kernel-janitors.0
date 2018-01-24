From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 16:33:43 +0000
Subject: [PATCH 0/3] Input-apbps2: Adjustments for two function implementations
Message-Id: <50013a33-b7ca-fce1-9769-bfe3db850a8a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 17:30:12 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation
  Improve a size determination
  Fix typos in a comment

 drivers/input/serio/apbps2.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

-- 
2.16.1

