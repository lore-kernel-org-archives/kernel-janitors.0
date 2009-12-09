From: Julia Lawall <julia@diku.dk>
Date: Wed, 09 Dec 2009 19:25:23 +0000
Subject: [PATCH 10/12] drivers/usb: Correct size given to memset
Message-Id: <Pine.LNX.4.64.0912092025050.1870@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Brownell <dbrownell@users.sourceforge.net>, Greg Kroah-Hartman <gregkh@suse.de>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

Memset should be given the size of the structure, not the size of the pointer.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
type T;
T *x;
expression E;
@@

memset(x, E, sizeof(
+ *
 x))
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/usb/gadget/f_mass_storage.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/drivers/usb/gadget/f_mass_storage.c b/drivers/usb/gadget/f_mass_storage.c
--- a/drivers/usb/gadget/f_mass_storage.c
+++ b/drivers/usb/gadget/f_mass_storage.c
@@ -2675,7 +2675,7 @@ static struct fsg_common *fsg_common_ini
 			return ERR_PTR(-ENOMEM);
 		common->free_storage_on_release = 1;
 	} else {
-		memset(common, 0, sizeof common);
+		memset(common, 0, sizeof *common);
 		common->free_storage_on_release = 0;
 	}
 
