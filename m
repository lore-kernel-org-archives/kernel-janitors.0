From: Jan Veldeman <jan@mind.be>
Date: Fri, 22 Jul 2005 08:19:29 +0000
Subject: [KJ] [PATCH] Driver core: Documentation: use S_IRUSR | ... in stead
Message-Id: <20050722081929.GA5465@fanta>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============68540959713658345=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050721204958.GA24421@fanta>
In-Reply-To: <20050721204958.GA24421@fanta>
To: kernel-janitors@vger.kernel.org

--===============68540959713658345==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Walter Harms wrote:
[...]
> >+static DEVICE_ATTR(foo, 0644, show_foo, store_foo);
> > 
> 
> just a bit nitpicking ...
>  0644 magic number in examples are bad (even when most kernelhacker 
> know was they mean).
[...]


As we're at it and on request from Walter Harms, also fix the file mode to
use the defines in stead of 0644.


Signed-off-by: Jan Veldeman <Jan.Veldeman@advalvas.be>


diff --git a/Documentation/filesystems/sysfs.txt b/Documentation/filesystems/sysfs.txt
--- a/Documentation/filesystems/sysfs.txt
+++ b/Documentation/filesystems/sysfs.txt
@@ -99,14 +99,15 @@ struct device_attribute dev_attr_##_name
 
 For example, declaring
 
-static DEVICE_ATTR(foo, 0644, show_foo, store_foo);
+static DEVICE_ATTR(foo, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH, show_foo,
+		   store_foo);
 
 is equivalent to doing:
 
 static struct device_attribute dev_attr_foo = {
        .attr	= {
 		.name = "foo",
-		.mode = 0644,
+		.mode = S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH,
 	},
 	.show = show_foo,
 	.store = store_foo,


--===============68540959713658345==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============68540959713658345==--
