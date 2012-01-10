From: Martin Peres <martin.peres@ensi-bourges.fr>
Date: Tue, 10 Jan 2012 08:05:10 +0000
Subject: Re: [patch] drm/nv50/pm: signedness bug in nv50_pm_clocks_pre()
Message-Id: <4F0BF136.9070406@ensi-bourges.fr>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------010709090008070107000009"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120104072047.GE30978@elgon.mountain>
	<4F0B780D.1080804@ensi-bourges.fr> <20120110053918.GB16258@mwanda>
In-Reply-To: <20120110053918.GB16258@mwanda>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, Emil Velikov <emil.l.velikov@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org

This is a multi-part message in MIME format.
--------------010709090008070107000009
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Le 10/01/2012 06:39, Dan Carpenter a =E9crit :
> On Tue, Jan 10, 2012 at 12:28:13AM +0100, Martin Peres wrote:
>> Le 04/01/2012 08:20, Dan Carpenter a =E9crit :
>>> calc_mclk() returns zero on success and negative on failure but clk is
>>> a u32.
>>>
>>> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>
>>>
>>> diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouvea=
u/nv50_pm.c
>>> index 0393721..3508de9 100644
>>> --- a/drivers/gpu/drm/nouveau/nv50_pm.c
>>> +++ b/drivers/gpu/drm/nouveau/nv50_pm.c
>>> @@ -540,7 +540,7 @@ nv50_pm_clocks_pre(struct drm_device *dev, struct n=
ouveau_pm_level *perflvl)
>>>   	info->mclk_hwsq.len =3D 0;
>>>   	if (perflvl->memory) {
>>>   		clk =3D calc_mclk(dev, perflvl->memory,&info->mclk_hwsq);
>>> -		if (clk<   0) {
>>> +		if ((int)clk<   0) {
>>>   			ret =3D clk;
>>>   			goto error;
>>>   		}
>> Well spotted Dan!
>>
>> Sorry for the late answer, was busy reworking this file for safe reclock=
ing.
>>
>> I have a slightly different fix for that. Please tell me if It suits
>> you: https://gitorious.org/linux-nouveau-pm/linux-nouveau-pm/commit/c1b8=
0360ezd1aa7dd780ac383aae9437c66ef3b89
> That link redirects to
> https://gitorious.org/linux-nouveau-pm/linux-nouveau-pm/commits/master
> and it doesn't show the patch.
>
> But I wasn't a huge fan of adding the cast very much either so I'm
> sure your patch is good.
>
> regards,
> dan carpenter
Sorry, here is the patch attached.

--------------010709090008070107000009
Content-Type: text/x-patch;
 name="0005-drm-nv50-pm-signedness-bug-in-nv50_pm_clocks_pre.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0005-drm-nv50-pm-signedness-bug-in-nv50_pm_clocks_pre.patch"

From c1b80360ed1aa7dd780ac383aae9437c66ef3b89 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 4 Jan 2012 10:20:47 +0300
Subject: [PATCH 5/7] drm/nv50/pm: signedness bug in nv50_pm_clocks_pre()

calc_mclk() returns zero on success and negative on failure but clk is
a u32.

v2: Martin Peres:
- clk should be an int, not a u32

Signed-off-by: Martin Peres <martin.peres@labri.fr>
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/nouveau/nv50_pm.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nv50_pm.c b/drivers/gpu/drm/nouveau/nv50_pm.c
index 983b432..4be2e20 100644
--- a/drivers/gpu/drm/nouveau/nv50_pm.c
+++ b/drivers/gpu/drm/nouveau/nv50_pm.c
@@ -659,11 +659,11 @@ nv50_pm_clocks_pre(struct drm_device *dev, struct nouveau_pm_level *perflvl)
 	struct nv50_pm_state *info;
 	struct hwsq_ucode *hwsq;
 	struct pll_lims pll;
-	int ret = -EINVAL;
+	int clk, ret = -EINVAL;
 	int N, M, P1, P2;
 	u32 mast = nv_rd32(dev, 0x00c040);
 	u32 divs = read_div(dev);
-	u32 ctrl, clk, out;
+	u32 ctrl, out;
 
 	if (dev_priv->chipset == 0xaa ||
 	    dev_priv->chipset == 0xac)
-- 
1.7.8.1


--------------010709090008070107000009--
