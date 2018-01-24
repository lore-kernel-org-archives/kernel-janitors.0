From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 15:13:25 +0000
Subject: [PATCH 0/2] Input-gtco: Adjustments for gtco_probe()
Message-Id: <5c4410ab-5174-ce8d-cab6-7979aa61f996@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Andrey Konovalov <andreyknvl@google.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 24 Jan 2018 15:26:56 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination

 drivers/input/tablet/gtco.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

-- 
2.16.1

