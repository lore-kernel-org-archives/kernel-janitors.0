From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 04 Jan 2016 20:43:47 +0000
Subject: [patch] drm/amdgpu/cgs: cleanup some indenting
Message-Id: <20160104204347.GC19867@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Eric Huang <JinHuiEric.Huang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>

This code is indented too far.  Also we normally use spaces to align if
statement conditions.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
index 6fa0fea..59485d0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cgs.c
@@ -843,15 +843,15 @@ static int amdgpu_cgs_acpi_eval_object(void *cgs_device,
 	if (info->input_count > 0) {
 		if (info->pinput_argument = NULL)
 			return -EINVAL;
-			argument = info->pinput_argument;
-			func_no = argument->value;
-			for (i = 0; i < info->input_count; i++) {
-				if (((argument->type = ACPI_TYPE_STRING) ||
-					(argument->type = ACPI_TYPE_BUFFER))
-					&& (argument->pointer = NULL))
-					return -EINVAL;
-				argument++;
-			}
+		argument = info->pinput_argument;
+		func_no = argument->value;
+		for (i = 0; i < info->input_count; i++) {
+			if (((argument->type = ACPI_TYPE_STRING) ||
+			     (argument->type = ACPI_TYPE_BUFFER)) &&
+			    (argument->pointer = NULL))
+				return -EINVAL;
+			argument++;
+		}
 	}
 
 	if (info->output_count > 0) {
