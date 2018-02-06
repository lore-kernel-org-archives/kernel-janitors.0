From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 06 Feb 2018 14:43:18 +0000
Subject: [PATCH 0/3] HID-Logitech: Adjustments for two function implementations
Message-Id: <5c76a767-b1cb-2486-f24d-0d5a220b8985@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 6 Feb 2018 15:38:30 +0100

Three update suggestions were taken into account
from static source code analysis.

Markus Elfring (3):
  Delete an error message for a failed memory allocation in lg_probe()
  Improve a size determination in lg_probe()
  Delete an error message for a failed memory allocation in lg4ff_init()

 drivers/hid/hid-lg.c    | 7 +++----
 drivers/hid/hid-lg4ff.c | 4 +---
 2 files changed, 4 insertions(+), 7 deletions(-)

-- 
2.16.1

