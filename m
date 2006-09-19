From: Amol Lad <amol@verismonetworks.com>
Date: Tue, 19 Sep 2006 10:12:40 +0000
Subject: [KJ] [PATCH 5/6] create_proc_entry error handling: net
Message-Id: <1158660040.28299.83.camel@amol.verismonetworks.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Added appropriate KERN_ERR/KERN_WARNING messages whenever
create_proc_entry fails.

Tested using allmodconfig configuration and also by changing
Makefiles/Kconfig to make sure all files are compiled

Signed-off-by: Amol Lad <amol@verismonetworks.com>
---
 8021q/vlanproc.c                         |    7 +++++--
 appletalk/atalk_proc.c                   |   16 ++++++++++++----
 atm/br2684.c                             |    4 +++-
 atm/clip.c                               |    2 ++
 atm/lec.c                                |    2 ++
 atm/proc.c                               |    8 ++++++--
 ieee80211/ieee80211_module.c             |    1 +
 ipv4/netfilter/ip_conntrack_standalone.c |    4 +++-
 ipv4/netfilter/ipt_CLUSTERIP.c           |    1 +
 ipv4/netfilter/ipt_hashlimit.c           |    1 +
 ipv4/netfilter/ipt_recent.c              |    1 +
 ipv4/route.c                             |    2 ++
 ipv6/proc.c                              |    4 +++-
 ipx/ipx_proc.c                           |   12 +++++++++---
 irda/ircomm/ircomm_core.c                |    5 +++--
 irda/irproc.c                            |    2 ++
 llc/llc_proc.c                           |    8 ++++++--
 netfilter/nf_conntrack_standalone.c      |    4 +++-
 netfilter/nf_log.c                       |    4 +++-
 netfilter/nf_queue.c                     |    4 +++-
 netfilter/nfnetlink_log.c                |    4 +++-
 netfilter/nfnetlink_queue.c              |    4 +++-
 rxrpc/proc.c                             |   16 ++++++++++++----
 sctp/proc.c                              |   12 +++++++++---
 sunrpc/cache.c                           |    9 ++++++---
 sunrpc/stats.c                           |    4 +++-
 wanrouter/wanproc.c                      |   12 +++++++++---
 x25/x25_proc.c                           |    8 ++++++--
 28 files changed, 122 insertions(+), 39 deletions(-)
---
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/8021q/vlanproc.c linux-2.6.18-rc7/net/8021q/vlanproc.c
--- linux-2.6.18-rc7-orig/net/8021q/vlanproc.c	2006-09-15 15:28:51.000000000 +0530
+++ linux-2.6.18-rc7/net/8021q/vlanproc.c	2006-09-19 10:02:40.000000000 +0530
@@ -164,7 +164,8 @@ int __init vlan_proc_init(void)
 		if (proc_vlan_conf) {
 			proc_vlan_conf->proc_fops = &vlan_fops;
 			return 0;
-		}
+		} else
+			printk(KERN_WARNING "Unable to create '%s' proc entry.\n", name_conf);
 	}
 	vlan_proc_cleanup();
 	return -ENOBUFS;
@@ -188,8 +189,10 @@ int vlan_proc_add_dev (struct net_device
 	dev_info->dent = create_proc_entry(vlandev->name,
 					   S_IFREG|S_IRUSR|S_IWUSR,
 					   proc_vlan_dir);
-	if (!dev_info->dent)
+	if (!dev_info->dent) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", vlandev->name);
 		return -ENOBUFS;
+	}
 
 	dev_info->dent->proc_fops = &vlandev_fops;
 	dev_info->dent->data = vlandev;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/appletalk/atalk_proc.c linux-2.6.18-rc7/net/appletalk/atalk_proc.c
--- linux-2.6.18-rc7-orig/net/appletalk/atalk_proc.c	2006-09-15 15:28:51.000000000 +0530
+++ linux-2.6.18-rc7/net/appletalk/atalk_proc.c	2006-09-19 10:10:25.000000000 +0530
@@ -277,23 +277,31 @@ int __init atalk_proc_init(void)
 	atalk_proc_dir->owner = THIS_MODULE;
 
 	p = create_proc_entry("interface", S_IRUGO, atalk_proc_dir);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'interface' proc entry.\n");
 		goto out_interface;
+	}
 	p->proc_fops = &atalk_seq_interface_fops;
 
 	p = create_proc_entry("route", S_IRUGO, atalk_proc_dir);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'route' proc entry.\n");
 		goto out_route;
+	}
 	p->proc_fops = &atalk_seq_route_fops;
 
 	p = create_proc_entry("socket", S_IRUGO, atalk_proc_dir);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'socket' proc entry.\n");
 		goto out_socket;
+	}
 	p->proc_fops = &atalk_seq_socket_fops;
 
 	p = create_proc_entry("arp", S_IRUGO, atalk_proc_dir);
-	if (!p) 
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'arp' proc entry.\n");
 		goto out_arp;
+	}
 	p->proc_fops = &atalk_seq_arp_fops;
 
 	rc = 0;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/atm/br2684.c linux-2.6.18-rc7/net/atm/br2684.c
--- linux-2.6.18-rc7-orig/net/atm/br2684.c	2006-09-15 15:28:51.000000000 +0530
+++ linux-2.6.18-rc7/net/atm/br2684.c	2006-09-19 10:11:18.000000000 +0530
@@ -781,8 +781,10 @@ static int __init br2684_init(void)
 {
 #ifdef CONFIG_PROC_FS
 	struct proc_dir_entry *p;
-	if ((p = create_proc_entry("br2684", 0, atm_proc_root)) = NULL)
+	if ((p = create_proc_entry("br2684", 0, atm_proc_root)) = NULL) {
+		printk(KERN_ERR "Unable to create 'br2684' proc entry.\n");
 		return -ENOMEM;
+	}
 	p->proc_fops = &br2684_proc_ops;
 #endif
 	register_atm_ioctl(&br2684_ioctl_ops);
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/atm/clip.c linux-2.6.18-rc7/net/atm/clip.c
--- linux-2.6.18-rc7-orig/net/atm/clip.c	2006-09-15 15:28:51.000000000 +0530
+++ linux-2.6.18-rc7/net/atm/clip.c	2006-09-19 10:11:58.000000000 +0530
@@ -977,6 +977,8 @@ static int __init atm_clip_init(void)
 		p = create_proc_entry("arp", S_IRUGO, atm_proc_root);
 		if (p)
 			p->proc_fops = &arp_seq_fops;
+		else
+			printk(KERN_WARNING "Unable to create 'arp' proc entry.\n");
 	}
 #endif
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/atm/lec.c linux-2.6.18-rc7/net/atm/lec.c
--- linux-2.6.18-rc7-orig/net/atm/lec.c	2006-09-15 15:28:51.000000000 +0530
+++ linux-2.6.18-rc7/net/atm/lec.c	2006-09-19 10:15:27.000000000 +0530
@@ -1228,6 +1228,8 @@ static int __init lane_module_init(void)
 	p = create_proc_entry("lec", S_IRUGO, atm_proc_root);
 	if (p)
 		p->proc_fops = &lec_seq_fops;
+	else
+		printk(KERN_WARNING "Unable to create 'lec' proc entry.\n");
 #endif
 
 	register_atm_ioctl(&lane_ioctl_ops);
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/atm/proc.c linux-2.6.18-rc7/net/atm/proc.c
--- linux-2.6.18-rc7-orig/net/atm/proc.c	2006-09-15 15:28:51.000000000 +0530
+++ linux-2.6.18-rc7/net/atm/proc.c	2006-09-19 10:19:06.000000000 +0530
@@ -433,8 +433,10 @@ int atm_proc_dev_register(struct atm_dev
 	sprintf(dev->proc_name,"%s:%d",dev->type, dev->number);
 
 	dev->proc_entry = create_proc_entry(dev->proc_name, 0, atm_proc_root);
-	if (!dev->proc_entry)
+	if (!dev->proc_entry) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", dev->proc_name);
 		goto err_free_name;
+	}
 	dev->proc_entry->data = dev;
 	dev->proc_entry->proc_fops = &proc_atm_dev_ops;
 	dev->proc_entry->owner = THIS_MODULE;
@@ -490,8 +492,10 @@ int __init atm_proc_init(void)
 		struct proc_dir_entry *dirent;
 
 		dirent = create_proc_entry(e->name, S_IRUGO, atm_proc_root);
-		if (!dirent)
+		if (!dirent) {
+			printk(KERN_ERR "Unable to create '%s' proc entry.\n", e->name);
 			goto err_out_remove;
+		}
 		dirent->proc_fops = e->proc_fops;
 		dirent->owner = THIS_MODULE;
 		e->dirent = dirent;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/ieee80211/ieee80211_module.c linux-2.6.18-rc7/net/ieee80211/ieee80211_module.c
--- linux-2.6.18-rc7-orig/net/ieee80211/ieee80211_module.c	2006-09-15 15:28:51.000000000 +0530
+++ linux-2.6.18-rc7/net/ieee80211/ieee80211_module.c	2006-09-19 10:20:51.000000000 +0530
@@ -255,6 +255,7 @@ static int __init ieee80211_init(void)
 	e = create_proc_entry("debug_level", S_IFREG | S_IRUGO | S_IWUSR,
 			      ieee80211_proc);
 	if (!e) {
+		printk(KERN_ERR "Unable to create 'debug_level' proc entry.\n");
 		remove_proc_entry(DRV_NAME, proc_net);
 		ieee80211_proc = NULL;
 		return -EIO;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/ipv4/netfilter/ip_conntrack_standalone.c linux-2.6.18-rc7/net/ipv4/netfilter/ip_conntrack_standalone.c
--- linux-2.6.18-rc7-orig/net/ipv4/netfilter/ip_conntrack_standalone.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/ipv4/netfilter/ip_conntrack_standalone.c	2006-09-19 10:21:48.000000000 +0530
@@ -841,8 +841,10 @@ static int __init ip_conntrack_standalon
 	if (!proc_exp) goto cleanup_proc;
 
 	proc_stat = create_proc_entry("ip_conntrack", S_IRUGO, proc_net_stat);
-	if (!proc_stat)
+	if (!proc_stat) {
+		printk(KERN_ERR "Unable to create 'ip_conntrack' proc entry.\n");
 		goto cleanup_proc_exp;
+	}
 
 	proc_stat->proc_fops = &ct_cpu_seq_fops;
 	proc_stat->owner = THIS_MODULE;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/ipv4/netfilter/ipt_CLUSTERIP.c linux-2.6.18-rc7/net/ipv4/netfilter/ipt_CLUSTERIP.c
--- linux-2.6.18-rc7-orig/net/ipv4/netfilter/ipt_CLUSTERIP.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/ipv4/netfilter/ipt_CLUSTERIP.c	2006-09-19 10:22:38.000000000 +0530
@@ -191,6 +191,7 @@ clusterip_config_init(struct ipt_cluster
 	sprintf(buffer, "%u.%u.%u.%u", NIPQUAD(ip));
 	c->pde = create_proc_entry(buffer, S_IWUSR|S_IRUSR, clusterip_procdir);
 	if (!c->pde) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", buffer);
 		kfree(c);
 		return NULL;
 	}
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/ipv4/netfilter/ipt_hashlimit.c linux-2.6.18-rc7/net/ipv4/netfilter/ipt_hashlimit.c
--- linux-2.6.18-rc7-orig/net/ipv4/netfilter/ipt_hashlimit.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/ipv4/netfilter/ipt_hashlimit.c	2006-09-19 10:23:19.000000000 +0530
@@ -221,6 +221,7 @@ static int htable_create(struct ipt_hash
 	spin_lock_init(&hinfo->lock);
 	hinfo->pde = create_proc_entry(minfo->name, 0, hashlimit_procdir);
 	if (!hinfo->pde) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", minfo->name);
 		vfree(hinfo);
 		return -1;
 	}
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/ipv4/netfilter/ipt_recent.c linux-2.6.18-rc7/net/ipv4/netfilter/ipt_recent.c
--- linux-2.6.18-rc7-orig/net/ipv4/netfilter/ipt_recent.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/ipv4/netfilter/ipt_recent.c	2006-09-19 10:23:56.000000000 +0530
@@ -270,6 +270,7 @@ ipt_recent_checkentry(const char *tablen
 #ifdef CONFIG_PROC_FS
 	t->proc = create_proc_entry(t->name, ip_list_perms, proc_dir);
 	if (t->proc = NULL) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", t->name);
 		kfree(t);
 		goto out;
 	}
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/ipv4/route.c linux-2.6.18-rc7/net/ipv4/route.c
--- linux-2.6.18-rc7-orig/net/ipv4/route.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/ipv4/route.c	2006-09-19 10:25:30.000000000 +0530
@@ -3194,6 +3194,8 @@ int __init ip_rt_init(void)
 	if (!proc_net_fops_create("rt_cache", S_IRUGO, &rt_cache_seq_fops) ||
 	    !(rtstat_pde = create_proc_entry("rt_cache", S_IRUGO, 
 			    		     proc_net_stat))) {
+		if (!rtstat_pde)
+			printk(KERN_ERR "Unable to create 'rt_cache' proc entry.\n");
 		return -ENOMEM;
 	}
 	rtstat_pde->proc_fops = &rt_cpu_seq_fops;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/ipv6/proc.c linux-2.6.18-rc7/net/ipv6/proc.c
--- linux-2.6.18-rc7-orig/net/ipv6/proc.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/ipv6/proc.c	2006-09-19 10:26:11.000000000 +0530
@@ -207,8 +207,10 @@ int snmp6_register_dev(struct inet6_dev 
 		return -ENOENT;
 
 	p = create_proc_entry(idev->dev->name, S_IRUGO, proc_net_devsnmp6);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", idev->dev->name);
 		return -ENOMEM;
+	}
 
 	p->data = idev;
 	p->proc_fops = &snmp6_seq_fops;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/ipx/ipx_proc.c linux-2.6.18-rc7/net/ipx/ipx_proc.c
--- linux-2.6.18-rc7-orig/net/ipx/ipx_proc.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/ipx/ipx_proc.c	2006-09-19 10:27:40.000000000 +0530
@@ -358,18 +358,24 @@ int __init ipx_proc_init(void)
 	if (!ipx_proc_dir)
 		goto out;
 	p = create_proc_entry("interface", S_IRUGO, ipx_proc_dir);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'interface' proc entry.\n");
 		goto out_interface;
+	}
 
 	p->proc_fops = &ipx_seq_interface_fops;
 	p = create_proc_entry("route", S_IRUGO, ipx_proc_dir);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'route' proc entry.\n");
 		goto out_route;
+	}
 
 	p->proc_fops = &ipx_seq_route_fops;
 	p = create_proc_entry("socket", S_IRUGO, ipx_proc_dir);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'socket' proc entry.\n");
 		goto out_socket;
+	}
 
 	p->proc_fops = &ipx_seq_socket_fops;
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/irda/ircomm/ircomm_core.c linux-2.6.18-rc7/net/irda/ircomm/ircomm_core.c
--- linux-2.6.18-rc7-orig/net/irda/ircomm/ircomm_core.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/irda/ircomm/ircomm_core.c	2006-09-19 12:03:34.000000000 +0530
@@ -76,11 +76,12 @@ static int __init ircomm_init(void)
 	}
 	
 #ifdef CONFIG_PROC_FS
-	{ struct proc_dir_entry *ent;
+	struct proc_dir_entry *ent;
 	ent = create_proc_entry("ircomm", 0, proc_irda);
 	if (ent) 
 		ent->proc_fops = &ircomm_proc_fops;
-	}
+	else
+		printk(KERN_WARNING "Unable to create 'ircomm' proc entry.\n");
 #endif /* CONFIG_PROC_FS */
 	
 	IRDA_MESSAGE("IrCOMM protocol (Dag Brattli)\n");
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/irda/irproc.c linux-2.6.18-rc7/net/irda/irproc.c
--- linux-2.6.18-rc7-orig/net/irda/irproc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/net/irda/irproc.c	2006-09-19 10:30:51.000000000 +0530
@@ -75,6 +75,8 @@ void __init irda_proc_register(void) 
 		d = create_proc_entry(irda_dirs[i].name, 0, proc_irda);
 		if (d) 
 			d->proc_fops = irda_dirs[i].fops;
+		else
+			printk(KERN_WARNING "Unable to create '%s' proc entry.\n", irda_dirs[i].name);
 	}
 }
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/llc/llc_proc.c linux-2.6.18-rc7/net/llc/llc_proc.c
--- linux-2.6.18-rc7-orig/net/llc/llc_proc.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/llc/llc_proc.c	2006-09-19 10:32:24.000000000 +0530
@@ -237,14 +237,18 @@ int __init llc_proc_init(void)
 	llc_proc_dir->owner = THIS_MODULE;
 
 	p = create_proc_entry("socket", S_IRUGO, llc_proc_dir);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'socket' proc entry.\n");
 		goto out_socket;
+	}
 
 	p->proc_fops = &llc_seq_socket_fops;
 
 	p = create_proc_entry("core", S_IRUGO, llc_proc_dir);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'core' proc entry.\n");
 		goto out_core;
+	}
 
 	p->proc_fops = &llc_seq_core_fops;
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/netfilter/nf_conntrack_standalone.c linux-2.6.18-rc7/net/netfilter/nf_conntrack_standalone.c
--- linux-2.6.18-rc7-orig/net/netfilter/nf_conntrack_standalone.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/netfilter/nf_conntrack_standalone.c	2006-09-19 10:33:03.000000000 +0530
@@ -783,8 +783,10 @@ static int __init nf_conntrack_standalon
 	if (!proc_exp) goto cleanup_proc;
 
 	proc_stat = create_proc_entry("nf_conntrack", S_IRUGO, proc_net_stat);
-	if (!proc_stat)
+	if (!proc_stat) {
+		printk(KERN_ERR "Unable to create 'nf_conntrack' proc entry.\n");
 		goto cleanup_proc_exp;
+	}
 
 	proc_stat->proc_fops = &ct_cpu_seq_fops;
 	proc_stat->owner = THIS_MODULE;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/netfilter/nf_log.c linux-2.6.18-rc7/net/netfilter/nf_log.c
--- linux-2.6.18-rc7-orig/net/netfilter/nf_log.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/netfilter/nf_log.c	2006-09-19 10:37:03.000000000 +0530
@@ -168,8 +168,10 @@ int __init netfilter_log_init(void)
 	struct proc_dir_entry *pde;
 
 	pde = create_proc_entry("nf_log", S_IRUGO, proc_net_netfilter);
-	if (!pde)
+	if (!pde) {
+		printk(KERN_ERR "Unable to create 'nf_log' proc entry.\n");
 		return -1;
+	}
 
 	pde->proc_fops = &nflog_file_ops;
 #endif
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/netfilter/nfnetlink_log.c linux-2.6.18-rc7/net/netfilter/nfnetlink_log.c
--- linux-2.6.18-rc7-orig/net/netfilter/nfnetlink_log.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/netfilter/nfnetlink_log.c	2006-09-19 10:39:08.000000000 +0530
@@ -1061,8 +1061,10 @@ static int __init nfnetlink_log_init(voi
 #ifdef CONFIG_PROC_FS
 	proc_nful = create_proc_entry("nfnetlink_log", 0440,
 				      proc_net_netfilter);
-	if (!proc_nful)
+	if (!proc_nful) {
+		printk(KERN_ERR "Unable to create 'nfnetlink_log' proc entry.\n");
 		goto cleanup_subsys;
+	}
 	proc_nful->proc_fops = &nful_file_ops;
 #endif
 	return status;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/netfilter/nfnetlink_queue.c linux-2.6.18-rc7/net/netfilter/nfnetlink_queue.c
--- linux-2.6.18-rc7-orig/net/netfilter/nfnetlink_queue.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/netfilter/nfnetlink_queue.c	2006-09-19 10:39:42.000000000 +0530
@@ -1099,8 +1099,10 @@ static int __init nfnetlink_queue_init(v
 #ifdef CONFIG_PROC_FS
 	proc_nfqueue = create_proc_entry("nfnetlink_queue", 0440,
 					 proc_net_netfilter);
-	if (!proc_nfqueue)
+	if (!proc_nfqueue) {
+		printk(KERN_ERR "Unable to create 'nfnetlink_queue' proc entry.\n");
 		goto cleanup_subsys;
+	}
 	proc_nfqueue->proc_fops = &nfqnl_file_ops;
 #endif
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/netfilter/nf_queue.c linux-2.6.18-rc7/net/netfilter/nf_queue.c
--- linux-2.6.18-rc7-orig/net/netfilter/nf_queue.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/netfilter/nf_queue.c	2006-09-19 10:37:36.000000000 +0530
@@ -307,8 +307,10 @@ int __init netfilter_queue_init(void)
 	struct proc_dir_entry *pde;
 
 	pde = create_proc_entry("nf_queue", S_IRUGO, proc_net_netfilter);
-	if (!pde)
+	if (!pde) {
+		printk(KERN_ERR "Unable to create 'nf_queue' proc entry.\n");
 		return -1;
+	}
 	pde->proc_fops = &nfqueue_file_ops;
 #endif
 	return 0;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/rxrpc/proc.c linux-2.6.18-rc7/net/rxrpc/proc.c
--- linux-2.6.18-rc7-orig/net/rxrpc/proc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/net/rxrpc/proc.c	2006-09-19 10:40:59.000000000 +0530
@@ -139,26 +139,34 @@ int rxrpc_proc_init(void)
 	proc_rxrpc->owner = THIS_MODULE;
 
 	p = create_proc_entry("calls", 0, proc_rxrpc);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'calls' proc entry.\n");
 		goto error_proc;
+	}
 	p->proc_fops = &rxrpc_proc_calls_fops;
 	p->owner = THIS_MODULE;
 
 	p = create_proc_entry("connections", 0, proc_rxrpc);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'connections' proc entry.\n");
 		goto error_calls;
+	}
 	p->proc_fops = &rxrpc_proc_conns_fops;
 	p->owner = THIS_MODULE;
 
 	p = create_proc_entry("peers", 0, proc_rxrpc);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'peers' proc entry.\n");
 		goto error_calls;
+	}
 	p->proc_fops = &rxrpc_proc_peers_fops;
 	p->owner = THIS_MODULE;
 
 	p = create_proc_entry("transports", 0, proc_rxrpc);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'transports' proc entry.\n");
 		goto error_conns;
+	}
 	p->proc_fops = &rxrpc_proc_transports_fops;
 	p->owner = THIS_MODULE;
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/sctp/proc.c linux-2.6.18-rc7/net/sctp/proc.c
--- linux-2.6.18-rc7-orig/net/sctp/proc.c	2006-08-24 02:46:33.000000000 +0530
+++ linux-2.6.18-rc7/net/sctp/proc.c	2006-09-19 10:42:16.000000000 +0530
@@ -113,8 +113,10 @@ int __init sctp_snmp_proc_init(void)
 	struct proc_dir_entry *p;
 
 	p = create_proc_entry("snmp", S_IRUGO, proc_net_sctp);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'snmp' proc entry.\n");
 		return -ENOMEM;
+	}
 
 	p->proc_fops = &sctp_snmp_seq_fops;
 
@@ -262,8 +264,10 @@ int __init sctp_eps_proc_init(void)
 	struct proc_dir_entry *p;
 
 	p = create_proc_entry("eps", S_IRUGO, proc_net_sctp);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'eps' proc entry.\n");
 		return -ENOMEM;
+	}
 
 	p->proc_fops = &sctp_eps_seq_fops;
 
@@ -372,8 +376,10 @@ int __init sctp_assocs_proc_init(void)
 	struct proc_dir_entry *p;
 
 	p = create_proc_entry("assocs", S_IRUGO, proc_net_sctp);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'assocs' proc entry.\n");
 		return -ENOMEM;
+	}
 
 	p->proc_fops = &sctp_assocs_seq_fops;
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/sunrpc/cache.c linux-2.6.18-rc7/net/sunrpc/cache.c
--- linux-2.6.18-rc7-orig/net/sunrpc/cache.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/sunrpc/cache.c	2006-09-19 10:44:56.000000000 +0530
@@ -302,7 +302,8 @@ void cache_register(struct cache_detail 
  			p->proc_fops = &cache_flush_operations;
  			p->owner = cd->owner;
  			p->data = cd;
- 		}
+ 		} else
+			printk(KERN_WARNING "Unable to create 'flush' proc entry.\n");
  
 		if (cd->cache_request || cd->cache_parse) {
 			p = create_proc_entry("channel", S_IFREG|S_IRUSR|S_IWUSR,
@@ -312,7 +313,8 @@ void cache_register(struct cache_detail 
 				p->proc_fops = &cache_file_operations;
 				p->owner = cd->owner;
 				p->data = cd;
-			}
+			} else
+				printk(KERN_WARNING "Unable to create 'channel' proc entry.\n");
 		}
  		if (cd->cache_show) {
  			p = create_proc_entry("content", S_IFREG|S_IRUSR|S_IWUSR,
@@ -322,7 +324,8 @@ void cache_register(struct cache_detail 
  				p->proc_fops = &content_file_operations;
  				p->owner = cd->owner;
  				p->data = cd;
- 			}
+			} else
+				printk(KERN_WARNING "Unable to create 'content' proc entry.\n");
  		}
 	}
 	rwlock_init(&cd->hash_lock);
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/sunrpc/stats.c linux-2.6.18-rc7/net/sunrpc/stats.c
--- linux-2.6.18-rc7-orig/net/sunrpc/stats.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/sunrpc/stats.c	2006-09-19 10:49:40.000000000 +0530
@@ -232,7 +232,9 @@ do_register(const char *name, void *data
 	if (ent) {
 		ent->proc_fops = fops;
 		ent->data = data;
-	}
+	} else
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", name);
+	
 	return ent;
 }
 
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/wanrouter/wanproc.c linux-2.6.18-rc7/net/wanrouter/wanproc.c
--- linux-2.6.18-rc7-orig/net/wanrouter/wanproc.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/wanrouter/wanproc.c	2006-09-19 10:55:10.000000000 +0530
@@ -292,12 +292,16 @@ int __init wanrouter_proc_init(void)
 		goto fail;
 
 	p = create_proc_entry("config", S_IRUGO, proc_router);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'config' proc entry.\n");
 		goto fail_config;
+	}
 	p->proc_fops = &config_fops;
 	p = create_proc_entry("status", S_IRUGO, proc_router);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'status' proc entry.\n");
 		goto fail_stat;
+	}
 	p->proc_fops = &status_fops;
 	return 0;
 fail_stat:
@@ -329,8 +333,10 @@ int wanrouter_proc_add(struct wan_device
 		return -EINVAL;
 
 	wandev->dent = create_proc_entry(wandev->name, S_IRUGO, proc_router);
-	if (!wandev->dent)
+	if (!wandev->dent) {
+		printk(KERN_ERR "Unable to create '%s' proc entry.\n", wandev->name);
 		return -ENOMEM;
+	}
 	wandev->dent->proc_fops	= &wandev_fops;
 	wandev->dent->data	= wandev;
 	return 0;
diff -uprN -X linux-2.6.18-rc7-orig/Documentation/dontdiff linux-2.6.18-rc7-orig/net/x25/x25_proc.c linux-2.6.18-rc7/net/x25/x25_proc.c
--- linux-2.6.18-rc7-orig/net/x25/x25_proc.c	2006-09-15 15:28:52.000000000 +0530
+++ linux-2.6.18-rc7/net/x25/x25_proc.c	2006-09-19 10:57:27.000000000 +0530
@@ -217,13 +217,17 @@ int __init x25_proc_init(void)
 		goto out;
 
 	p = create_proc_entry("route", S_IRUGO, x25_proc_dir);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'route' proc entry.\n");
 		goto out_route;
+	}
 	p->proc_fops = &x25_seq_route_fops;
 
 	p = create_proc_entry("socket", S_IRUGO, x25_proc_dir);
-	if (!p)
+	if (!p) {
+		printk(KERN_ERR "Unable to create 'socket' proc entry.\n");
 		goto out_socket;
+	}
 	p->proc_fops = &x25_seq_socket_fops;
 	rc = 0;
 out:


_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
