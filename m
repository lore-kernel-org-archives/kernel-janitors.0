From: Markus Elfring <Markus.Elfring@web.de>
Date: Tue, 16 Jun 2020 11:23:15 +0000
Subject: Re: [PATCH 1/2] drm/amdgpu/debugfs: fix memory leak when pm_runtime_get_sync failed
Message-Id: <ae59e47a-f981-9ae6-840d-1912c01b53cd@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Chen Tao <chentao107@huawei.com>, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Tom St Denis <tom.stdenis@amd.com>, Chunming Zhou <David1.Zhou@amd.com>, Jack Xiao <Jack.Xiao@amd.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Kangjie Lu <kjlu@umn.edu>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Navid Emamdoost <emamd001@umn.edu>, Qiushi Wu <wu000273@umn.edu>, Aditya Pakki <pakki001@umn.edu>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Yintian Tao <yttao@amd.com>

> Fix memory leak in amdgpu_debugfs_gpr_read not freeing data when
> pm_runtime_get_sync failed.

* Would you like to improve the exception handling any more for this software module?

* How do you think about calling the function “pm_runtime_put_noidle”?

Regards,
Markus
