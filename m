From: Jan Veldeman <jan@mind.be>
Date: Thu, 21 Jul 2005 20:49:58 +0000
Subject: [KJ] [PATCH] Driver core: Documentation: use snprintf and strnlen
Message-Id: <20050721204958.GA24421@fanta>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============098747369344851954=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============098747369344851954==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


Documentation should give the good example of using snprintf and
strnlen in stead of sprintf and strlen.

PAGE_SIZE is used as the maximal length to reflect the behaviour of
show/store.


Signed-off-by: Jan Veldeman <Jan.Veldeman@advalvas.be>


diff --git a/Documentation/filesystems/sysfs.txt b/Documentation/filesystems/sysfs.txt
--- a/Documentation/filesystems/sysfs.txt
+++ b/Documentation/filesystems/sysfs.txt
@@ -216,13 +216,13 @@ A very simple (and naive) implementation
 
 static ssize_t show_name(struct device *dev, struct device_attribute *attr, char *buf)
 {
-        return sprintf(buf,"%s\n",dev->name);
+        return snprintf(buf,PAGE_SIZE,"%s\n",dev->name);
 }
 
 static ssize_t store_name(struct device * dev, const char * buf)
 {
 	sscanf(buf,"%20s",dev->name);
-	return strlen(buf);
+	return strnlen(buf,PAGE_SIZE);
 }
 
 static DEVICE_ATTR(name,S_IRUGO,show_name,store_name);




--===============098747369344851954==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============098747369344851954==--
