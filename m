From: Christophe Lucas <clucas@rotomalug.org>
Date: Fri, 01 Apr 2005 12:20:30 +0000
Subject: [KJ] [PATCH] char* : drivers/char/agp/intel-agp.c
Message-Id: <20050401122030.GM5445@rhum.iomeda.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="+KJYzRxRHjYqLGl5"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Description:
String form : char foo[] = "blah" is better than char *foo = "blah"

Signed-off-by: Christophe Lucas <clucas@rotomalug.org>

--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="2.6.12-rc1-pointer_drivers_char_agp_intel-agp.c.patch"

diff -urpN -X dontdiff a/drivers/char/agp/intel-agp.c b/drivers/char/agp/intel-agp.c
--- a/drivers/char/agp/intel-agp.c	2005-03-18 02:34:12.000000000 +0100
+++ b/drivers/char/agp/intel-agp.c	2005-04-01 12:08:36.751735144 +0200
@@ -1532,7 +1532,7 @@ static int __devinit agp_intel_probe(str
 				     const struct pci_device_id *ent)
 {
 	struct agp_bridge_data *bridge;
-	char *name = "(unknown)";
+	char name[] = "(unknown)";
 	u8 cap_ptr = 0;
 	struct resource *r;
 

--+KJYzRxRHjYqLGl5
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--+KJYzRxRHjYqLGl5--
