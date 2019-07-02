From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 02 Jul 2019 18:33:21 +0000
Subject: [PATCH] apparmor: Replace two seq_printf() calls by seq_puts() in aa_label_seq_xprint()
Message-Id: <9dd6c122-89f5-70e8-acfc-d6d6596e1261@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-security-module@vger.kernel.org, James Morris <jmorris@namei.org>, John Johansen <john.johansen@canonical.com>, "Serge E. Hallyn" <serge@hallyn.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 2 Jul 2019 20:27:32 +0200

Two strings which did not contain a data format specification should be put
into a sequence. Thus use the corresponding function “seq_puts”.

This issue was detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 security/apparmor/label.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/apparmor/label.c b/security/apparmor/label.c
index 59f1cc2557a7..20acc1f3112e 100644
--- a/security/apparmor/label.c
+++ b/security/apparmor/label.c
@@ -1747,13 +1747,13 @@ void aa_label_seq_xprint(struct seq_file *f, struct aa_ns *ns,
 			AA_DEBUG("label print error");
 			return;
 		}
-		seq_printf(f, "%s", str);
+		seq_puts(f, str);
 		kfree(str);
 	} else if (display_mode(ns, label, flags))
 		seq_printf(f, "%s (%s)", label->hname,
 			   label_modename(ns, label, flags));
 	else
-		seq_printf(f, "%s", label->hname);
+		seq_puts(f, label->hname);
 }

 void aa_label_xprintk(struct aa_ns *ns, struct aa_label *label, int flags,
--
2.22.0
