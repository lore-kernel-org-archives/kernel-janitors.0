From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Dec 2016 18:28:12 +0000
Subject: [PATCH 00/19] [media] USB Video Class driver: Fine-tuning for several function implementations
Message-Id: <47aa4314-74ec-b2bf-ee3b-aad4d6e9f0a2@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-media@vger.kernel.org, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 25 Dec 2016 19:23:32 +0100

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (19):
  uvc_driver: Use kmalloc_array() in uvc_simplify_fraction()
  uvc_driver: Combine substrings for 48 messages
  uvc_driver: Adjust three function calls together with a variable assignment
  uvc_driver: Adjust 28 checks for null pointers
  uvc_driver: Enclose 24 expressions for the sizeof operator by parentheses
  uvc_driver: Add some spaces for better code readability
  uvc_driver: Rename a jump label in uvc_probe()
  uvc_driver: Rename a jump label in uvc_scan_fallback()
  uvc_driver: Less function calls in uvc_parse_streaming() after error detection
  uvc_driver: Return -ENOMEM after a failed kzalloc() call in uvc_parse_streaming()
  uvc_driver: Delete an unnecessary variable initialisation in uvc_parse_streaming()
  uvc_driver: Move six assignments in uvc_parse_streaming()
  uvc_video: Use kmalloc_array() in uvc_video_clock_init()
  uvc_video: Combine substrings for 22 messages
  uvc_video: Adjust one function call together with a variable assignment
  uvc_video: Adjust 18 checks for null pointers
  uvc_video: Fix a typo in a comment line
  uvc_video: Enclose an expression for the sizeof operator by parentheses
  uvc_video: Add some spaces for better code readability

 drivers/media/usb/uvc/uvc_driver.c | 532 +++++++++++++++++++------------------
 drivers/media/usb/uvc/uvc_video.c  | 162 +++++------
 2 files changed, 363 insertions(+), 331 deletions(-)

-- 
2.11.0

