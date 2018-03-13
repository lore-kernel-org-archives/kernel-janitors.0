From: Neil Armstrong <narmstrong@baylibre.com>
Date: Tue, 13 Mar 2018 09:40:26 +0000
Subject: Re: [PATCH 0/3] Fix some error handling paths in 'meson_drv_bind_master()'
Message-Id: <d0bc2518-ec6d-d919-f358-579211c50d9a@baylibre.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <cover.1520885192.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <cover.1520885192.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, airlied@linux.ie, carlo@caione.org, khilman@baylibre.com
Cc: linux-amlogic@lists.infradead.org, kernel-janitors@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org

On 12/03/2018 21:15, Christophe JAILLET wrote:
> Patch 1 and 3 are fixes.
> Patch 2 is just a kind of clean-up noticed while patching this driver.
> 
> If patch 2 is considered as useless, patch 3 can be applied on top of 
> patch 1, it does nor depend on the 2nd patch.
> 
> Christophe JAILLET (3):
>   drm/meson: Fix an un-handled error path in 'meson_drv_bind_master()'
>   drm/meson: Use drm_dev_put() instead of drm_dev_unref()
>   drm/meson: Fix some error handling paths in 'meson_drv_bind_master()'
> 
>  drivers/gpu/drm/meson/meson_drv.c | 33 ++++++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 11 deletions(-)
> 

Hi,

Thanks for the fixes, since they are not critical, I pushed them on drm-misc-next, they will be backported onto stable tree by the stable team later on using the Fixes tag.

Neil
