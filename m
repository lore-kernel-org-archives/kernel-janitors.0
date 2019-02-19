From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 19 Feb 2019 15:08:51 +0000
Subject: Re: [PATCH][next] drm/i915/selftests: fix memory leak of 'spin'
Message-Id: <155058893121.30979.13044488959474735904@skylake-alporthouse-com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190219150129.12728-1-colin.king@canonical.com>
In-Reply-To: <20190219150129.12728-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Quoting Colin King (2019-02-19 15:01:29)
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a memory leak of 'spin' on an error return path. Fix this by
> kfree'ing spin before the return.
> 
> Fixes: c06ee6ff2cbc ("drm/i915/selftests: Context SSEU reconfiguration tests")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

I hope already fixed by

commit 2a4a2754039594c60b58b02b6781428a85f6d745
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Fri Feb 15 19:50:10 2019 +0000

    drm/i915/selftests: Always free spinner on __sseu_prepare error

Thanks,
-Chris
