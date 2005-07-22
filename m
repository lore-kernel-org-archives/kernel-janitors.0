From: Jan Veldeman <jan@mind.be>
Date: Fri, 22 Jul 2005 09:41:15 +0000
Subject: [KJ] [PATCH] Driver core: Documentation: use S_IRUSR | ... in stead
Message-Id: <20050722094115.GA7466@fanta>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============53168188842986264=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050721204958.GA24421@fanta>
In-Reply-To: <20050721204958.GA24421@fanta>
To: kernel-janitors@vger.kernel.org

--===============53168188842986264==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

After more nitpicking from Domen Puncer (when is this going to end!? :-) ):
(this patch replaces the previous one)


Change filemode to use defines in stead of 0644,
based on suggestions by Walter Harms and Domen Puncer.


Signed-off-by: Jan Veldeman <Jan.Veldeman@advalvas.be>


diff --git a/Documentation/filesystems/sysfs.txt b/Documentation/filesystems/sysfs.txt
--- a/Documentation/filesystems/sysfs.txt
+++ b/Documentation/filesystems/sysfs.txt
@@ -99,14 +99,14 @@ struct device_attribute dev_attr_##_name
 
 For example, declaring
 
-static DEVICE_ATTR(foo, 0644, show_foo, store_foo);
+static DEVICE_ATTR(foo, S_IWUSR | S_IRUGO, show_foo, store_foo);
 
 is equivalent to doing:
 
 static struct device_attribute dev_attr_foo = {
        .attr	= {
 		.name = "foo",
-		.mode = 0644,
+		.mode = S_IWUSR | S_IRUGO,
 	},
 	.show = show_foo,
 	.store = store_foo,


--===============53168188842986264==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============53168188842986264==--
