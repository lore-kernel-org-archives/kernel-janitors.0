From: Ron Gage <ron@rongage.org>
Date: Fri, 13 Feb 2004 02:44:40 +0000
Subject: [Kernel-janitors] [PATCH] - 2.6.2 - spinlock.h - compiler cleanups
Message-Id: <200402122144.40069.ron@rongage.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="Boundary-00=_YoDLAT9Tsb65uFB"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--Boundary-00=_YoDLAT9Tsb65uFB
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

This patch eliminates "parameter defined but not used" warnings in spinlock.h.

Probably useless, but I like clean compiles.  :)

-- 
Ron Gage - LPIC1, MCP, A+, Net+
Pontiac, Michigan


--Boundary-00=_YoDLAT9Tsb65uFB
Content-Type: text/x-diff;
  charset="us-ascii";
  name="spinlock.h.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="spinlock.h.diff"

--- linux-2.6.2.orig/include/linux/spinlock.h	2004-02-03 22:43:47.000000000 -0500
+++ linux-2.6.2/include/linux/spinlock.h	2004-02-12 21:12:22.000000000 -0500
@@ -411,11 +411,15 @@
 	 * attempt to acquire the lock bit.
 	 */
 	preempt_disable();
+
 #if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
 	while (test_and_set_bit(bitnum, addr)) {
 		while (test_bit(bitnum, addr))
 			cpu_relax();
 	}
+#else
+	addr = addr;
+	bitnum = bitnum;
 #endif
 }
 
@@ -434,6 +438,8 @@
 	return ret;
 #else
 	preempt_disable();
+	bitnum = bitnum;
+	addr = addr;
 	return 1;
 #endif
 }
@@ -447,6 +453,9 @@
 	BUG_ON(!test_bit(bitnum, addr));
 	smp_mb__before_clear_bit();
 	clear_bit(bitnum, addr);
+#else
+	bitnum = bitnum;
+	addr = addr;
 #endif
 	preempt_enable();
 }
@@ -459,8 +468,12 @@
 #if defined(CONFIG_SMP) || defined(CONFIG_DEBUG_SPINLOCK)
 	return test_bit(bitnum, addr);
 #elif defined CONFIG_PREEMPT
+	bitnum = bitnum;
+	addr = addr;
 	return preempt_count();
 #else
+	bitnum = bitnum;
+	addr = addr;
 	return 1;
 #endif
 }

--Boundary-00=_YoDLAT9Tsb65uFB
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--Boundary-00=_YoDLAT9Tsb65uFB--
