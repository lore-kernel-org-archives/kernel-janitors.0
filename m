From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 05 Feb 2018 21:24:40 +0000
Subject: [PATCH 0/4] HID: logitech-dj: Adjustments for some function implementations
Message-Id: <12e9f2fd-5e85-fe8b-5eec-cd1712b07166@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 5 Feb 2018 22:22:11 +0100

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (4):
  Delete an error message for a failed memory allocation in two functions
  Improve a size determination in four functions
  Combine substrings for seven messages
  Fix a typo in a comment line

 drivers/hid/hid-logitech-dj.c | 53 +++++++++++++++++++------------------------
 1 file changed, 23 insertions(+), 30 deletions(-)

-- 
2.16.1

