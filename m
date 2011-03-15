From: Dan Carpenter <error27@gmail.com>
Date: Tue, 15 Mar 2011 07:07:37 +0000
Subject: [patch 2/2] asus-wmi: potential NULL dereference in show_call()
Message-Id: <20110315070737.GT2008@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Corentin Chary <corentincj@iksaif.net>
Cc: Matthew Garrett <mjg@redhat.com>, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, kernel-janitors@vger.kernel.org

In the earlier check we assumed that "obj" could be NULL.  I looked at
some of the other places that call evaluate_object() and they check
for NULL as well.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
Can obj actually be NULL here?  Perhaps a better fix would be to remove
the first check.

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index a038595..efc776c 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1343,7 +1343,7 @@ static int show_call(struct seq_file *m, void *data)
 	else
 		seq_printf(m, "%#x(%#x, %#x) = t:%d\n", asus->debug.method_id,
 			   asus->debug.dev_id, asus->debug.ctrl_param,
-			   obj->type);
+			   obj ? obj->type : -1);
 
 	kfree(obj);
 
