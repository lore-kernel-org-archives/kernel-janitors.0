From: Martin Peres <martin.peres@labri.fr>
Date: Thu, 27 Sep 2012 13:12:42 +0000
Subject: Re: ERROR: "__divdf3" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
Message-Id: <506450CA.8060707@labri.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------050609000306060609090107"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120927115903.GA17017@localhost>
In-Reply-To: <20120927115903.GA17017@localhost>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------050609000306060609090107
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 27/09/2012 13:59, Fengguang Wu wrote:
> Hi Martin,
>
> FYI, kernel build failed on
>
> 6310a32252e4160ce5492ad9b98c9f2778fec43b drm/nouveau/therm: calculate the pwm divisor on nv50+
> powerpc-allmodconfig
>
> All error/warnings:
>
> ERROR: "__divdf3" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
> ERROR: ".__floatsidf" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
> ERROR: "__fixdfsi" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
> ERROR: ".__divdf3" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
> ERROR: "__floatsidf" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
> ERROR: ".__fixdfsi" [drivers/gpu/drm/nouveau/nouveau.ko] undefined!
>
> ---
> 0-DAY kernel build testing backend         Open Source Technology Centre
> Fengguang Wu, Yuanhan Liu                              Intel Corporation
Hi,

Thank you for reporting this issue (and for having such a nice tool). I 
wonder how I could miss that!

Here is a patch for this that should fix the issue. It may be squashed 
into the offending commit or added as is to the tree.

Cheers,
Martin


--------------050609000306060609090107
Content-Type: text/x-patch;
 name="0001-drm-nouveau-therm-fix-an-unintentional-use-of-floati.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-drm-nouveau-therm-fix-an-unintentional-use-of-floati.pa";
 filename*1="tch"

From 9f574fc3872b35aaa4684fa492b9a47fc8f4653f Mon Sep 17 00:00:00 2001
From: Martin Peres <martin.peres@labri.fr>
Date: Thu, 27 Sep 2012 14:34:48 +0200
Subject: [PATCH] drm/nouveau/therm: fix an unintentional use of floating
 point

Signed-off-by: Martin Peres <martin.peres@labri.fr>
---
 drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c
index 6f97de2..9360ddd 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c
@@ -92,7 +92,7 @@ nv50_fan_pwm_clock(struct nouveau_therm *therm)
 		if (nv_rd32(therm, 0xc040) & 0x800000) {
 			/* Use the HOST clock (100 MHz)
 			* Where does this constant(2.4) comes from? */
-			pwm_clock = (100000000 >> pwm_div) / 2.4;
+			pwm_clock = (100000000 >> pwm_div) * 10 / 24;
 		} else {
 			/* Where does this constant(20) comes from? */
 			pwm_clock = (crystal * 1000) >> pwm_div;
-- 
1.7.11.5


--------------050609000306060609090107--
