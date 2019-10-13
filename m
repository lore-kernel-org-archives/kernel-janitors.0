From: Heiko Stuebner <heiko@sntech.de>
Date: Sun, 13 Oct 2019 21:58:26 +0000
Subject: Re: [PATCH] drm/rockchip/rk3066: Use devm_platform_ioremap_resource() in rk3066_hdmi_bind()
Message-Id: <12988569.FbAFs2EWry@phil>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0666bc0b-6624-21a0-47c4-b78e2a3b3ad5@web.de>
In-Reply-To: <0666bc0b-6624-21a0-47c4-b78e2a3b3ad5@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>, linux-rockchip@lists.infradead.org, Johan Jonker <jbx6244@gmail.com>, linux-arm-kernel@lists.infradead.org, Zheng Yang <zhengyang@rock-chips.com>

Am Samstag, 21. September 2019, 20:40:16 CEST schrieb Markus Elfring:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 21 Sep 2019 20:32:25 +0200
> 
> Simplify this function implementation by using a known wrapper function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

applied to drm-misc-next

Thanks
Heiko
