From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 25 Mar 2005 13:43:30 +0000
Subject: [KJ] [PATCH] printk : drivers/block/paride/paride.c
Message-Id: <20050325134330.GR14356@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="rFUhhEVnhEf/dYhU"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050324161716.GA1855@rhum.iomeda.fr>
In-Reply-To: <20050324161716.GA1855@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org


--rFUhhEVnhEf/dYhU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


--rFUhhEVnhEf/dYhU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="patch-2.6.12-rc1_drivers_block_paride_paride.c.diff"

diff -urpN -X dontdiff a/drivers/block/paride/paride.c b/drivers/block/paride/paride.c
--- a/drivers/block/paride/paride.c	2005-03-18 02:33:54.000000000 +0100
+++ b/drivers/block/paride/paride.c	2005-03-22 16:48:14.000000000 +0100
@@ -208,7 +208,7 @@ static int default_test_proto(PIA * pi, 
 	pi->proto->disconnect(pi);
 
 	if (verbose)
-		printk("%s: %s: port 0x%x, mode  %d, test=(%d,%d)\n",
+		printk(KERN_INFO "%s: %s: port 0x%x, mode  %d, test=(%d,%d)\n",
 		       pi->device, pi->proto->name, pi->port,
 		       pi->mode, e[0], e[1]);
 
@@ -235,7 +235,7 @@ int pi_register(PIP * pr)
 
 	for (k = 0; k < MAX_PROTOS; k++)
 		if (protocols[k] && !strcmp(pr->name, protocols[k]->name)) {
-			printk("paride: %s protocol already registered\n",
+			printk(KERN_DEBUG "paride: %s protocol already registered\n",
 			       pr->name);
 			return 0;
 		}
@@ -243,12 +243,12 @@ int pi_register(PIP * pr)
 	while ((k < MAX_PROTOS) && (protocols[k]))
 		k++;
 	if (k == MAX_PROTOS) {
-		printk("paride: protocol table full\n");
+		printk(KERN_INFO "paride: protocol table full\n");
 		return 0;
 	}
 	protocols[k] = pr;
 	pr->index = k;
-	printk("paride: %s registered as protocol %d\n", pr->name, k);
+	printk(KERN_INFO "paride: %s registered as protocol %d\n", pr->name, k);
 	return 1;
 }
 
@@ -259,7 +259,7 @@ void pi_unregister(PIP * pr)
 	if (!pr)
 		return;
 	if (protocols[pr->index] != pr) {
-		printk("paride: %s not registered\n", pr->name);
+		printk(KERN_INFO "paride: %s not registered\n", pr->name);
 		return;
 	}
 	protocols[pr->index] = NULL;
@@ -287,7 +287,7 @@ static int pi_register_parport(PIA * pi,
 	init_waitqueue_head(&pi->parq);
 
 	if (verbose)
-		printk("%s: 0x%x is %s\n", pi->device, pi->port, port->name);
+		printk(KERN_DEBUG "%s: 0x%x is %s\n", pi->device, pi->port, port->name);
 
 	pi->parname = (char *) port->name;
 #endif
@@ -389,7 +389,7 @@ int pi_init(PIA * pi, int autoprobe, int
 	} else if ((s < 0) || (s >= MAX_PROTOS) || (port <= 0) ||
 		   (!protocols[s]) || (unit < 0) ||
 		   (unit >= protocols[s]->max_units)) {
-		printk("%s: Invalid parameters\n", device);
+		printk(KERN_NOTICE "%s: Invalid parameters\n", device);
 		return 0;
 	}
 
@@ -442,9 +442,9 @@ int pi_init(PIA * pi, int autoprobe, int
 
 	if (!pi->port) {
 		if (autoprobe)
-			printk("%s: Autoprobe failed\n", device);
+			printk(KERN_INFO "%s: Autoprobe failed\n", device);
 		else
-			printk("%s: Adapter not found\n", device);
+			printk(KERN_INFO "%s: Adapter not found\n", device);
 		return 0;
 	}
 #ifndef CONFIG_PARPORT
@@ -456,7 +456,7 @@ int pi_init(PIA * pi, int autoprobe, int
 #endif				/* !CONFIG_PARPORT */
 
 	if (pi->parname)
-		printk("%s: Sharing %s at 0x%x\n", pi->device,
+		printk(KERN_INFO "%s: Sharing %s at 0x%x\n", pi->device,
 		       pi->parname, pi->port);
 
 	pi->proto->log_adapter(pi, scratch, verbose);

--rFUhhEVnhEf/dYhU
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--rFUhhEVnhEf/dYhU--
