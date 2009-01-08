From: Leonardo Potenza <lpotenza@inwind.it>
Date: Thu, 08 Jan 2009 18:57:03 +0000
Subject: [PATCH] net: fix section mismatch warnings in dccp/ccids/lib/tfrc.c
Message-Id: <200901081957.03413.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: acme@ghostprotocols.net, linux-kernel@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>

Removed the __exit annotation of tfrc_lib_exit(), in order to suppress the following section mismatch messages:

WARNING: net/dccp/dccp.o(.text+0xd9): Section mismatch in reference from the function ccid_cleanup_builtins() to the function .exit.text:tfrc_lib_exit()
The function ccid_cleanup_builtins() references a function in an exit section.
Often the function tfrc_lib_exit() has valid usage outside the exit section
and the fix is to remove the __exit annotation of tfrc_lib_exit.

WARNING: net/dccp/dccp.o(.init.text+0x48): Section mismatch in reference from the function ccid_initialize_builtins() to the function .exit.text:tfrc_lib_exit()
The function __init ccid_initialize_builtins() references
a function __exit tfrc_lib_exit().
This is often seen when error handling in the init function
uses functionality in the exit path.
The fix is often to remove the __exit annotation of
tfrc_lib_exit() so it may be used outside an exit section.

Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
---
Index: linux-2.6/net/dccp/ccids/lib/tfrc.c
=================================--- linux-2.6.orig/net/dccp/ccids/lib/tfrc.c	2009-01-08 19:19:50.000000000 +0100
+++ linux-2.6/net/dccp/ccids/lib/tfrc.c	2009-01-08 19:20:07.000000000 +0100
@@ -36,7 +36,7 @@ out:
 	return rc;
 }
 
-void __exit tfrc_lib_exit(void)
+void tfrc_lib_exit(void)
 {
 	tfrc_rx_packet_history_exit();
 	tfrc_tx_packet_history_exit();
