From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 17:52:35 +0000
Subject: [nouveau:master 82/96] drivers/gpu/drm/nouveau/core/subdev/bios/therm.c:59:1: sparse: symbol
Message-Id: <20120927175235.GC5517@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="ikeVEW9yuYc//A+q"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

FYI, there are new sparse warnings show up in

tree:   git://git.freedesktop.org/git/nouveau/linux-2.6 master
head:   301e77f5b7968ff10eac8f3938c30963d8fc0ac3
commit: 1efe51f9b6c36f21c18b83219e70ab7bb822d3ff [82/96] drm/nouveau/therm: rework thermal table parsing

+ drivers/gpu/drm/nouveau/core/subdev/bios/therm.c:59:1: sparse: symbol 'nvbios_therm_entry' was not declared. Should it be static?

vim +59 drivers/gpu/drm/nouveau/core/subdev/bios/therm.c

1efe51f9 (Martin Peres 2012-08-16  58) u16
1efe51f9 (Martin Peres 2012-08-16 @59) nvbios_therm_entry(struct nouveau_bios *bios, int idx, u8 *ver, u8 *len)
1efe51f9 (Martin Peres 2012-08-16  60) {
1efe51f9 (Martin Peres 2012-08-16  61) 	u8 hdr, cnt;
1efe51f9 (Martin Peres 2012-08-16  62) 	u16 therm = therm_table(bios, ver, &hdr, len, &cnt);
1efe51f9 (Martin Peres 2012-08-16  63) 	if (therm && idx < cnt)
1efe51f9 (Martin Peres 2012-08-16  64) 		return therm + idx * *len;
1efe51f9 (Martin Peres 2012-08-16  65) 	return 0x0000;
1efe51f9 (Martin Peres 2012-08-16  66) }
1efe51f9 (Martin Peres 2012-08-16  67) 

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

--ikeVEW9yuYc//A+q
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-1efe51f.diff"

diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/therm.c b/drivers/gpu/drm/nouveau/core/subdev/bios/therm.c
index 862a08a..338ba50 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bios/therm.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bios/therm.c
@@ -55,7 +55,7 @@ therm_table(struct nouveau_bios *bios, u8 *ver, u8 *hdr, u8 *len, u8 *cnt)
 	return therm + nv_ro08(bios, therm + 1);
 }
 
-u16
+static u16
 nvbios_therm_entry(struct nouveau_bios *bios, int idx, u8 *ver, u8 *len)
 {
 	u8 hdr, cnt;

--ikeVEW9yuYc//A+q--
