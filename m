From: Gerd Hoffmann <kraxel@redhat.com>
Date: Wed, 21 Nov 2018 08:14:40 +0000
Subject: Re: [PATCH -next] drm/cirrus: Remove set but not used variable 'bo'
Message-Id: <20181121081440.nmrjsx24niopbimc@sirius.home.kraxel.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1542283836-152176-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1542283836-152176-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: Daniel Stone <daniels@collabora.com>, David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org, Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>, Thierry Reding <treding@nvidia.com>

On Thu, Nov 15, 2018 at 12:10:36PM +0000, YueHaibing wrote:
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/gpu/drm/cirrus/cirrus_fbdev.c: In function 'cirrusfb_create':
> drivers/gpu/drm/cirrus/cirrus_fbdev.c:172:20: warning:
>  variable 'bo' set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction in commit
> f9aa76a85248 ("drm/kms: driver for virtual cirrus under qemu")

queued for -next.

thanks,
  Gerd
