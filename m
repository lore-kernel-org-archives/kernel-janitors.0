From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Apr 2017 20:23:02 +0000
Subject: [PATCH 7/7] HID: picoLCD: Replace two seq_printf() calls by seq_puts() in picolcd_debug_reset_show()
Message-Id: <ceee0ae6-fd37-66b6-116a-319f5e393327@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2d526d72-a740-367b-04a9-ed698435f8ed@users.sourceforge.net>
In-Reply-To: <2d526d72-a740-367b-04a9-ed698435f8ed@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-iio@vger.kernel.org, linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, =?UTF-8?Q?Bruno_Pr=c3=a9mont?= <bonbons@linux-vserver.org>, Henrik Rydberg <rydberg@bitmath.org>, Jiri Kosina <jikos@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Apr 2017 21:27:42 +0200

Strings which did not contain data format specifications should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-picolcd_debugfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-picolcd_debugfs.c b/drivers/hid/hid-picolcd_debugfs.c
index 3e0feb4bb538..975f36601d59 100644
--- a/drivers/hid/hid-picolcd_debugfs.c
+++ b/drivers/hid/hid-picolcd_debugfs.c
@@ -33,9 +33,9 @@
 static int picolcd_debug_reset_show(struct seq_file *f, void *p)
 {
 	if (picolcd_fbinfo((struct picolcd_data *)f->private))
-		seq_printf(f, "all fb\n");
+		seq_puts(f, "all fb\n");
 	else
-		seq_printf(f, "all\n");
+		seq_puts(f, "all\n");
 	return 0;
 }
 
-- 
2.12.2

