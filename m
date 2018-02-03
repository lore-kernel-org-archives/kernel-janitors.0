From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 03 Feb 2018 17:36:46 +0000
Subject: [PATCH 0/6] HID-Prodikeys: Adjustments for two function implementations
Message-Id: <c388b4d8-fa43-1bf2-e27d-1a3a8d636118@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 3 Feb 2018 18:21:23 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (6):
  Delete two error messages for a failed memory allocation in pk_probe()
  Delete an unnecessary variable initialisation in pk_probe()
  Move an assignment in pk_probe()
  Delete an unnecessary return statement in pcmidi_send_note()
  Combine two condition checks into one statement in pcmidi_send_note()
  Rename a jump label in pcmidi_send_note()

 drivers/hid/hid-prodikeys.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

-- 
2.16.1

