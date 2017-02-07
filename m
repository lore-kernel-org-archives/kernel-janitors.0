From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 07 Feb 2017 19:54:05 +0000
Subject: [PATCH 11/18] HID-debug: Delete an unnecessary seq_printf() call in hid_dump_device()
Message-Id: <aaec2476-9564-9768-0b0f-b2d48094e761@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <edd25fcd-8625-2469-fa28-2315f81b6b8e@users.sourceforge.net>
In-Reply-To: <edd25fcd-8625-2469-fa28-2315f81b6b8e@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Benjamin Tissoires <benjamin.tissoires@redhat.com>, =?UTF-8?Q?Bruno_Pr=c3=a9mont?= <bonbons@linux-vserver.org>, Jiri Kosina <jikos@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 7 Feb 2017 19:23:03 +0100

An information should be put into a sequence together with a line break.
Pass the desired data in a single function call instead.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/hid/hid-debug.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hid/hid-debug.c b/drivers/hid/hid-debug.c
index 383a4a838351..8d019d0db4f3 100644
--- a/drivers/hid/hid-debug.c
+++ b/drivers/hid/hid-debug.c
@@ -645,8 +645,7 @@ void hid_dump_device(struct hid_device *device, struct seq_file *f)
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
2.11.1

