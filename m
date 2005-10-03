From: irwan.djajadi@iname.com
Date: Mon, 03 Oct 2005 04:00:21 +0000
Subject: [KJ] [PATCH 2.6.13.2 1/1] acpi: kmalloc failure handling
Message-Id: <20051003040021.GA25808@poopie.dyndns.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============86235856936620126=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============86235856936620126==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Added kmalloc failure handling on some acpi files

Signed-off-by: Irwan Djajadi <irwan.djajadi@iname.com>

diff -pruN 2.6/drivers/acpi/hotkey.c mod1-2.6/drivers/acpi/hotkey.c
--- 2.6/drivers/acpi/hotkey.c	2005-09-16 20:02:12.000000000 -0500
+++ mod1-2.6/drivers/acpi/hotkey.c	2005-10-02 22:35:14.000000000 -0500
@@ -719,6 +719,8 @@ get_parms(char *config_record,
 		goto do_fail;
 	count = tmp1 - tmp;
 	*action_handle = (char *) kmalloc(count+1, GFP_KERNEL);
+	if (!*action_handle)
+		goto do_fail;
 	strncpy(*action_handle, tmp, count);
 	*(*action_handle + count) = 0;
 
diff -pruN 2.6/drivers/acpi/osl.c mod1-2.6/drivers/acpi/osl.c
--- 2.6/drivers/acpi/osl.c	2005-09-16 20:02:12.000000000 -0500
+++ mod1-2.6/drivers/acpi/osl.c	2005-10-02 22:47:49.000000000 -0500
@@ -755,6 +755,10 @@ acpi_os_create_lock (
 	ACPI_FUNCTION_TRACE ("os_create_lock");
 
 	lock_ptr = acpi_os_allocate(sizeof(spinlock_t));
+	if (!lock_ptr) {
+		ACPI_DEBUG_PRINT ((ACPI_DB_ERROR, "Failed to allocate spinlock.\n"));
+		return_ACPI_STATUS (AE_NO_MEMORY);
+	}
 
 	spin_lock_init(lock_ptr);
 

--===============86235856936620126==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============86235856936620126==--
