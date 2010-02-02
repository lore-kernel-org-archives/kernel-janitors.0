From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Tue, 02 Feb 2010 12:12:10 +0000
Subject: [PATCH] drivers/acpi/ec.c fix a small memory leak
Message-Id: <1265112730.4804.8.camel@ICE-BOX>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kernel Janitors <kernel-janitors@vger.kernel.org>, Len Brown <lenb@kernel.org>, linux ACPI <linux-acpi@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, astarikovskiy@suse.de

Plug a very small leak in acpi_ec_ecdt_probe()

Coverity CID: 13319

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com> 

diff --git drivers/acpi/ec.c drivers/acpi/ec.c
index d6471bb..13061dc 100644
--- drivers/acpi/ec.c
+++ drivers/acpi/ec.c
@@ -1009,8 +1009,10 @@ int __init acpi_ec_ecdt_probe(void)
 	/* fall through */
 	}
 
-	if (EC_FLAGS_SKIP_DSDT_SCAN)
+	if (EC_FLAGS_SKIP_DSDT_SCAN) {
+		kfree(saved_ec);
 		return -ENODEV;
+	}
 
 	/* This workaround is needed only on some broken machines,
 	 * which require early EC, but fail to provide ECDT */


