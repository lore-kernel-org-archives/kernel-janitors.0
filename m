From: Stefan Sperling <stefan@binarchy.net>
Date: Tue, 09 Nov 2004 21:32:15 +0000
Subject: [KJ] [PATCH] convert arlan wireless driver to module_param
Message-Id: <20041109213215.GC9496@dice.seeling33.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============039353734388658967=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============039353734388658967==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Replaces MODULE_PARM with module_param calls in arlan wireless driver.

I also reordered module parameter declarations a little to improve readability.
All debug related parameter stuff is now declared in one block, rather than all over the place.
Some debug related module parameters even used to be declared outside DEBUG #ifdefs.
Generally, the arlan debug code is still broken, though. It currently does not compile,
and this patch does not make it compile.

--- drivers/net/wireless/arlan-main.c.orig	2004-11-09 20:40:21.928933608 +0100
+++ drivers/net/wireless/arlan-main.c	2004-11-08 22:28:43.000000000 +0100
@@ -31,52 +31,46 @@ static int retries = 5;
 static int tx_queue_len = 1;
 static int arlan_EEPROM_bad;
 
-#ifdef ARLAN_DEBUGGING
+module_param(arlan_debug, bool, 0644);
+module_param(spreadingCode, int, 0644);
+module_param(channelNumber, int, 0644);
+module_param(channelSet, int, 0644);
+module_param(systemId, int, 0644);
+module_param(registrationMode, int, 0644);
+module_param(radioNodeId, int, 0644);
+module_param(SID, int, 0644);
+module_param(keyStart, int, 0644);
+module_param(tx_delay_ms, int, 0644);
+module_param(retries, int, 0644);
+module_param(tx_queue_len, int, 0644);
+module_param(arlan_EEPROM_bad, bool, 0644);
+MODULE_PARM_DESC(arlan_debug, "Arlan debug enable (0-1)");
+MODULE_PARM_DESC(retries, "Arlan maximum packet retransmisions");
 
-static int arlan_entry_debug;
-static int arlan_exit_debug;
+#ifdef ARLAN_DEBUGGING
 static int testMemory = testMemoryUNKNOWN;
 static int irq = irqUNKNOWN;
 static int txScrambled = 1;
 static int mdebug;
-#endif
-
-MODULE_PARM(irq, "i");
-MODULE_PARM(mem, "i");
-MODULE_PARM(arlan_debug, "i");
-MODULE_PARM(testMemory, "i");
-MODULE_PARM(spreadingCode, "i");
-MODULE_PARM(channelNumber, "i");
-MODULE_PARM(channelSet, "i");
-MODULE_PARM(systemId, "i");
-MODULE_PARM(registrationMode, "i");
-MODULE_PARM(radioNodeId, "i");
-MODULE_PARM(SID, "i");
-MODULE_PARM(txScrambled, "i");
-MODULE_PARM(keyStart, "i");
-MODULE_PARM(mdebug, "i");
-MODULE_PARM(tx_delay_ms, "i");
-MODULE_PARM(retries, "i");
-MODULE_PARM(async, "i");
-MODULE_PARM(tx_queue_len, "i");
-MODULE_PARM(arlan_entry_debug, "i");
-MODULE_PARM(arlan_exit_debug, "i");
-MODULE_PARM(arlan_entry_and_exit_debug, "i");
-MODULE_PARM(arlan_EEPROM_bad, "i");
-MODULE_PARM_DESC(irq, "(unused)");
-MODULE_PARM_DESC(mem, "Arlan memory address for single device probing");
-MODULE_PARM_DESC(arlan_debug, "Arlan debug enable (0-1)");
+module_param(testMemory, bool, 0644);
 MODULE_PARM_DESC(testMemory, "(unused)");
+module_param(irq, int, 0444);
+MODULE_PARM_DESC(irq, "(unused)");
+module_param(txScrambled, bool, 0644);
+module_param(mdebug, bool, 0644);
 MODULE_PARM_DESC(mdebug, "Arlan multicast debugging (0-1)");
-MODULE_PARM_DESC(retries, "Arlan maximum packet retransmisions");
+#endif
+
 #ifdef ARLAN_ENTRY_EXIT_DEBUGGING
+static int arlan_entry_debug;
+static int arlan_exit_debug;
+static int arlan_entry_and_exit_debug;
+module_param(arlan_entry_debug, bool, 0644);
+module_param(arlan_exit_debug, bool, 0644);
+module_param(arlan_entry_and_exit_debug, bool, 0644);
 MODULE_PARM_DESC(arlan_entry_debug, "Arlan driver function entry debugging");
 MODULE_PARM_DESC(arlan_exit_debug, "Arlan driver function exit debugging");
 MODULE_PARM_DESC(arlan_entry_and_exit_debug, "Arlan driver function entry and exit debugging");
-#else
-MODULE_PARM_DESC(arlan_entry_debug, "(ignored)");
-MODULE_PARM_DESC(arlan_exit_debug, "(ignored)");
-MODULE_PARM_DESC(arlan_entry_and_exit_debug, "(ignored)");
 #endif
 
 struct arlan_conf_stru arlan_conf[MAX_ARLANS];

--===============039353734388658967==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============039353734388658967==--
