From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Apr 2017 20:12:50 +0000
Subject: [PATCH 0/7] HID: Fine-tuning for some function implementations
Message-Id: <2d526d72-a740-367b-04a9-ed698435f8ed@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-iio@vger.kernel.org, linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, =?UTF-8?Q?Bruno_Pr=c3=a9mont?= <bonbons@linux-vserver.org>, Henrik Rydberg <rydberg@bitmath.org>, Jiri Kosina <jikos@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Apr 2017 22:00:22 +0200

Some update suggestions were taken into account
from static source code analysis.

Markus Elfring (7):
  Use devm_kcalloc() in sensor_hub_probe()
  Delete error messages for failed memory allocations in sensor_hub_probe()
  Adjust two checks for null pointers in sensor_hub_probe()
  Replace five seq_printf() calls by seq_putc()
  Replace 12 seq_printf() calls by seq_puts()
  Combine two seq_printf() calls into one call in hid_dump_device()
  Replace two seq_printf() calls by seq_puts() in picolcd_debug_reset_show()

 drivers/hid/hid-debug.c           | 38 +++++++++++++++++++-------------------
 drivers/hid/hid-picolcd_debugfs.c |  4 ++--
 drivers/hid/hid-sensor-hub.c      | 18 ++++++++----------
 3 files changed, 29 insertions(+), 31 deletions(-)

-- 
2.12.2

