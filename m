From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 14:50:24 +0000
Subject: [PATCH 3/8] drm/amdgpu: One function call less in amdgpu_cgs_acpi_eval_object() after error detectio
Message-Id: <f353fcc4-a4c8-36c0-8865-70096b6454a1@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5307CAA2.8060406@users.sourceforge.net>
 <alpine.DEB.2.02.1402212321410.2043@localhost6.localdomain6>
 <530A086E.8010901@users.sourceforge.net>
 <alpine.DEB.2.02.1402231635510.1985@localhost6.localdomain6>
 <530A72AA.3000601@users.sourceforge.net>
 <alpine.DEB.2.02.1402240658210.2090@localhost6.localdomain6>
 <530B5FB6.6010207@users.sourceforge.net>
 <alpine.DEB.2.10.1402241710370.2074@hadrien>
 <530C5E18.1020800@users.sourceforge.net>
 <alpine.DEB.2.10.1402251014170.2080@hadrien>
 <530CD2C4.4050903@users.sourceforge.net>
 <alpine.DEB.2.10.1402251840450.7035@hadrien>
 <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net> <558FB427.80103@users.sourceforge.net>
 <d46343aa-7641-2e77-a4dc-634c527c182b@users.sourceforge.net>
In-Reply-To: <d46343aa-7641-2e77-a4dc-634c527c182b@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 16 Jul 2016 13:43:44 +0200

The kfree() function was called in one case by the
amdgpu_cgs_acpi_eval_object() function during error handling
even if the passed variable "obj" contained a null pointer.

* Adjust jump targets according to the Linux coding style convention.

* Delete unnecessary initialisations for the variables "obj"
  and "params" then.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
index 6f11bc1..705bfa2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
@@ -903,8 +903,7 @@ static int amdgpu_cgs_acpi_eval_object(struct cgs_device *cgs_device,
 	acpi_handle handle;
 	struct acpi_object_list input;
 	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
-	union acpi_object *params = NULL;
-	union acpi_object *obj = NULL;
+	union acpi_object *params, *obj;
 	uint8_t name[5] = {'\0'};
 	struct cgs_acpi_method_argument *argument = NULL;
 	uint32_t i, count;
@@ -996,7 +995,7 @@ static int amdgpu_cgs_acpi_eval_object(struct cgs_device *cgs_device,
 
 	if (ACPI_FAILURE(status)) {
 		result = -EIO;
-		goto error;
+		goto free_input;
 	}
 
 	/* return the output info */
@@ -1006,7 +1005,7 @@ static int amdgpu_cgs_acpi_eval_object(struct cgs_device *cgs_device,
 		if ((obj->type != ACPI_TYPE_PACKAGE) ||
 			(obj->package.count != count)) {
 			result = -EIO;
-			goto error;
+			goto free_obj;
 		}
 		params = obj->package.elements;
 	} else
@@ -1014,13 +1013,13 @@ static int amdgpu_cgs_acpi_eval_object(struct cgs_device *cgs_device,
 
 	if (params = NULL) {
 		result = -EIO;
-		goto error;
+		goto free_obj;
 	}
 
 	for (i = 0; i < count; i++) {
 		if (argument->type != params->type) {
 			result = -EIO;
-			goto error;
+			goto free_obj;
 		}
 		switch (params->type) {
 		case ACPI_TYPE_INTEGER:
@@ -1030,7 +1029,7 @@ static int amdgpu_cgs_acpi_eval_object(struct cgs_device *cgs_device,
 			if ((params->string.length != argument->data_length) ||
 				(params->string.pointer = NULL)) {
 				result = -EIO;
-				goto error;
+				goto free_obj;
 			}
 			strncpy(argument->pointer,
 				params->string.pointer,
@@ -1039,7 +1038,7 @@ static int amdgpu_cgs_acpi_eval_object(struct cgs_device *cgs_device,
 		case ACPI_TYPE_BUFFER:
 			if (params->buffer.pointer = NULL) {
 				result = -EIO;
-				goto error;
+				goto free_obj;
 			}
 			memcpy(argument->pointer,
 				params->buffer.pointer,
@@ -1052,8 +1051,9 @@ static int amdgpu_cgs_acpi_eval_object(struct cgs_device *cgs_device,
 		params++;
 	}
 
-error:
+free_obj:
 	kfree(obj);
+free_input:
 	kfree((void *)input.pointer);
 	return result;
 }
-- 
2.9.1

