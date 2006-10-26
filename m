From: "Mike D. Day" <ncmike@us.ibm.com>
Date: Thu, 26 Oct 2006 15:24:50 +0000
Subject: [KJ] [PATCH] driver core: check return codes in base/core.c
Message-Id: <20061026152450.GA24453@silverwood.ncultra.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============0065525983=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--===============0065525983==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="envbJBWh7q8WU6mo"
Content-Disposition: inline


--envbJBWh7q8WU6mo
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

    check return codes in drivers/base/core.c for functions with
    attribute warn_unused_result. Handle errors appropriately. Fixed
    one overlong line, checked with sparse.
   =20
    signed-off-by: Mike D. Day <ncmike@us.ibm.com>

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 68ad11a..bda0f9e 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -187,7 +187,8 @@ static int dev_uevent(struct kset *kset,
=20
 	if (dev->class && dev->class->dev_uevent) {
 		/* have the class specific function add its stuff */
-		retval =3D dev->class->dev_uevent(dev, envp, num_envp, buffer, buffer_si=
ze);
+		retval =3D dev->class->dev_uevent(dev, envp, num_envp, buffer,
+						buffer_size);
 			if (retval) {
 				pr_debug("%s - dev_uevent() returned %d\n",
 					 __FUNCTION__, retval);
@@ -459,15 +460,36 @@ int device_add(struct device *dev)
 	}
=20
 	if (dev->class) {
-		sysfs_create_link(&dev->kobj, &dev->class->subsys.kset.kobj,
-				  "subsystem");
-		sysfs_create_link(&dev->class->subsys.kset.kobj, &dev->kobj,
-				  dev->bus_id);
+		error =3D sysfs_create_link(&dev->kobj,
+					  &dev->class->subsys.kset.kobj,
+					  "subsystem");
+		if (error)
+			goto AttrsError;
+		error =3D sysfs_create_link(&dev->class->subsys.kset.kobj,
+					  &dev->kobj,
+					  dev->bus_id);
+		if (error)
+			goto sysfsError1;
+
 		if (parent) {
-			sysfs_create_link(&dev->kobj, &dev->parent->kobj, "device");
+			error =3D sysfs_create_link(&dev->kobj,
+						  &dev->parent->kobj,
+						  "device");
+			if (error)
+				goto sysfsError2;
+
 			class_name =3D make_class_name(dev->class->name, &dev->kobj);
-			sysfs_create_link(&dev->parent->kobj, &dev->kobj, class_name);
+			if (IS_ERR(class_name)) {
+				error =3D (unsigned long)class_name;
+				goto sysfsError3;
+			}
+
+			error =3D sysfs_create_link(&dev->parent->kobj,
+						  &dev->kobj, class_name);
+			if (error)
+				goto sysfsError3;
 		}
+
 	}
=20
 	if ((error =3D device_add_attrs(dev)))
@@ -507,6 +529,13 @@ int device_add(struct device *dev)
 	device_remove_groups(dev);
  GroupError:
  	device_remove_attrs(dev);
+ sysfsError3:
+	sysfs_remove_link(&dev->kobj, "device");
+ sysfsError2:
+	sysfs_remove_link(&dev->class->subsys.kset.kobj,
+			  dev->bus_id);
+ sysfsError1:
+	sysfs_remove_link(&dev->kobj, "subsystem");
  AttrsError:
 	if (dev->devt_attr) {
 		device_remove_file(dev, dev->devt_attr);
@@ -819,27 +848,34 @@ int device_rename(struct device *dev, ch
 		strlcpy(old_symlink_name, dev->bus_id, BUS_ID_SIZE);
 	}
=20
-	strlcpy(dev->bus_id, new_name, BUS_ID_SIZE);
-
 	error =3D kobject_rename(&dev->kobj, new_name);
+	if (error)
+		goto out_free_old_symlink;
+
+	strlcpy(dev->bus_id, new_name, BUS_ID_SIZE);
=20
 	if (old_class_name) {
 		new_class_name =3D make_class_name(dev->class->name, &dev->kobj);
 		if (new_class_name) {
-			sysfs_create_link(&dev->parent->kobj, &dev->kobj,
-					  new_class_name);
-			sysfs_remove_link(&dev->parent->kobj, old_class_name);
+			error =3D sysfs_create_link(&dev->parent->kobj,
+						  &dev->kobj, new_class_name);
+			if (!error)
+				sysfs_remove_link(&dev->parent->kobj,
+						  old_class_name);
 		}
 	}
+
 	if (dev->class) {
-		sysfs_remove_link(&dev->class->subsys.kset.kobj,
-				  old_symlink_name);
-		sysfs_create_link(&dev->class->subsys.kset.kobj, &dev->kobj,
-				  dev->bus_id);
+		error =3D sysfs_create_link(&dev->class->subsys.kset.kobj,
+					  &dev->kobj, dev->bus_id);
+		if (!error)
+			sysfs_remove_link(&dev->class->subsys.kset.kobj,
+					  old_symlink_name);
 	}
 	put_device(dev);
=20
 	kfree(new_class_name);
+out_free_old_symlink:
 	kfree(old_symlink_name);
  out_free_old_class:
 	kfree(old_class_name);

--=20
Mike D. Day
IBM LTC
Cell: 919 412-3900
Sametime: ncmike@us.ibm.com AIM: ncmikeday  Yahoo: ultra.runner
PGP key: http://www.ncultra.org/ncmike/pubkey.asc

--=20
Mike D. Day
IBM LTC
Cell: 919 412-3900
Sametime: ncmike@us.ibm.com AIM: ncmikeday  Yahoo: ultra.runner
PGP key: http://www.ncultra.org/ncmike/pubkey.asc

--envbJBWh7q8WU6mo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQFFQNNCOycxVEUrfCERAlCoAJ0d7T1p6FHXfC9Y+E/YeaUJKHUjmACglnG4
hI2KNmHZxJTIXw+D/ccqSas=
=5aE4
-----END PGP SIGNATURE-----

--envbJBWh7q8WU6mo--

--===============0065525983==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============0065525983==--
