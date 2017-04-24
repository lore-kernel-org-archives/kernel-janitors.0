From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Apr 2017 20:22:07 +0000
Subject: [PATCH 6/7] HID: debug: Combine two seq_printf() calls into one call in hid_dump_device()
Message-Id: <0364de83-2ff2-3309-ec38-1e4db66d8231@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <2d526d72-a740-367b-04a9-ed698435f8ed@users.sourceforge.net>
In-Reply-To: <2d526d72-a740-367b-04a9-ed698435f8ed@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-iio@vger.kernel.org, linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, =?UTF-8?Q?Bruno_Pr=c3=a9mont?= <bonbons@linux-vserver.org>, Henrik Rydberg <rydberg@bitmath.org>, Jiri Kosina <jikos@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 24 Apr 2017 21:07:52 +0200

A bit of data was put into a sequence by two separate function calls.
Print the same data by a single function call instead.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-debug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index ce850f80d9e3..1e8ac6e569a2 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -646,8 +646,7 @@ void hid_dump_device(struct hid_device *device, struct seq_file *f)
 			seq_printf(f, "%s", table[i]);
 			if (report->id)
 				seq_printf(f, "(%d)", report->id);
-			seq_printf(f, "[%s]", table[report->type]);
-			seq_printf(f, "\n");
+			seq_printf(f, "[%s]\n", table[report->type]);
 			for (k = 0; k < report->maxfield; k++) {
 				tab(4, f);
 				seq_printf(f, "Field(%d)\n", k);
-- 
2.12.2

