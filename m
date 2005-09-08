From: Christophe Lucas <clucas@rotomalug.org>
Date: Thu, 08 Sep 2005 06:55:53 +0000
Subject: [KJ] [PATCH] printk :
Message-Id: <20050908065553.GA26072@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61161173592559881=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050323135158.GG9206@rhum.iomeda.fr>
In-Reply-To: <20050323135158.GG9206@rhum.iomeda.fr>
To: kernel-janitors@vger.kernel.org

--===============61161173592559881==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
printk() calls should include appropriate KERN_* constant.

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>


Index: linux-2.6.13/Documentation/firmware_class/firmware_sample_driver.c
===================================================================
--- linux-2.6.13.orig/Documentation/firmware_class/firmware_sample_driver.c
+++ linux-2.6.13/Documentation/firmware_class/firmware_sample_driver.c
@@ -32,14 +32,14 @@ static void sample_firmware_load(char *f
 	u8 buf[size+1];
 	memcpy(buf, firmware, size);
 	buf[size] = '\0';
-	printk("firmware_sample_driver: firmware: %s\n", buf);
+	printk(KERN_INFO "firmware_sample_driver: firmware: %s\n", buf);
 }
 
 static void sample_probe_default(void)
 {
 	/* uses the default method to get the firmware */
         const struct firmware *fw_entry;
-	printk("firmware_sample_driver: a ghost device got inserted :)\n");
+	printk(KERN_INFO "firmware_sample_driver: a ghost device got inserted :)\n");
 
         if(request_firmware(&fw_entry, "sample_driver_fw", &ghost_device)!=0)
 	{
@@ -61,7 +61,7 @@ static void sample_probe_specific(void)
 
 	/* NOTE: This currently doesn't work */
 
-	printk("firmware_sample_driver: a ghost device got inserted :)\n");
+	printk(KERN_INFO "firmware_sample_driver: a ghost device got inserted :)\n");
 
         if(request_firmware(NULL, "sample_driver_fw", &ghost_device)!=0)
 	{
@@ -83,7 +83,7 @@ static void sample_probe_async_cont(cons
 		return;
 	}
 
-	printk("firmware_sample_driver: device pointer \"%s\"\n",
+	printk(KERN_INFO "firmware_sample_driver: device pointer \"%s\"\n",
 	       (char *)context);
 	sample_firmware_load(fw->data, fw->size);
 }


--===============61161173592559881==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61161173592559881==--
