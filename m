From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Oct 2017 17:50:10 +0000
Subject: [PATCH 0/2] extcon-max14577: Fine-tuning for max14577_muic_set_path()
Message-Id: <d08cbbf6-015a-ab76-6491-126901d1dda6@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Oct 2017 19:45:54 +0200

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Use common error handling code
  Delete an unnecessary variable initialisation

 drivers/extcon/extcon-max14577.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

-- 
2.14.2

