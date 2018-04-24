From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 24 Apr 2018 13:35:49 +0000
Subject: [PATCH] drm/amdkfd: Integer overflows in ioctl
Message-Id: <20180424133549.GB10167@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oded Gabbay <oded.gabbay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felix Kuehling <Felix.Kuehling-5C7GfCeVMHo@public.gmane.org>
Cc: "David (ChunMing) Zhou" <David1.Zhou-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

args->n_devices is a u32 that comes from the user.  The multiplication
could overflow on 32 bit systems possibly leading to privilege
escalation.

Fixes: 5ec7e02854b3 ("drm/amdkfd: Add ioctls for GPUVM memory management")
Signed-off-by: Dan Carpenter dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index cd679cf1fd30..ce36e556da38 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1295,8 +1295,8 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 		return -EINVAL;
 	}
 
-	devices_arr = kmalloc(args->n_devices * sizeof(*devices_arr),
-			      GFP_KERNEL);
+	devices_arr = kmalloc_array(args->n_devices, sizeof(*devices_arr),
+				    GFP_KERNEL);
 	if (!devices_arr)
 		return -ENOMEM;
 
@@ -1404,8 +1404,8 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 		return -EINVAL;
 	}
 
-	devices_arr = kmalloc(args->n_devices * sizeof(*devices_arr),
-			      GFP_KERNEL);
+	devices_arr = kmalloc_array(args->n_devices, sizeof(*devices_arr),
+				    GFP_KERNEL);
 	if (!devices_arr)
 		return -ENOMEM;
 
