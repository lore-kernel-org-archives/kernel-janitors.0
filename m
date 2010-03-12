From: Wolfram Sang <w.sang@pengutronix.de>
Date: Fri, 12 Mar 2010 07:03:48 +0000
Subject: init dynamic bin_attribute structures
Message-Id: <1268377431-11671-1-git-send-email-w.sang@pengutronix.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

Hello,

I was pointed to the fact that commit 6992f5334995af474c2b58d010d08bc597f0f=
2fe
requires adjustments to dynamically created sysfs-attributes when Albrecht =
Dre=C3=9F
tried to compile the eeprom-driver at24 with lockdep enabled. After fixing =
this
for at24 and at25, I came up with this coccinelle-script to find further
candidates:

@ init @
identifier struct_name, bin;
@@

	struct struct_name {
		...
		struct bin_attribute bin;
		...
	};

@ main extends init @
expression E;
statement S;
identifier name, err;
@@

(
	struct struct_name *name;
|
-	struct struct_name *name =3D NULL;
+	struct struct_name *name;
)
	...
(
	sysfs_bin_attr_init(&name->bin);
|
+	sysfs_bin_attr_init(&name->bin);
	if (sysfs_create_bin_file(E, &name->bin))
		S
|
+	sysfs_bin_attr_init(&name->bin);
	err =3D sysfs_create_bin_file(E, &name->bin);
)

(Note: I did a similar script for non-binary attributes, too. That one didn=
't
find a match)

The resulting series is the edited outcome of that. "Edited" because the
patches were manually reviewed afterwards to find the best place to add the
fix. The patches are not more than compile-tested on x86 where possible due=
 to
no hardware. Please also note that my semantic patch is probably not perfect
and may have missed code still needing the fix.

Comments welcome, of course.

Regards,

   Wolfram Sang

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
