From: "Darren Jenkins\\" <darrenrjenkins@gmail.com>
Date: Fri, 10 Feb 2006 12:37:39 +0000
Subject: [KJ][Patch] remove second masking instance of variable in pci_root.c
Message-Id: <1139575059.17620.36.camel@localhost.localdomain>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23047594685354778=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1139492214.17930.41.camel@localhost.localdomain>
In-Reply-To: <1139492214.17930.41.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============23047594685354778==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

G'day list.


from http://linuxicc.sourceforge.net/

Remark #1599: Declaration hides variable "variable name"

static int acpi_pci_root_add(struct acpi_device *device)

declares status twice:

159: "acpi_status status = AE_OK;"
and
232: "acpi_status status;"

This patch removes the second instance.

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>

--- linux-2.6.16-rc2/drivers/acpi/pci_root.c.orig	2006-02-10 23:24:36.000000000 +1100
+++ linux-2.6.16-rc2/drivers/acpi/pci_root.c	2006-02-10 23:28:38.000000000 +1100
@@ -229,7 +229,6 @@ static int acpi_pci_root_add(struct acpi
 		if ((tmp->id.segment == root->id.segment)
 		    && (tmp->id.bus == root->id.bus)) {
 			int bus = 0;
-			acpi_status status;
 
 			ACPI_DEBUG_PRINT((ACPI_DB_ERROR,
 					  "Wrong _BBN value, please reboot and using option 'pci=noacpi'\n"));



--===============23047594685354778==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23047594685354778==--
