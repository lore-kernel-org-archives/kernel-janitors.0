From: Bojan Prtvar <prtvar.b@gmail.com>
Date: Sat, 07 Sep 2013 15:06:55 +0000
Subject: [PATCH] ACPI/ACPCICA: Remove references to non existing acpi_os_free()
Message-Id: <1378566415-15857-1-git-send-email-prtvar.b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

In commit 02438d8771ae6a4b215938959827692026380bf9 acpi_os_free()
was deleted and we switched to using kfree() directly instead.

Signed-off-by: Bojan Prtvar <prtvar.b@gmail.com>
---
This is janitorial work, please review carefully.

 drivers/acpi/acpica/acmacros.h |    2 +-
 drivers/acpi/acpica/utcache.c  |    2 +-
 drivers/acpi/acpica/uttrack.c  |    6 +++---
 include/acpi/acpiosxf.h        |    2 --
 4 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/acpi/acpica/acmacros.h b/drivers/acpi/acpica/acmacros.h
index 530a2f8..3670dd9 100644
--- a/drivers/acpi/acpica/acmacros.h
+++ b/drivers/acpi/acpica/acmacros.h
@@ -425,7 +425,7 @@
 #define ACPI_ALLOCATE_ZEROED(a)     acpi_ut_allocate_zeroed((acpi_size) (a), ACPI_MEM_PARAMETERS)
 #endif
 #ifndef ACPI_FREE
-#define ACPI_FREE(a)                acpi_os_free(a)
+#define ACPI_FREE(a)                kfree(a)
 #endif
 #define ACPI_MEM_TRACKING(a)
 
diff --git a/drivers/acpi/acpica/utcache.c b/drivers/acpi/acpica/utcache.c
index a877a96..fcc570c 100644
--- a/drivers/acpi/acpica/utcache.c
+++ b/drivers/acpi/acpica/utcache.c
@@ -166,7 +166,7 @@ acpi_status acpi_os_delete_cache(struct acpi_memory_list * cache)
 
 	/* Now we can delete the cache object */
 
-	acpi_os_free(cache);
+	kfree(cache);
 	return (AE_OK);
 }
 
diff --git a/drivers/acpi/acpica/uttrack.c b/drivers/acpi/acpica/uttrack.c
index 160f13f..ac815e5 100644
--- a/drivers/acpi/acpica/uttrack.c
+++ b/drivers/acpi/acpica/uttrack.c
@@ -141,7 +141,7 @@ void *acpi_ut_allocate_and_track(acpi_size size,
 					  ACPI_MEM_MALLOC, component, module,
 					  line);
 	if (ACPI_FAILURE(status)) {
-		acpi_os_free(allocation);
+		kfree(allocation);
 		return (NULL);
 	}
 
@@ -195,7 +195,7 @@ void *acpi_ut_allocate_zeroed_and_track(acpi_size size,
 					  ACPI_MEM_CALLOC, component, module,
 					  line);
 	if (ACPI_FAILURE(status)) {
-		acpi_os_free(allocation);
+		kfree(allocation);
 		return (NULL);
 	}
 
@@ -254,7 +254,7 @@ acpi_ut_free_and_track(void *allocation,
 		ACPI_EXCEPTION((AE_INFO, status, "Could not free memory"));
 	}
 
-	acpi_os_free(debug_block);
+	kfree(debug_block);
 	ACPI_DEBUG_PRINT((ACPI_DB_ALLOCATIONS, "%p freed\n", allocation));
 	return_VOID;
 }
diff --git a/include/acpi/acpiosxf.h b/include/acpi/acpiosxf.h
index 64b8c76..0f730ca 100644
--- a/include/acpi/acpiosxf.h
+++ b/include/acpi/acpiosxf.h
@@ -146,8 +146,6 @@ void acpi_os_release_mutex(acpi_mutex handle);
  */
 void *acpi_os_allocate(acpi_size size);
 
-void acpi_os_free(void *memory);
-
 void __iomem *acpi_os_map_memory(acpi_physical_address where,
 				acpi_size length);
 
-- 
1.7.1

