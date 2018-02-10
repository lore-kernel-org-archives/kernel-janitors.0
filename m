From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Feb 2018 20:31:24 +0000
Subject: [PATCH 0/2] GPIO-Timberdale: Adjustments for timbgpio_probe()
Message-Id: <da77f86c-a366-0a0f-10fd-9b7cfd879391@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 10 Feb 2018 21:28:29 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination

 drivers/gpio/gpio-timberdale.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

-- 
2.16.1

