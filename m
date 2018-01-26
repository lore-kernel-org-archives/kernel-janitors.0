From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Jan 2018 13:48:07 +0000
Subject: [PATCH 0/2] Input: omap4-keypad: Adjustments for omap4_keypad_probe()
Message-Id: <3df8e062-2a39-05c9-bf49-c85fd636abff@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 26 Jan 2018 14:45:54 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete two error messages for a failed memory allocation
  Improve a size determination

 drivers/input/keyboard/omap4-keypad.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

-- 
2.16.1

