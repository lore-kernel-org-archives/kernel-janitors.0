From: Daniele Bellucci <bellucda@tiscali.it>
Date: Sun, 25 Apr 2004 21:51:41 +0000
Subject: [Kernel-janitors] [PATCH] missing audit in bus_register()
Message-Id: <20040425215141.GA32051@charlie.minidns.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============10619973529534166=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============10619973529534166==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline



hi all, 
this patch add some missing audits in bus_register()

Please Apply ;)



--- drivers/base/bus.c.old	2004-04-26 23:25:32.030676016 +0200
+++ drivers/base/bus.c	2004-04-26 23:28:22.196806832 +0200
@@ -555,18 +555,31 @@ struct bus_type * find_bus(char * name)
  */
 int bus_register(struct bus_type * bus)
 {
+	int retval;
+
 	kobject_set_name(&bus->subsys.kset.kobj,bus->name);
 	subsys_set_kset(bus,bus_subsys);
-	subsystem_register(&bus->subsys);
+	retval = subsystem_register(&bus->subsys);
+	if (retval)
+		return retval;
 
 	kobject_set_name(&bus->devices.kobj, "devices");
 	bus->devices.subsys = &bus->subsys;
-	kset_register(&bus->devices);
+	retval = kset_register(&bus->devices);
+	if (retval) {
+		subsystem_unregister(&bus->subsys);
+		return retval;
+	}
 
 	kobject_set_name(&bus->drivers.kobj, "drivers");
 	bus->drivers.subsys = &bus->subsys;
 	bus->drivers.ktype = &ktype_driver;
-	kset_register(&bus->drivers);
+	retval = kset_register(&bus->drivers);
+	if (retval) {
+		kset_unregister(&bus->devices);
+		subsystem_unregister(&bus->subsys);
+		return retval;
+	}
 
 	pr_debug("bus type '%s' registered\n",bus->name);
 	return 0;


-- 

[Daniele]

--===============10619973529534166==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============10619973529534166==--
