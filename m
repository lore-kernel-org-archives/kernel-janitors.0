From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Mar 2010 21:18:13 +0000
Subject: [PATCH 5/6] drivers/base/module.c: Use kasprintf
Message-Id: <Pine.LNX.4.64.1003102217500.1672@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

kasprintf combines kmalloc and sprintf, and takes care of the size
calculation itself.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression a,flag;
expression list args;
statement S;
@@

  a -  \(kmalloc\|kzalloc\)(...,flag)
+  kasprintf(flag,args)
  <... when != a
  if (a = NULL || ...) S
  ...>
- sprintf(a,args);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/base/module.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff -u -p a/drivers/base/module.c b/drivers/base/module.c
--- a/drivers/base/module.c
+++ b/drivers/base/module.c
@@ -14,12 +14,10 @@ static char *make_driver_name(struct dev
 {
 	char *driver_name;
 
-	driver_name = kmalloc(strlen(drv->name) + strlen(drv->bus->name) + 2,
-			      GFP_KERNEL);
+	driver_name = kasprintf(GFP_KERNEL, "%s:%s", drv->bus->name, drv->name);
 	if (!driver_name)
 		return NULL;
 
-	sprintf(driver_name, "%s:%s", drv->bus->name, drv->name);
 	return driver_name;
 }
 
