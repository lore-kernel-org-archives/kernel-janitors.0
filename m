From: Daniele Bellucci <bellucda@tiscali.it>
Date: Tue, 27 Apr 2004 18:57:06 +0000
Subject: Re: [Kernel-janitors] [PATCH] missing audit in bus_register()
Message-Id: <20040427185705.GA6398@charlie.minidns.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============26206439202159126=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040425215141.GA32051@charlie.minidns.net>
In-Reply-To: <20040425215141.GA32051@charlie.minidns.net>
To: kernel-janitors@vger.kernel.org

--===============26206439202159126==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


|How about using a goto on the error path to clean up properly
|instead of the different return sections.

.. here goes Take 2:


--- linux-2.6.6-rc2-bk3/drivers/base/bus.c.old	2004-04-28 20:37:42.885650656 +0200
+++ linux-2.6.6-rc2-bk3/drivers/base/bus.c	2004-04-28 20:45:18.675360088 +0200
@@ -555,21 +555,36 @@ struct bus_type * find_bus(char * name)
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
+		goto out;
 
 	kobject_set_name(&bus->devices.kobj, "devices");
 	bus->devices.subsys = &bus->subsys;
-	kset_register(&bus->devices);
+	retval = kset_register(&bus->devices);
+	if (retval)
+		goto bus_devices_fail;
 
 	kobject_set_name(&bus->drivers.kobj, "drivers");
 	bus->drivers.subsys = &bus->subsys;
 	bus->drivers.ktype = &ktype_driver;
-	kset_register(&bus->drivers);
+	retval = kset_register(&bus->drivers);
+	if (retval)
+		goto bus_drivers_fail;
 
 	pr_debug("bus type '%s' registered\n",bus->name);
 	return 0;
+
+bus_drivers_fail:
+	kset_unregister(&bus->devices);
+bus_devices_fail:
+	subsystem_unregister(&bus->subsys);
+out:
+	return retval;
 }
 
 


-- 

[Daniele]

--===============26206439202159126==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============26206439202159126==--
