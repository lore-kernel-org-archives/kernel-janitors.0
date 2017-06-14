From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Jun 2017 10:58:53 +0000
Subject: [PATCH] drm/amdkfd: NULL dereference involving create_process()
Message-Id: <20170614105853.GP29394@elgon.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oded Gabbay <oded.gabbay-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexey Skidanov <Alexey.Skidanov-5C7GfCeVMHo@public.gmane.org>
Cc: David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig-5C7GfCeVMHo@public.gmane.org>

We accidentally return ERR_PTR(0) which is NULL.  The caller is not
expecting that and it leads to an Oops.

Fixes: dd59239a9862 ("amdkfd: init aperture once per process")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 84d1ffd1eef9..1190d06884ed 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -318,7 +318,8 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 
 	/* init process apertures*/
 	process->is_32bit_user_mode = in_compat_syscall();
-	if (kfd_init_apertures(process) != 0)
+	err = kfd_init_apertures(process);
+	if (err != 0)
 		goto err_init_apretures;
 
 	return process;
