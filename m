From: joeyli <jlee@suse.com>
Date: Mon, 17 Sep 2012 03:34:31 +0000
Subject: Re: drivers/platform/x86/acer-wmi.c: ERROR: obj is NULL but dereferenced
Message-Id: <1347852871.15400.11.camel@linux-s257.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120917004114.GC12394@localhost>
In-Reply-To: <20120917004114.GC12394@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: kernel-janitors@vger.kernel.org

Hi Fengguang, 

於 一，2012-09-17 於 08:41 +0800，Fengguang Wu 提到：
> Hi Chun-Yi,
> 
> coccinelle warns about:
> 
>   drivers/platform/x86/acer-wmi.c:1200:17-21: ERROR: obj is NULL but dereferenced.
>   drivers/platform/x86/acer-wmi.c:891:17-21: ERROR: obj is NULL but dereferenced.
>   drivers/platform/x86/acer-wmi.c:1953:17-21: ERROR: obj is NULL but dereferenced.
> 
> Which are first introduced by commit
> 
> commit 987dfbaa65b2c3568b85e29d2598da08a011ee09
> Author:     Lee, Chun-Yi <joeyli.kernel@gmail.com>
> AuthorDate: Fri May 27 14:52:14 2011 +0800
> Commit:     Matthew Garrett <mjg@redhat.com>
> CommitDate: Fri May 27 12:40:10 2011 -0400
> 
>     acer-wmi: support integer return type from WMI methods
> 
> Thanks,
> Fengguang
> 

Thanks a lot for you catch this problem!
This patch can fix it.


Thanks a lot!
Joey Lee


From 89fca446093ee172f029be75341852da8afa3f1c Mon Sep 17 00:00:00 2001
From: Lee, Chun-Yi <jlee@suse.com>
Date: Mon, 17 Sep 2012 11:13:24 +0800
Subject: [PATCH] acer-wmi: fix obj is NULL but dereferenced

Fengguang Wu run coccinelle and warns about:
  drivers/platform/x86/acer-wmi.c:1200:17-21: ERROR: obj is NULL but dereferenced.
  drivers/platform/x86/acer-wmi.c:891:17-21: ERROR: obj is NULL but dereferenced.
  drivers/platform/x86/acer-wmi.c:1953:17-21: ERROR: obj is NULL but dereferenced.

It causes by the code in patch 987dfbaa65b2c3568b85e29d2598da08a011ee09 doesn't check
obj variable should not be NULL. There have risk for dereference a NULL obj, so add
this patch to fix.

Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
---
 drivers/platform/x86/acer-wmi.c |   46 +++++++++++++++++++++-----------------
 1 files changed, 25 insertions(+), 21 deletions(-)

diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index 00d8c39..5ff493e 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -884,7 +884,7 @@ WMI_execute_u32(u32 method_id, u32 in, u32 *out)
 	struct acpi_buffer input = { (acpi_size) sizeof(u32), (void *)(&in) };
 	struct acpi_buffer result = { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *obj;
-	u32 tmp;
+	u32 tmp = 0;
 	acpi_status status;
 
 	status = wmi_evaluate_method(WMID_GUID1, 1, method_id, &input, &result);
@@ -893,14 +893,14 @@ WMI_execute_u32(u32 method_id, u32 in, u32 *out)
 		return status;
 
 	obj = (union acpi_object *) result.pointer;
-	if (obj && obj->type = ACPI_TYPE_BUFFER &&
-		(obj->buffer.length = sizeof(u32) ||
-		obj->buffer.length = sizeof(u64))) {
-		tmp = *((u32 *) obj->buffer.pointer);
-	} else if (obj->type = ACPI_TYPE_INTEGER) {
-		tmp = (u32) obj->integer.value;
-	} else {
-		tmp = 0;
+	if (obj) {
+		if (obj->type = ACPI_TYPE_BUFFER &&
+			(obj->buffer.length = sizeof(u32) ||
+			obj->buffer.length = sizeof(u64))) {
+			tmp = *((u32 *) obj->buffer.pointer);
+		} else if (obj->type = ACPI_TYPE_INTEGER) {
+			tmp = (u32) obj->integer.value;
+		}
 	}
 
 	if (out)
@@ -1202,12 +1202,14 @@ static acpi_status WMID_set_capabilities(void)
 		return status;
 
 	obj = (union acpi_object *) out.pointer;
-	if (obj && obj->type = ACPI_TYPE_BUFFER &&
-		(obj->buffer.length = sizeof(u32) ||
-		obj->buffer.length = sizeof(u64))) {
-		devices = *((u32 *) obj->buffer.pointer);
-	} else if (obj->type = ACPI_TYPE_INTEGER) {
-		devices = (u32) obj->integer.value;
+	if (obj) {
+		if (obj->type = ACPI_TYPE_BUFFER &&
+			(obj->buffer.length = sizeof(u32) ||
+			obj->buffer.length = sizeof(u64))) {
+			devices = *((u32 *) obj->buffer.pointer);
+		} else if (obj->type = ACPI_TYPE_INTEGER) {
+			devices = (u32) obj->integer.value;
+		}
 	} else {
 		kfree(out.pointer);
 		return AE_ERROR;
@@ -1955,12 +1957,14 @@ static u32 get_wmid_devices(void)
 		return 0;
 
 	obj = (union acpi_object *) out.pointer;
-	if (obj && obj->type = ACPI_TYPE_BUFFER &&
-		(obj->buffer.length = sizeof(u32) ||
-		obj->buffer.length = sizeof(u64))) {
-		devices = *((u32 *) obj->buffer.pointer);
-	} else if (obj->type = ACPI_TYPE_INTEGER) {
-		devices = (u32) obj->integer.value;
+	if (obj) {
+		if (obj->type = ACPI_TYPE_BUFFER &&
+			(obj->buffer.length = sizeof(u32) ||
+			obj->buffer.length = sizeof(u64))) {
+			devices = *((u32 *) obj->buffer.pointer);
+		} else if (obj->type = ACPI_TYPE_INTEGER) {
+			devices = (u32) obj->integer.value;
+		}
 	}
 
 	kfree(out.pointer);
-- 
1.6.0.2



