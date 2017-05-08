From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 08 May 2017 13:05:24 +0000
Subject: [PATCH 2/3] Input: Use seq_puts() in input_devices_seq_show()
Message-Id: <842c54f4-6ec4-9d39-5f10-e288db08c1b0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <85bf6874-661a-9cab-1e9b-ea9e312b94de@users.sourceforge.net>
In-Reply-To: <85bf6874-661a-9cab-1e9b-ea9e312b94de@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-input@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 8 May 2017 14:30:03 +0200

A string which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function "seq_puts".

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/input/input.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/input/input.c b/drivers/input/input.c
index 0d204b841575..067a6edd643c 100644
--- a/drivers/input/input.c
+++ b/drivers/input/input.c
@@ -1144,7 +1144,7 @@ static int input_devices_seq_show(struct seq_file *seq, void *v)
 	seq_printf(seq, "P: Phys=%s\n", dev->phys ? dev->phys : "");
 	seq_printf(seq, "S: Sysfs=%s\n", path ? path : "");
 	seq_printf(seq, "U: Uniq=%s\n", dev->uniq ? dev->uniq : "");
-	seq_printf(seq, "H: Handlers=");
+	seq_puts(seq, "H: Handlers=");
 
 	list_for_each_entry(handle, &dev->h_list, d_node)
 		seq_printf(seq, "%s ", handle->name);
-- 
2.12.2

