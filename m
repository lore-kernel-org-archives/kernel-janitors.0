From: Leonardo Potenza <lpotenza@inwind.it>
Date: Sun, 11 May 2008 17:15:34 +0000
Subject: [PATCH] fs/dlm: section mismatch warning fix
Message-Id: <200805111915.34911.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: ccaulfie@redhat.com, teigland@redhat.com, linux-kernel@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>

Removed the section mismatch message:
WARNING: fs/dlm/dlm.o(.init.text+0x132): Section mismatch in reference from the function init_module() to the function .exit.text:dlm_netlink_exit()

Since dlm_netlink_exit() is called in the init_dlm() error handling,
the __exit annotation has been removed.

Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
---

 netlink.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Index: linux-2.6/fs/dlm/netlink.c
=================================--- linux-2.6.orig/fs/dlm/netlink.c
+++ linux-2.6/fs/dlm/netlink.c
@@ -95,7 +95,7 @@ int __init dlm_netlink_init(void)
 	return rv;
 }
 
-void __exit dlm_netlink_exit(void)
+void dlm_netlink_exit(void)
 {
 	genl_unregister_ops(&family, &dlm_nl_ops);
 	genl_unregister_family(&family);
