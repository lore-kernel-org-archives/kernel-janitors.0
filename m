From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 02 May 2017 09:20:48 +0000
Subject: [PATCH 0/9] pinctrl: Fine-tuning for some function implementations
Message-Id: <d8cce619-5a37-2f8b-1c07-a4c45443fb50@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 May 2017 11:16:54 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (9):
  Use seq_putc() in three functions
  Combine two seq_puts() calls into one call in two functions
  Combine five seq_printf() calls into one call in pinconf_dbg_config_print()
  Replace two seq_printf() calls by seq_puts() in pinconf_show_map()
  Adjust five checks for null pointers
  Combine substrings for a message in pin_config_group_get()
  Add spaces for better code readability
  core: Use seq_putc() in pinctrl_maps_show()
  core: Adjust nine checks for null pointers

 drivers/pinctrl/core.c    | 20 ++++++++--------
 drivers/pinctrl/pinconf.c | 61 ++++++++++++++++++++++++-----------------------
 2 files changed, 41 insertions(+), 40 deletions(-)

-- 
2.12.2

