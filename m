From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sat, 30 Sep 2017 08:14:13 +0000
Subject: [PATCH 2/2] drm/amdgpu: Potential uninitialized variable in amdgpu_vm_update_directories()
Message-Id: <20170930081413.t6ohq5vrj7pmpthz@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170930081328.kher7yumqzi2vsrg@mwanda>
In-Reply-To: <20170930081328.kher7yumqzi2vsrg@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc: kernel-janitors@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>, Harish Kasiviswanathan <Harish.Kasiviswanathan@amd.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, "Zhang,
 Jerry" <Jerry.Zhang@amd.com>

After commit ea09729c9302 ("drm/amdgpu: rework page directory filling
v2") then it becomes a lot harder to verify that "r" is initialized.  My
static checker complains and so I've reviewed the code.  It does look
like it might be buggy... Anyway, it doesn't hurt to set "r" to zero
at the start.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index bbcc67038203..fb3afab55907 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -1243,7 +1243,7 @@ static void amdgpu_vm_invalidate_level(struct amdgpu_vm *vm,
 int amdgpu_vm_update_directories(struct amdgpu_device *adev,
 				 struct amdgpu_vm *vm)
 {
-	int r;
+	int r = 0;
 
 	spin_lock(&vm->status_lock);
 	while (!list_empty(&vm->relocated)) {
