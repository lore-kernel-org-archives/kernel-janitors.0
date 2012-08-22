From: Mauro Carvalho Chehab <mchehab@redhat.com>
Date: Wed, 22 Aug 2012 16:57:49 +0000
Subject: Re: [samsung:v4l-exynos-gsc 89/99] ERROR: "soc_camera_power_off" [drivers/media/i2c/soc_camera/tw991
Message-Id: <50350F8D.7030609@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Em 22-08-2012 13:43, Fengguang Wu escreveu:
> Hi Mauro,
> 
> FYI, kernel build failed on
> 
> tree:   git://git.infradead.org/users/kmpark/linux-samsung v4l-exynos-gsc
> head:   231560807f44daf9d1c2913e749c8a8609fc3c66
> commit: fccea74ff8b5159935acc7b4b4857ee81ee44661 [89/99] [media] Kconfig: merge all customise options into just one
> config: x86_64-allmodconfig (attached as .config)
> 
> Build errors:
> 
> ERROR: "soc_camera_power_off" [drivers/media/i2c/soc_camera/tw9910.ko] undefined!
> ERROR: "soc_camera_power_on" [drivers/media/i2c/soc_camera/tw9910.ko] undefined!
> ERROR: "soc_camera_apply_board_flags" [drivers/media/i2c/soc_camera/tw9910.ko] undefined!

This one got fixed by this patch:
	http://git.linuxtv.org/media_tree.git/commit/a47b6118e134b51562de520d644d3979b3d99e44

Regards,
Mauro
