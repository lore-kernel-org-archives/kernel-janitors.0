From: Tony Breeds <tony@bakeyournoodle.com>
Date: Sun, 04 Apr 2004 03:16:00 +0000
Subject: [Kernel-janitors] [PATCH 4/5] remove concatenation with
Message-Id: <1081048590.1713@bakeyournoodle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040322052155.GF17221@bakeyournoodle.com>
In-Reply-To: <20040322052155.GF17221@bakeyournoodle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

diff -X dontdiff -purN 2.6.5-rc3.clean/net/8021q/vlan.h 2.6.5-rc3.kj_func/net/8021q/vlan.h
--- 2.6.5-rc3.clean/net/8021q/vlan.h	2004-01-15 17:04:12.000000000 +1100
+++ 2.6.5-rc3.kj_func/net/8021q/vlan.h	2004-04-04 12:38:27.000000000 +1000
@@ -19,8 +19,8 @@ I never found it..and the problem seems 
 I'll bet they might prove useful again... --Ben
 
 
-#define VLAN_MEM_DBG(x, y, z) printk(VLAN_DBG __FUNCTION__ ":  "  x, y, z);
-#define VLAN_FMEM_DBG(x, y) printk(VLAN_DBG __FUNCTION__  ":  " x, y);
+#define VLAN_MEM_DBG(x, y, z) printk(VLAN_DBG "%s:  "  x, __FUNCTION__, y, z);
+#define VLAN_FMEM_DBG(x, y) printk(VLAN_DBG "%s:  " x, __FUNCTION__, y);
 */
 
 /* This way they don't do anything! */
diff -X dontdiff -purN 2.6.5-rc3.clean/net/8021q/vlanproc.c 2.6.5-rc3.kj_func/net/8021q/vlanproc.c
--- 2.6.5-rc3.clean/net/8021q/vlanproc.c	2004-04-01 08:31:48.000000000 +1000
+++ 2.6.5-rc3.kj_func/net/8021q/vlanproc.c	2004-04-04 12:38:27.000000000 +1000
@@ -220,7 +220,7 @@ int vlan_proc_rem_dev(struct net_device 
 	}
 
 #ifdef VLAN_DEBUG
-	printk(VLAN_DBG __FUNCTION__ ": dev: %p\n", vlandev);
+	printk(VLAN_DBG "%s: dev: %p\n", __FUNCTION__, vlandev);
 #endif
 
 	/** NOTE:  This will consume the memory pointed to by dent, it seems. */
diff -X dontdiff -purN 2.6.5-rc3.clean/net/ipv4/netfilter/ip_conntrack_irc.c 2.6.5-rc3.kj_func/net/ipv4/netfilter/ip_conntrack_irc.c
--- 2.6.5-rc3.clean/net/ipv4/netfilter/ip_conntrack_irc.c	2004-01-16 21:14:43.000000000 +1100
+++ 2.6.5-rc3.kj_func/net/ipv4/netfilter/ip_conntrack_irc.c	2004-04-04 12:38:27.000000000 +1000
@@ -60,8 +60,8 @@ DECLARE_LOCK(ip_irc_lock);
 struct module *ip_conntrack_irc = THIS_MODULE;
 
 #if 0
-#define DEBUGP(format, args...) printk(KERN_DEBUG __FILE__ ":" __FUNCTION__ \
-					":" format, ## args)
+#define DEBUGP(format, args...) printk(KERN_DEBUG "%s:%s:" format, \
+                                       __FILE__, __FUNCTION__ , ## args)
 #else
 #define DEBUGP(format, args...)
 #endif
diff -X dontdiff -purN 2.6.5-rc3.clean/net/ipv4/netfilter/ip_conntrack_tftp.c 2.6.5-rc3.kj_func/net/ipv4/netfilter/ip_conntrack_tftp.c
--- 2.6.5-rc3.clean/net/ipv4/netfilter/ip_conntrack_tftp.c	2004-02-19 07:19:23.000000000 +1100
+++ 2.6.5-rc3.kj_func/net/ipv4/netfilter/ip_conntrack_tftp.c	2004-04-04 12:38:27.000000000 +1000
@@ -33,8 +33,8 @@ MODULE_PARM_DESC(ports, "port numbers of
 #endif
 
 #if 0
-#define DEBUGP(format, args...) printk(__FILE__ ":" __FUNCTION__ ": " \
-				       format, ## args)
+#define DEBUGP(format, args...) printk("%s:%s:" format, \
+                                       __FILE__, __FUNCTION__ , ## args)
 #else
 #define DEBUGP(format, args...)
 #endif
diff -X dontdiff -purN 2.6.5-rc3.clean/net/ipv4/netfilter/ip_nat_tftp.c 2.6.5-rc3.kj_func/net/ipv4/netfilter/ip_nat_tftp.c
--- 2.6.5-rc3.clean/net/ipv4/netfilter/ip_nat_tftp.c	2004-02-19 07:19:23.000000000 +1100
+++ 2.6.5-rc3.kj_func/net/ipv4/netfilter/ip_nat_tftp.c	2004-04-04 12:38:27.000000000 +1000
@@ -47,8 +47,8 @@ MODULE_PARM_DESC(ports, "port numbers of
 #endif
 
 #if 0
-#define DEBUGP(format, args...) printk(__FILE__ ":" __FUNCTION__ ": " \
-				       format, ## args)
+#define DEBUGP(format, args...) printk("%s:%s:" format, \
+                                       __FILE__, __FUNCTION__ , ## args)
 #else
 #define DEBUGP(format, args...)
 #endif
diff -X dontdiff -purN 2.6.5-rc3.clean/net/ipv4/netfilter/ipt_ULOG.c 2.6.5-rc3.kj_func/net/ipv4/netfilter/ipt_ULOG.c
--- 2.6.5-rc3.clean/net/ipv4/netfilter/ipt_ULOG.c	2004-02-19 07:19:24.000000000 +1100
+++ 2.6.5-rc3.kj_func/net/ipv4/netfilter/ipt_ULOG.c	2004-04-04 12:38:27.000000000 +1000
@@ -64,13 +64,13 @@ MODULE_DESCRIPTION("iptables userspace l
 #define ULOG_MAXNLGROUPS	32		/* numer of nlgroups */
 
 #if 0
-#define DEBUGP(format, args...)	printk(__FILE__ ":" __FUNCTION__ ":" \
-				       format, ## args)
+#define DEBUGP(format, args...) printk("%s:%s:" format, \
+                                       __FILE__, __FUNCTION__ , ## args)
 #else
 #define DEBUGP(format, args...)
 #endif
 
-#define PRINTR(format, args...) do { if (net_ratelimit()) printk(format, ## args); } while (0)
+#define PRINTR(format, args...) do { if (net_ratelimit()) printk(format , ## args); } while (0)
 
 static unsigned int nlbufsiz = 4096;
 MODULE_PARM(nlbufsiz, "i");

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
