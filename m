From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 25 Sep 2015 11:36:55 +0000
Subject: [patch] drm/amdgpu: signedness bug in amdgpu_cs_parser_init()
Message-Id: <20150925113655.GA12962@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <A3397C8B8B789E45844E7EC5DEAD89D06E91395A@satlexdag05.amd.com>
In-Reply-To: <A3397C8B8B789E45844E7EC5DEAD89D06E91395A@satlexdag05.amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Airlie <airlied@linux.ie>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Chunming Zhou <david1.zhou@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Jammy Zhou <Jammy.Zhou@amd.com>, "monk.liu" <monk.liu@amd.com>, Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, security@kernel.org, Ilja Van Sprundel <ivansprundel@ioactive.com>

The "i" variable should be signed or it leads to a crash in the error
handling code.

Fixes: 1d263474c441 ('drm/amdgpu: unwind properly in amdgpu_cs_parser_init()')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index 749420f..cb3c274 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -156,7 +156,8 @@ int amdgpu_cs_parser_init(struct amdgpu_cs_parser *p, void *data)
 	uint64_t *chunk_array_user;
 	uint64_t *chunk_array;
 	struct amdgpu_fpriv *fpriv = p->filp->driver_priv;
-	unsigned size, i;
+	unsigned size;
+	int i;
 	int ret;
 
 	if (cs->in.num_chunks = 0)
