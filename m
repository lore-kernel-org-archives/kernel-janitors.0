From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 29 Oct 2016 19:37:08 +0000
Subject: [PATCH 14/15] tty: nozomi: use permission-specific DEVICE_ATTR variants
Message-Id: <1477769829-22230-15-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1477769829-22230-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel-janitors@vger.kernel.org, Jiri Slaby <jslaby@suse.com>, linux-kernel@vger.kernel.org

Use DEVICE_ATTR_RO for read only attributes.  This simplifies the
source code, improves readbility, and reduces the chance of
inconsistencies.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@ro@
declarer name DEVICE_ATTR;
identifier x,x_show;
@@

DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);

@script:ocaml@
x << ro.x;
x_show << ro.x_show;
@@

if not (x^"_show" = x_show) then Coccilib.include_match false

@@
declarer name DEVICE_ATTR_RO;
identifier ro.x,ro.x_show;
@@

- DEVICE_ATTR(x, \(0444\|S_IRUGO\), x_show, NULL);
+ DEVICE_ATTR_RO(x);
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/tty/nozomi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/nozomi.c b/drivers/tty/nozomi.c
index d6fd0e8..e2020a6 100644
--- a/drivers/tty/nozomi.c
+++ b/drivers/tty/nozomi.c
@@ -1320,7 +1320,7 @@ static ssize_t card_type_show(struct device *dev, struct device_attribute *attr,
 
 	return sprintf(buf, "%d\n", dc->card_type);
 }
-static DEVICE_ATTR(card_type, S_IRUGO, card_type_show, NULL);
+static DEVICE_ATTR_RO(card_type);
 
 static ssize_t open_ttys_show(struct device *dev, struct device_attribute *attr,
 			  char *buf)
@@ -1329,7 +1329,7 @@ static ssize_t open_ttys_show(struct device *dev, struct device_attribute *attr,
 
 	return sprintf(buf, "%u\n", dc->open_ttys);
 }
-static DEVICE_ATTR(open_ttys, S_IRUGO, open_ttys_show, NULL);
+static DEVICE_ATTR_RO(open_ttys);
 
 static void make_sysfs_files(struct nozomi *dc)
 {

