From: Eugene Teo <eugene.teo@eugeneteo.net>
Date: Sat, 03 Jan 2004 13:31:16 +0000
Subject: [Kernel-janitors] [PATCH] Check return value in net/ipv4/ipmr.c
Message-Id: <20040103133116.GG21909@eugeneteo.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040103132946.GE21909@eugeneteo.net>
In-Reply-To: <20040103132946.GE21909@eugeneteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

http://www.anomalistic.org/patches/ipmr-check-ret-alloc_netdev-fix-2.6.1-rc1-mm1.patch

diff -Naur -X /home/amnesia/w/dontdiff 2.6.1-rc1-mm1/net/ipv4/ipmr.c 2.6.1-rc1-mm1-fix/net/ipv4/ipmr.c
--- 2.6.1-rc1-mm1/net/ipv4/ipmr.c	2003-12-18 10:58:49.000000000 +0800
+++ 2.6.1-rc1-mm1-fix/net/ipv4/ipmr.c	2004-01-03 20:43:14.000000000 +0800
@@ -25,6 +25,7 @@
  *      Carlos Picoto           :       PIMv1 Support
  *	Pavlin Ivanov Radoslavov:	PIMv2 Registers must checksum only PIM header
  *					Relax this requrement to work with older peers.
+ *	Eugene Teo		:	Check the return value of alloc_netdev.		
  *
  */
 
@@ -205,6 +206,9 @@
 	dev = alloc_netdev(sizeof(struct net_device_stats), "pimreg",
 			   reg_vif_setup);
 
+	if (!dev)
+		return NULL;
+
 	if (register_netdevice(dev)) {
 		kfree(dev);
 		return NULL;

-- 
Eugene TEO   <eugeneteo@eugeneteo.net>   <http://www.anomalistic.org/>
1024D/14A0DDE5 print D851 4574 E357 469C D308  A01E 7321 A38A 14A0 DDE5
main(i) { putchar(182623909 >> (i-1) * 5&31|!!(i<7)<<6) && main(++i); }

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
