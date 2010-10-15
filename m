From: Julia Lawall <julia@diku.dk>
Date: Fri, 15 Oct 2010 12:54:31 +0000
Subject: [PATCH 7/7] drivers/staging: Clean up error-handling code
Message-Id: <1287147610-8041-7-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@suse.de>
Cc: kernel-janitors@vger.kernel.org, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

In the first hunk, 0 is returned on memory allocation failure, even though
other failures return -ENOMEM or other similar values.

In the second hunk, there was error handling code that returned without
freeing psz_path_name.

A simplified version of the semantic match that finds the first problem is as
follows: (http://coccinelle.lip6.fr/)

// <smpl>
@@
expression ret;
expression x,e1,e2,e3;
@@

ret = 0
... when != ret = e1
*x = \(kmalloc\|kcalloc\|kzalloc\)(...)
... when != ret = e2
if (x = NULL) { ... when != ret = e3
  return ret;
}
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 drivers/staging/tidspbridge/pmgr/dspapi.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff -u -p a/drivers/staging/tidspbridge/pmgr/dspapi.c b/drivers/staging/tidspbridge/pmgr/dspapi.c
--- a/drivers/staging/tidspbridge/pmgr/dspapi.c
+++ b/drivers/staging/tidspbridge/pmgr/dspapi.c
@@ -493,8 +493,10 @@ u32 mgrwrap_register_object(union trappe
 				args->args_mgr_registerobject.psz_path_name) +
 	    1;
 	psz_path_name = kmalloc(path_size, GFP_KERNEL);
-	if (!psz_path_name)
+	if (!psz_path_name) {
+		status = -ENOMEM;
 		goto func_end;
+	}
 	ret = strncpy_from_user(psz_path_name,
 				(char *)args->args_mgr_registerobject.
 				psz_path_name, path_size);
@@ -503,8 +505,10 @@ u32 mgrwrap_register_object(union trappe
 		goto func_end;
 	}
 
-	if (args->args_mgr_registerobject.obj_type >= DSP_DCDMAXOBJTYPE)
-		return -EINVAL;
+	if (args->args_mgr_registerobject.obj_type >= DSP_DCDMAXOBJTYPE) {
+		status = -EINVAL;
+		goto func_end;
+	}
 
 	status = dcd_register_object(&uuid_obj,
 				     args->args_mgr_registerobject.obj_type,

