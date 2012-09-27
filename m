From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 17:52:50 +0000
Subject: [nouveau:master 83/96] drivers/gpu/drm/nouveau/core/subdev/bios/extdev.c:52:1: sparse: symbol
Message-Id: <20120927175250.GD5517@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="3lcZGd9BuhuYXNfi"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--3lcZGd9BuhuYXNfi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

FYI, there are new sparse warnings show up in

tree:   git://git.freedesktop.org/git/nouveau/linux-2.6 master
head:   301e77f5b7968ff10eac8f3938c30963d8fc0ac3
commit: aab823cdcf4f3f377ee7a49456ea62451c7cecee [83/96] drm/nouveau/therm: use the EXTDEV table to detect i2c monitoring devices

+ drivers/gpu/drm/nouveau/core/subdev/bios/extdev.c:52:1: sparse: symbol 'nvbios_extdev_entry' was not declared. Should it be static?

vim +52 drivers/gpu/drm/nouveau/core/subdev/bios/extdev.c

aab823cd (Martin Peres 2012-08-18  51) u16
aab823cd (Martin Peres 2012-08-18 @52) nvbios_extdev_entry(struct nouveau_bios *bios, int idx, u8 *ver, u8 *len)
aab823cd (Martin Peres 2012-08-18  53) {
aab823cd (Martin Peres 2012-08-18  54) 	u8 hdr, cnt;
aab823cd (Martin Peres 2012-08-18  55) 	u16 extdev = extdev_table(bios, ver, &hdr, len, &cnt);
aab823cd (Martin Peres 2012-08-18  56) 	if (extdev && idx < cnt)
aab823cd (Martin Peres 2012-08-18  57) 		return extdev + idx * *len;
aab823cd (Martin Peres 2012-08-18  58) 	return 0x0000;
aab823cd (Martin Peres 2012-08-18  59) }
aab823cd (Martin Peres 2012-08-18  60) 

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

--3lcZGd9BuhuYXNfi
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-aab823c.diff"

diff --git a/drivers/gpu/drm/nouveau/core/subdev/bios/extdev.c b/drivers/gpu/drm/nouveau/core/subdev/bios/extdev.c
index 5afb568..b2a676e 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/bios/extdev.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/bios/extdev.c
@@ -48,7 +48,7 @@ extdev_table(struct nouveau_bios *bios, u8 *ver, u8 *hdr, u8 *len, u8 *cnt)
 	return extdev + *hdr;
 }
 
-u16
+static u16
 nvbios_extdev_entry(struct nouveau_bios *bios, int idx, u8 *ver, u8 *len)
 {
 	u8 hdr, cnt;

--3lcZGd9BuhuYXNfi--
