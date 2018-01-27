From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 14:58:27 +0000
Subject: [PATCH 0/2] Input-TurboGraFX: Adjustments for tgfx_attach()
Message-Id: <dfa75f58-43e5-dc80-a606-2914b980f6e7@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Geliang Tang <geliangtang@gmail.com>, Kees Cook <keescook@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 27 Jan 2018 15:55:44 +0100

Two update suggestions were taken into account
from static source code analysis.

Markus Elfring (2):
  Delete an error message for a failed memory allocation
  Improve a size determination

 drivers/input/joystick/turbografx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

-- 
2.16.1

