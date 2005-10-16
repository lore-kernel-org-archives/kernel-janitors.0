From: irwan.djajadi@iname.com
Date: Sun, 16 Oct 2005 01:51:36 +0000
Subject: [KJ] [PATCH 2.6.14-rc4 1/1] acpi: kmalloc failure handling
Message-Id: <20051016015135.GA14273@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93559503222721863=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============93559503222721863==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Added kmalloc failure handling in acpi_os_create_lock()

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

--- 2.6.14-rc4/drivers/acpi/osl.c	2005-10-15 17:38:58.000000000 -0500
+++ 2.6.14-rc4-mod1/drivers/acpi/osl.c	2005-10-15 20:44:29.000000000 -0500
@@ -702,6 +702,10 @@ acpi_status acpi_os_create_lock(acpi_han
 	ACPI_FUNCTION_TRACE("os_create_lock");
 
 	lock_ptr = acpi_os_allocate(sizeof(spinlock_t));
+	if (!lock_ptr) {
+		ACPI_DEBUG_PRINT ((ACPI_DB_ERROR, "Failed to allocate spinlock.\n"));
+		return AE_NO_MEMORY;
+	}
 
 	spin_lock_init(lock_ptr);
 

--===============93559503222721863==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93559503222721863==--
