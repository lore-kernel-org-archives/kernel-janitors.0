From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 04 Sep 2019 17:11:33 +0000
Subject: Re: drm/amdgpu: Delete an unnecessary check before two function calls
Message-Id: <ef57fbc1-8c67-c6ae-42b8-0de76df7cea3@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a3739125-5fa8-cadb-d2b8-8a9f12e9bacd@web.de>
In-Reply-To: <a3739125-5fa8-cadb-d2b8-8a9f12e9bacd@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, Chunming Zhou <David1.Zhou@amd.com>, Dan Carpenter <dan.carpenter@oracle.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Hawking Zhang <Hawking.Zhang@amd.com>, Jack Xiao <Jack.Xiao@amd.com>, Kevin Wang <Kevin1.Wang@amd.com>, Tom St Denis <tom.stdenis@amd.com>, Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> The functions “debugfs_remove” and “kfree” test whether their argument
> is NULL and then return immediately.
> Thus the tests around the shown calls are not needed.
>
> This issue was detected by using the Coccinelle software.

I suggest to take another look at a similar patch.

drm/amdgpu: remove the redundant null check
https://lkml.org/lkml/2019/9/3/59
https://lore.kernel.org/patchwork/patch/1123118/
https://lore.kernel.org/r/1567491305-18320-1-git-send-email-zhongjiang@huawei.com/

Regards,
Markus
