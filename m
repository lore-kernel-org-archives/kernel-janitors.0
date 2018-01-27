From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 12:52:06 +0000
Subject: [PATCH 0/2] Input: matrix_keypad: Adjustments for two function implementations
Message-Id: <106bffd0-28ed-7c33-1f32-ae84b40f52c7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, David Rivshin <DRivshin@allworx.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 13:48:42 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete two error messages for a failed memory allocation
    in matrix_keypad_parse_dt()
  Improve a size determination in matrix_keypad_probe()

 drivers/input/keyboard/matrix_keypad.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

-- 
2.16.1

