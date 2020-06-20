From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 20 Jun 2020 16:14:44 +0000
Subject: Re: [v2] drm/amdkfd: Fix memory leaks according to error branches
Message-Id: <24b55845-6aac-fa4c-c65f-e479de1bbd6f@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0e76e678-94b1-8f69-d52c-2b67608d5ef8@web.de>
 <alpine.DEB.2.22.394.2006201126130.2918@hadrien>
In-Reply-To: <alpine.DEB.2.22.394.2006201126130.2918@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@inria.fr>, Bernard Zhao <bernard@vivo.com>, opensource.kernel@vivo.com, amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>, =?UTF-8?Q?Felix_K=c3=bchling?= <Felix.Kuehling@amd.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>

> memleak is also not an English word.  Memory leak is only a few more
> characters, and doesn't require the reader to make the small extra effort
> to figure out what you mean.

Would you like to achieve similar adjustments at any more places?

How do you think about effects from a corresponding jargon?
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/msm/msm_submitqueue.c?id7d3819633cd520e3f95df541a04644aab4c657

Regards,
Markus
