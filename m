From: Facundo Gaich <facugaich@gmail.com>
Date: Fri, 05 Nov 2010 23:08:35 +0000
Subject: Cc: [PATCH] Staging: solo6x10: Fix checkpatch errors and most warnings
Message-Id: <AANLkTikQ_a4bS6aNOfEJMgF3w_17S8RBrWx7HbpqhK0K@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: kernel-janitors@vger.kernel.org

(Forgot to Cc this list in the original email. By the way, I sent this
to greg@kroah instead of greg@suse, because that's what the TODO file
said. I hope that's still ok?)

This patch fixes all errors and most warnings reported by
checkpatch.pl for all the files in the driver.
Signed-off-by: Facundo Gaich <facugaich@gmail.com>
---
=A0drivers/staging/solo6x10/solo6010-core.c =A0 =A0 | =A0 30 +++---
=A0drivers/staging/solo6x10/solo6010-disp.c =A0 =A0 | =A0 =A06 +-
=A0drivers/staging/solo6x10/solo6010-enc.c =A0 =A0 =A0| =A0 =A06 +-
=A0drivers/staging/solo6x10/solo6010-g723.c =A0 =A0 | =A0 22 +++--
=A0drivers/staging/solo6x10/solo6010-gpio.c =A0 =A0 | =A0 =A04 +-
=A0drivers/staging/solo6x10/solo6010-i2c.c =A0 =A0 =A0| =A0 =A07 +-
=A0drivers/staging/solo6x10/solo6010-osd-font.h | =A0 60 +++++++-------
=A0drivers/staging/solo6x10/solo6010-p2m.c =A0 =A0 =A0| =A0 =A04 +-
=A0drivers/staging/solo6x10/solo6010-tw28.c =A0 =A0 | =A0118 +++++++++++++-=
------------
=A0drivers/staging/solo6x10/solo6010-v4l2-enc.c | =A0 44 +++++-----
=A0drivers/staging/solo6x10/solo6010-v4l2.c =A0 =A0 | =A0 35 ++++----
=A0drivers/staging/solo6x10/solo6010.h =A0 =A0 =A0 =A0 =A0| =A0 =A04 +-
=A012 files changed, 175 insertions(+), 165 deletions(-)

diff --git a/drivers/staging/solo6x10/solo6010-core.c
b/drivers/staging/solo6x10/solo6010-core.c
index 4a051cd..0b4fe59 100644
--- a/drivers/staging/solo6x10/solo6010-core.c
+++ b/drivers/staging/solo6x10/solo6010-core.c
@@ -163,21 +163,21 @@ static int __devinit solo6010_pci_probe(struct
pci_dev *pdev,
=A0 =A0 =A0 =A0chip_id =3D solo_reg_read(solo_dev, SOLO_CHIP_OPTION) &
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0SOLO_CHIP_ID_MASK;
=A0 =A0 =A0 =A0switch (chip_id) {
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 7:
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 solo_dev->nr_chans =3D 16;
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 solo_dev->nr_ext =3D 5;
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 6:
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 solo_dev->nr_chans =3D 8;
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 solo_dev->nr_ext =3D 2;
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 default:
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(&pdev->dev, "Invalid=
 chip_id 0x%02x, "
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"defaultin=
g to 4 channels\n",
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip_id);
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 case 5:
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 solo_dev->nr_chans =3D 4;
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 solo_dev->nr_ext =3D 1;
+ =A0 =A0 =A0 case 7:
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 solo_dev->nr_chans =3D 16;
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 solo_dev->nr_ext =3D 5;
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
+ =A0 =A0 =A0 case 6:
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 solo_dev->nr_chans =3D 8;
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 solo_dev->nr_ext =3D 2;
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
+ =A0 =A0 =A0 default:
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_warn(&pdev->dev, "Invalid chip_id 0x%02x,=
 "
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"defaulting to 4 channels\=
n",
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0chip_id);
+ =A0 =A0 =A0 case 5:
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 solo_dev->nr_chans =3D 4;
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 solo_dev->nr_ext =3D 1;
=A0 =A0 =A0 =A0}

=A0 =A0 =A0 =A0/* Disable all interrupts to start */
diff --git a/drivers/staging/solo6x10/solo6010-disp.c
b/drivers/staging/solo6x10/solo6010-disp.c
index 555f024..a8389de 100644
--- a/drivers/staging/solo6x10/solo6010-disp.c
+++ b/drivers/staging/solo6x10/solo6010-disp.c
@@ -198,12 +198,12 @@ static void solo_motion_config(struct
solo6010_dev *solo_dev)
=A0 =A0 =A0 =A0}

=A0 =A0 =A0 =A0/* Default motion settings */
- =A0 =A0 =A0 =A0solo_reg_write(solo_dev, SOLO_VI_MOT_ADR, SOLO_VI_MOTION_E=
N(0) |
+ =A0 =A0 =A0 solo_reg_write(solo_dev, SOLO_VI_MOT_ADR, SOLO_VI_MOTION_EN(0=
) |
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (SOLO_MOTION_EXT_ADDR(solo_dev)=
 >> 16));
=A0 =A0 =A0 =A0solo_reg_write(solo_dev, SOLO_VI_MOT_CTRL,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SOLO_VI_MOTION_FRAME_COUNT(3) |
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SOLO_VI_MOTION_SAMPLE_LENGTH(so=
lo_dev->video_hsize / 16)
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| //SOLO_VI_MOTION_INTR_START_=
STOP |
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| /*SOLO_VI_MOTION_INTR_START_=
STOP |*/
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SOLO_VI_MOTION_SAMPLE_COUNT(10)=
);

=A0 =A0 =A0 =A0solo_reg_write(solo_dev, SOLO_VI_MOTION_BORDER, 0);
@@ -264,7 +264,7 @@ void solo_disp_exit(struct solo6010_dev *solo_dev)
=A0 =A0 =A0 =A0solo_reg_write(solo_dev, SOLO_VO_RECTANGLE_CTRL(0), 0);
=A0 =A0 =A0 =A0solo_reg_write(solo_dev, SOLO_VO_RECTANGLE_START(0), 0);
=A0 =A0 =A0 =A0solo_reg_write(solo_dev, SOLO_VO_RECTANGLE_STOP(0), 0);
-
+
=A0 =A0 =A0 =A0solo_reg_write(solo_dev, SOLO_VO_RECTANGLE_CTRL(1), 0);
=A0 =A0 =A0 =A0solo_reg_write(solo_dev, SOLO_VO_RECTANGLE_START(1), 0);
=A0 =A0 =A0 =A0solo_reg_write(solo_dev, SOLO_VO_RECTANGLE_STOP(1), 0);
diff --git a/drivers/staging/solo6x10/solo6010-enc.c
b/drivers/staging/solo6x10/solo6010-enc.c
index a6cf0a8..481a492 100644
--- a/drivers/staging/solo6x10/solo6010-enc.c
+++ b/drivers/staging/solo6x10/solo6010-enc.c
@@ -22,7 +22,7 @@
=A0#include "solo6010.h"
=A0#include "solo6010-osd-font.h"

-#define CAPTURE_MAX_BANDWIDTH =A0 =A0 =A0 =A0 =A032 =A0 =A0 =A0// D1 4chan=
nel (D1 =3D 4)
+#define CAPTURE_MAX_BANDWIDTH =A0 =A0 =A0 =A0 =A032 =A0 =A0 =A0/* D1 4chan=
nel (D1 =3D 4) */
=A0#define OSG_BUFFER_SIZE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01=
024

=A0#define VI_PROG_HSIZE =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1280 - 16)
@@ -145,8 +145,8 @@ int solo_osd_print(struct solo_enc_dev *solo_enc)

=A0 =A0 =A0 =A0solo_p2m_dma(solo_dev, 0, 1, buf, SOLO_EOSD_EXT_ADDR(solo_de=
v) +
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (solo_enc->ch * SOLO_EOSD_EXT_SIZE)=
, SOLO_EOSD_EXT_SIZE);
- =A0 =A0 =A0 =A0reg |=3D (1 << solo_enc->ch);
- =A0 =A0 =A0 =A0solo_reg_write(solo_dev, SOLO_VE_OSD_CH, reg);
+ =A0 =A0 =A0 reg |=3D (1 << solo_enc->ch);
+ =A0 =A0 =A0 solo_reg_write(solo_dev, SOLO_VE_OSD_CH, reg);

=A0 =A0 =A0 =A0kfree(buf);

diff --git a/drivers/staging/solo6x10/solo6010-g723.c
b/drivers/staging/solo6x10/solo6010-g723.c
index 82fbcb8..254b46a 100644
--- a/drivers/staging/solo6x10/solo6010-g723.c
+++ b/drivers/staging/solo6x10/solo6010-g723.c
@@ -47,7 +47,7 @@
=A0* is broken down to 20 * 48 byte regions (one for each channel possible)
=A0* with the rest of the page being dummy data. */
=A0#define MAX_BUFFER =A0 =A0 =A0 =A0 =A0 =A0 (G723_PERIOD_BYTES * PERIODS_=
MAX)
-#define IRQ_PAGES =A0 =A0 =A0 =A0 =A0 =A0 =A04 // 0 - 4
+#define IRQ_PAGES =A0 =A0 =A0 =A0 =A0 =A0 =A04 /* 0 - 4 */
=A0#define PERIODS_MIN =A0 =A0 =A0 =A0 =A0 =A0(1 << IRQ_PAGES)
=A0#define PERIODS_MAX =A0 =A0 =A0 =A0 =A0 =A0G723_FDMA_PAGES

@@ -158,7 +158,7 @@ static int snd_solo_pcm_close(struct snd_pcm_substream =
*ss)
=A0 =A0 =A0 =A0snd_pcm_substream_chip(ss) =3D solo_pcm->solo_dev;
=A0 =A0 =A0 =A0kfree(solo_pcm);

- =A0 =A0 =A0 =A0return 0;
+ =A0 =A0 =A0 return 0;
=A0}

=A0static int snd_solo_pcm_trigger(struct snd_pcm_substream *ss, int cmd)
@@ -197,7 +197,7 @@ static int snd_solo_pcm_trigger(struct
snd_pcm_substream *ss, int cmd)

=A0static int snd_solo_pcm_prepare(struct snd_pcm_substream *ss)
=A0{
- =A0 =A0 =A0 =A0return 0;
+ =A0 =A0 =A0 return 0;
=A0}

=A0static snd_pcm_uframes_t snd_solo_pcm_pointer(struct snd_pcm_substream *=
ss)
@@ -271,7 +271,7 @@ static int snd_solo_capture_volume_get(struct
snd_kcontrol *kcontrol,

=A0 =A0 =A0 =A0value->value.integer.value[0] =3D tw28_get_audio_gain(solo_d=
ev, ch);

- =A0 =A0 =A0 =A0return 0;
+ =A0 =A0 =A0 return 0;
=A0}

=A0static int snd_solo_capture_volume_put(struct snd_kcontrol *kcontrol,
@@ -279,15 +279,15 @@ static int snd_solo_capture_volume_put(struct
snd_kcontrol *kcontrol,
=A0{
=A0 =A0 =A0 =A0struct solo6010_dev *solo_dev =3D snd_kcontrol_chip(kcontrol=
);
=A0 =A0 =A0 =A0u8 ch =3D value->id.numid - 1;
- =A0 =A0 =A0 =A0u8 old_val;
+ =A0 =A0 =A0 u8 old_val;

- =A0 =A0 =A0 =A0old_val =3D tw28_get_audio_gain(solo_dev, ch);
+ =A0 =A0 =A0 old_val =3D tw28_get_audio_gain(solo_dev, ch);
=A0 =A0 =A0 =A0if (old_val =3D value->value.integer.value[0])
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;

=A0 =A0 =A0 =A0tw28_set_audio_gain(solo_dev, ch, value->value.integer.value=
[0]);

- =A0 =A0 =A0 =A0return 1;
+ =A0 =A0 =A0 return 1;
=A0}

=A0static struct snd_kcontrol_new snd_solo_capture_volume =3D {
@@ -368,14 +368,16 @@ int solo_g723_init(struct solo6010_dev *solo_dev)
=A0 =A0 =A0 =A0strcpy(card->mixername, "SOLO-6010");
=A0 =A0 =A0 =A0kctl =3D snd_solo_capture_volume;
=A0 =A0 =A0 =A0kctl.count =3D solo_dev->nr_chans;
- =A0 =A0 =A0 =A0ret =3D snd_ctl_add(card, snd_ctl_new1(&kctl, solo_dev));
+ =A0 =A0 =A0 ret =3D snd_ctl_add(card, snd_ctl_new1(&kctl, solo_dev));
=A0 =A0 =A0 =A0if (ret < 0)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;

- =A0 =A0 =A0 if ((ret =3D solo_snd_pcm_init(solo_dev)) < 0)
+ =A0 =A0 =A0 ret =3D solo_snd_pcm_init(solo_dev);
+ =A0 =A0 =A0 if (ret < 0)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto snd_error;

- =A0 =A0 =A0 if ((ret =3D snd_card_register(card)) < 0)
+ =A0 =A0 =A0 ret =3D snd_card_register(card);
+ =A0 =A0 =A0 if (ret < 0)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto snd_error;

=A0 =A0 =A0 =A0solo_g723_config(solo_dev);
diff --git a/drivers/staging/solo6x10/solo6010-gpio.c
b/drivers/staging/solo6x10/solo6010-gpio.c
index 46f7a71..8869b88 100644
--- a/drivers/staging/solo6x10/solo6010-gpio.c
+++ b/drivers/staging/solo6x10/solo6010-gpio.c
@@ -92,8 +92,8 @@ static void solo_gpio_config(struct solo6010_dev *solo_de=
v)

=A0int solo_gpio_init(struct solo6010_dev *solo_dev)
=A0{
- =A0 =A0 =A0 =A0solo_gpio_config(solo_dev);
- =A0 =A0 =A0 =A0return 0;
+ =A0 =A0 =A0 solo_gpio_config(solo_dev);
+ =A0 =A0 =A0 return 0;
=A0}

=A0void solo_gpio_exit(struct solo6010_dev *solo_dev)
diff --git a/drivers/staging/solo6x10/solo6010-i2c.c
b/drivers/staging/solo6x10/solo6010-i2c.c
index cadd512..75c2394 100644
--- a/drivers/staging/solo6x10/solo6010-i2c.c
+++ b/drivers/staging/solo6x10/solo6010-i2c.c
@@ -46,7 +46,7 @@ u8 solo_i2c_readbyte(struct solo6010_dev *solo_dev,
int id, u8 addr, u8 off)

=A0 =A0 =A0 =A0i2c_transfer(&solo_dev->i2c_adap[id], msgs, 2);

- =A0 =A0 =A0 =A0return data;
+ =A0 =A0 =A0 return data;
=A0}

=A0void solo_i2c_writebyte(struct solo6010_dev *solo_dev, int id, u8 addr,
@@ -225,7 +225,7 @@ static int solo_i2c_master_xfer(struct i2c_adapter *ada=
p,
=A0 =A0 =A0 =A0}

=A0 =A0 =A0 =A0if (i =3D SOLO_I2C_ADAPTERS)
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 return num; // XXX Right return value for fai=
lure?
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 return num; /* XXX Right return value for fai=
lure? */

=A0 =A0 =A0 =A0down(&solo_dev->i2c_sem);
=A0 =A0 =A0 =A0solo_dev->i2c_id =3D i;
@@ -296,7 +296,8 @@ int solo_i2c_init(struct solo6010_dev *solo_dev)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0adap->retries =3D 1;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0adap->dev.parent =3D &solo_dev->pdev->dev;

- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((ret =3D i2c_add_adapter(adap))) {
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D i2c_add_adapter(adap);
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret) {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0adap->algo_data =3D NULL;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
diff --git a/drivers/staging/solo6x10/solo6010-osd-font.h
b/drivers/staging/solo6x10/solo6010-osd-font.h
index d6f565b..d72efbb 100644
--- a/drivers/staging/solo6x10/solo6010-osd-font.h
+++ b/drivers/staging/solo6x10/solo6010-osd-font.h
@@ -22,7 +22,7 @@

=A0static const unsigned int solo_osd_font[] =3D {
=A0 =A0 =A0 =A00x00000000, 0x0000c0c8, 0xccfefe0c, 0x08000000,
- =A0 =A0 =A0 0x00000000, 0x10103838, 0x7c7cfefe, 0x00000000, // 0
+ =A0 =A0 =A0 0x00000000, 0x10103838, 0x7c7cfefe, 0x00000000, /* 0 */
=A0 =A0 =A0 =A00x00000000, 0xfefe7c7c, 0x38381010, 0x10000000,
=A0 =A0 =A0 =A00x00000000, 0x7c82fefe, 0xfefefe7c, 0x00000000,
=A0 =A0 =A0 =A00x00000000, 0x00001038, 0x10000000, 0x00000000,
@@ -54,67 +54,67 @@ static const unsigned int solo_osd_font[] =3D {
=A0 =A0 =A0 =A00x0000003f, 0x7f404c52, 0x524c407f, 0x00000000,
=A0 =A0 =A0 =A00x0000007c, 0x82ba82ba, 0x82ba82fe, 0x00000000,
=A0 =A0 =A0 =A00x00000000, 0x00000000, 0x00000000, 0x00000000,
- =A0 =A0 =A0 0x00000000, 0x183c3c3c, 0x18180018, 0x18000000, // 32 =A0 !
+ =A0 =A0 =A0 0x00000000, 0x183c3c3c, 0x18180018, 0x18000000, /* 32 =A0 ! */
=A0 =A0 =A0 =A00x00000066, 0x66240000, 0x00000000, 0x00000000,
- =A0 =A0 =A0 0x00000000, 0x6c6cfe6c, 0x6c6cfe6c, 0x6c000000, // 34 " #
+ =A0 =A0 =A0 0x00000000, 0x6c6cfe6c, 0x6c6cfe6c, 0x6c000000, /* 34 " # */
=A0 =A0 =A0 =A00x00001010, 0x7cd6d616, 0x7cd0d6d6, 0x7c101000,
- =A0 =A0 =A0 0x00000000, 0x0086c660, 0x30180cc6, 0xc2000000, // 36 $ %
+ =A0 =A0 =A0 0x00000000, 0x0086c660, 0x30180cc6, 0xc2000000, /* 36 $ % */
=A0 =A0 =A0 =A00x00000000, 0x386c6c38, 0xdc766666, 0xdc000000,
- =A0 =A0 =A0 0x0000000c, 0x0c0c0600, 0x00000000, 0x00000000, // 38 & '
+ =A0 =A0 =A0 0x0000000c, 0x0c0c0600, 0x00000000, 0x00000000, /* 38 & ' */
=A0 =A0 =A0 =A00x00000000, 0x30180c0c, 0x0c0c0c18, 0x30000000,
- =A0 =A0 =A0 0x00000000, 0x0c183030, 0x30303018, 0x0c000000, // 40 ( )
+ =A0 =A0 =A0 0x00000000, 0x0c183030, 0x30303018, 0x0c000000, /* 40 ( ) */
=A0 =A0 =A0 =A00x00000000, 0x0000663c, 0xff3c6600, 0x00000000,
- =A0 =A0 =A0 0x00000000, 0x00001818, 0x7e181800, 0x00000000, // 42 * +
+ =A0 =A0 =A0 0x00000000, 0x00001818, 0x7e181800, 0x00000000, /* 42 * + */
=A0 =A0 =A0 =A00x00000000, 0x00000000, 0x00000e0e, 0x0c060000,
- =A0 =A0 =A0 0x00000000, 0x00000000, 0x7e000000, 0x00000000, // 44 , -
+ =A0 =A0 =A0 0x00000000, 0x00000000, 0x7e000000, 0x00000000, /* 44 , - */
=A0 =A0 =A0 =A00x00000000, 0x00000000, 0x00000006, 0x06000000,
- =A0 =A0 =A0 0x00000000, 0x80c06030, 0x180c0602, 0x00000000, // 46 . /
+ =A0 =A0 =A0 0x00000000, 0x80c06030, 0x180c0602, 0x00000000, /* 46 . / */
=A0 =A0 =A0 =A00x0000007c, 0xc6e6f6de, 0xcec6c67c, 0x00000000,
- =A0 =A0 =A0 0x00000030, 0x383c3030, 0x303030fc, 0x00000000, // 48 0 1
+ =A0 =A0 =A0 0x00000030, 0x383c3030, 0x303030fc, 0x00000000, /* 48 0 1 */
=A0 =A0 =A0 =A00x0000007c, 0xc6c06030, 0x180cc6fe, 0x00000000,
- =A0 =A0 =A0 0x0000007c, 0xc6c0c07c, 0xc0c0c67c, 0x00000000, // 50 2 3
+ =A0 =A0 =A0 0x0000007c, 0xc6c0c07c, 0xc0c0c67c, 0x00000000, /* 50 2 3 */
=A0 =A0 =A0 =A00x00000060, 0x70786c66, 0xfe6060f0, 0x00000000,
- =A0 =A0 =A0 0x000000fe, 0x0606067e, 0xc0c0c67c, 0x00000000, // 52 4 5
+ =A0 =A0 =A0 0x000000fe, 0x0606067e, 0xc0c0c67c, 0x00000000, /* 52 4 5 */
=A0 =A0 =A0 =A00x00000038, 0x0c06067e, 0xc6c6c67c, 0x00000000,
- =A0 =A0 =A0 0x000000fe, 0xc6c06030, 0x18181818, 0x00000000, // 54 6 7
+ =A0 =A0 =A0 0x000000fe, 0xc6c06030, 0x18181818, 0x00000000, /* 54 6 7 */
=A0 =A0 =A0 =A00x0000007c, 0xc6c6c67c, 0xc6c6c67c, 0x00000000,
- =A0 =A0 =A0 0x0000007c, 0xc6c6c6fc, 0xc0c06038, 0x00000000, // 56 8 9
+ =A0 =A0 =A0 0x0000007c, 0xc6c6c6fc, 0xc0c06038, 0x00000000, /* 56 8 9 */
=A0 =A0 =A0 =A00x00000000, 0x18180000, 0x00181800, 0x00000000,
- =A0 =A0 =A0 0x00000000, 0x18180000, 0x0018180c, 0x00000000, // 58 : ;
+ =A0 =A0 =A0 0x00000000, 0x18180000, 0x0018180c, 0x00000000, /* 58 : ; */
=A0 =A0 =A0 =A00x00000060, 0x30180c06, 0x0c183060, 0x00000000,
=A0 =A0 =A0 =A00x00000000, 0x007e0000, 0x007e0000, 0x00000000,
=A0 =A0 =A0 =A00x00000006, 0x0c183060, 0x30180c06, 0x00000000,
=A0 =A0 =A0 =A00x0000007c, 0xc6c66030, 0x30003030, 0x00000000,
=A0 =A0 =A0 =A00x0000007c, 0xc6f6d6d6, 0x7606067c, 0x00000000,
- =A0 =A0 =A0 0x00000010, 0x386cc6c6, 0xfec6c6c6, 0x00000000, // 64 @ A
+ =A0 =A0 =A0 0x00000010, 0x386cc6c6, 0xfec6c6c6, 0x00000000, /* 64 @ A */
=A0 =A0 =A0 =A00x0000007e, 0xc6c6c67e, 0xc6c6c67e, 0x00000000,
- =A0 =A0 =A0 0x00000078, 0xcc060606, 0x0606cc78, 0x00000000, // 66
+ =A0 =A0 =A0 0x00000078, 0xcc060606, 0x0606cc78, 0x00000000, /* 66 */
=A0 =A0 =A0 =A00x0000003e, 0x66c6c6c6, 0xc6c6663e, 0x00000000,
- =A0 =A0 =A0 0x000000fe, 0x0606063e, 0x060606fe, 0x00000000, // 68
+ =A0 =A0 =A0 0x000000fe, 0x0606063e, 0x060606fe, 0x00000000, /* 68 */
=A0 =A0 =A0 =A00x000000fe, 0x0606063e, 0x06060606, 0x00000000,
- =A0 =A0 =A0 0x00000078, 0xcc060606, 0xf6c6ccb8, 0x00000000, // 70
+ =A0 =A0 =A0 0x00000078, 0xcc060606, 0xf6c6ccb8, 0x00000000, /* 70 */
=A0 =A0 =A0 =A00x000000c6, 0xc6c6c6fe, 0xc6c6c6c6, 0x00000000,
- =A0 =A0 =A0 0x0000003c, 0x18181818, 0x1818183c, 0x00000000, // 72
+ =A0 =A0 =A0 0x0000003c, 0x18181818, 0x1818183c, 0x00000000, /* 72 */
=A0 =A0 =A0 =A00x00000060, 0x60606060, 0x6066663c, 0x00000000,
- =A0 =A0 =A0 0x000000c6, 0xc666361e, 0x3666c6c6, 0x00000000, // 74
+ =A0 =A0 =A0 0x000000c6, 0xc666361e, 0x3666c6c6, 0x00000000, /* 74 */
=A0 =A0 =A0 =A00x00000006, 0x06060606, 0x060606fe, 0x00000000,
- =A0 =A0 =A0 0x000000c6, 0xeefed6c6, 0xc6c6c6c6, 0x00000000, // 76
+ =A0 =A0 =A0 0x000000c6, 0xeefed6c6, 0xc6c6c6c6, 0x00000000, /* 76 */
=A0 =A0 =A0 =A00x000000c6, 0xcedefef6, 0xe6c6c6c6, 0x00000000,
- =A0 =A0 =A0 0x00000038, 0x6cc6c6c6, 0xc6c66c38, 0x00000000, // 78
+ =A0 =A0 =A0 0x00000038, 0x6cc6c6c6, 0xc6c66c38, 0x00000000, /* 78 */
=A0 =A0 =A0 =A00x0000007e, 0xc6c6c67e, 0x06060606, 0x00000000,
- =A0 =A0 =A0 0x00000038, 0x6cc6c6c6, 0xc6d67c38, 0x60000000, // 80
+ =A0 =A0 =A0 0x00000038, 0x6cc6c6c6, 0xc6d67c38, 0x60000000, /* 80 */
=A0 =A0 =A0 =A00x0000007e, 0xc6c6c67e, 0x66c6c6c6, 0x00000000,
- =A0 =A0 =A0 0x0000007c, 0xc6c60c38, 0x60c6c67c, 0x00000000, // 82
+ =A0 =A0 =A0 0x0000007c, 0xc6c60c38, 0x60c6c67c, 0x00000000, /* 82 */
=A0 =A0 =A0 =A00x0000007e, 0x18181818, 0x18181818, 0x00000000,
- =A0 =A0 =A0 0x000000c6, 0xc6c6c6c6, 0xc6c6c67c, 0x00000000, // 84
+ =A0 =A0 =A0 0x000000c6, 0xc6c6c6c6, 0xc6c6c67c, 0x00000000, /* 84 */
=A0 =A0 =A0 =A00x000000c6, 0xc6c6c6c6, 0xc66c3810, 0x00000000,
- =A0 =A0 =A0 0x000000c6, 0xc6c6c6c6, 0xd6d6fe6c, 0x00000000, // 86
+ =A0 =A0 =A0 0x000000c6, 0xc6c6c6c6, 0xd6d6fe6c, 0x00000000, /* 86 */
=A0 =A0 =A0 =A00x000000c6, 0xc6c66c38, 0x6cc6c6c6, 0x00000000,
- =A0 =A0 =A0 0x00000066, 0x66666666, 0x3c181818, 0x00000000, // 88
+ =A0 =A0 =A0 0x00000066, 0x66666666, 0x3c181818, 0x00000000, /* 88 */
=A0 =A0 =A0 =A00x000000fe, 0xc0603018, 0x0c0606fe, 0x00000000,
- =A0 =A0 =A0 0x0000003c, 0x0c0c0c0c, 0x0c0c0c3c, 0x00000000, // 90
+ =A0 =A0 =A0 0x0000003c, 0x0c0c0c0c, 0x0c0c0c3c, 0x00000000, /* 90 */
=A0 =A0 =A0 =A00x00000002, 0x060c1830, 0x60c08000, 0x00000000,
- =A0 =A0 =A0 0x0000003c, 0x30303030, 0x3030303c, 0x00000000, // 92
+ =A0 =A0 =A0 0x0000003c, 0x30303030, 0x3030303c, 0x00000000, /* 92 */
=A0 =A0 =A0 =A00x00001038, 0x6cc60000, 0x00000000, 0x00000000,
=A0 =A0 =A0 =A00x00000000, 0x00000000, 0x00000000, 0x00fe0000,
=A0 =A0 =A0 =A00x00001818, 0x30000000, 0x00000000, 0x00000000,
diff --git a/drivers/staging/solo6x10/solo6010-p2m.c
b/drivers/staging/solo6x10/solo6010-p2m.c
index 7ed3ed4..723ab2b 100644
--- a/drivers/staging/solo6x10/solo6010-p2m.c
+++ b/drivers/staging/solo6x10/solo6010-p2m.c
@@ -21,7 +21,7 @@

=A0#include "solo6010.h"

-// #define SOLO_TEST_P2M
+/* #define SOLO_TEST_P2M */

=A0int solo_p2m_dma(struct solo6010_dev *solo_dev, u8 id, int wr,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 void *sys_addr, u32 ext_addr, u32 size)
@@ -147,7 +147,7 @@ static void run_p2m_test(struct solo6010_dev *solo_dev)
=A0 =A0 =A0 =A0return;
=A0}
=A0#else
-#define run_p2m_test(__solo) =A0 do{}while(0)
+#define run_p2m_test(__solo) =A0 do {} while (0)
=A0#endif

=A0void solo_p2m_isr(struct solo6010_dev *solo_dev, int id)
diff --git a/drivers/staging/solo6x10/solo6010-tw28.c
b/drivers/staging/solo6x10/solo6010-tw28.c
index 0159c83..905a6ad 100644
--- a/drivers/staging/solo6x10/solo6010-tw28.c
+++ b/drivers/staging/solo6x10/solo6010-tw28.c
@@ -35,107 +35,107 @@
=A0#define DEFAULT_VACTIVE_PAL =A0 =A0 =A0 =A0 =A0 =A0(312-DEFAULT_VDELAY_P=
AL)

=A0static u8 tbl_tw2864_template[] =3D {
- =A0 =A0 =A0 0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, // 0x00
+ =A0 =A0 =A0 0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, /* 0x00 */
=A0 =A0 =A0 =A00x12, 0xf5, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
- =A0 =A0 =A0 0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, // 0x10
+ =A0 =A0 =A0 0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, /* 0x10 */
=A0 =A0 =A0 =A00x12, 0xf5, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
- =A0 =A0 =A0 0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, // 0x20
+ =A0 =A0 =A0 0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, /* 0x20 */
=A0 =A0 =A0 =A00x12, 0xf5, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
- =A0 =A0 =A0 0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, // 0x30
+ =A0 =A0 =A0 0x00, 0x00, 0x80, 0x10, 0x80, 0x80, 0x00, 0x02, /* 0x30 */
=A0 =A0 =A0 =A00x12, 0xf5, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
- =A0 =A0 =A0 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x40
+ =A0 =A0 =A0 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x40 */
=A0 =A0 =A0 =A00x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
- =A0 =A0 =A0 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x50
+ =A0 =A0 =A0 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x50 */
=A0 =A0 =A0 =A00x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
- =A0 =A0 =A0 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x60
+ =A0 =A0 =A0 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x60 */
=A0 =A0 =A0 =A00x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
- =A0 =A0 =A0 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x70
+ =A0 =A0 =A0 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x70 */
=A0 =A0 =A0 =A00x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0xA3, 0x00,
- =A0 =A0 =A0 0x00, 0x02, 0x00, 0xcc, 0x00, 0x80, 0x44, 0x50, // 0x80
+ =A0 =A0 =A0 0x00, 0x02, 0x00, 0xcc, 0x00, 0x80, 0x44, 0x50, /* 0x80 */
=A0 =A0 =A0 =A00x22, 0x01, 0xd8, 0xbc, 0xb8, 0x44, 0x38, 0x00,
- =A0 =A0 =A0 0x00, 0x78, 0x72, 0x3e, 0x14, 0xa5, 0xe4, 0x05, // 0x90
+ =A0 =A0 =A0 0x00, 0x78, 0x72, 0x3e, 0x14, 0xa5, 0xe4, 0x05, /* 0x90 */
=A0 =A0 =A0 =A00x00, 0x28, 0x44, 0x44, 0xa0, 0x88, 0x5a, 0x01,
- =A0 =A0 =A0 0x08, 0x08, 0x08, 0x08, 0x1a, 0x1a, 0x1a, 0x1a, // 0xa0
+ =A0 =A0 =A0 0x08, 0x08, 0x08, 0x08, 0x1a, 0x1a, 0x1a, 0x1a, /* 0xa0 */
=A0 =A0 =A0 =A00x00, 0x00, 0x00, 0xf0, 0xf0, 0xf0, 0xf0, 0x44,
- =A0 =A0 =A0 0x44, 0x0a, 0x00, 0xff, 0xef, 0xef, 0xef, 0xef, // 0xb0
+ =A0 =A0 =A0 0x44, 0x0a, 0x00, 0xff, 0xef, 0xef, 0xef, 0xef, /* 0xb0 */
=A0 =A0 =A0 =A00x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
- =A0 =A0 =A0 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0xc0
+ =A0 =A0 =A0 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0xc0 */
=A0 =A0 =A0 =A00x00, 0x00, 0x55, 0x00, 0xb1, 0xe4, 0x40, 0x00,
- =A0 =A0 =A0 0x77, 0x77, 0x01, 0x13, 0x57, 0x9b, 0xdf, 0x20, // 0xd0
+ =A0 =A0 =A0 0x77, 0x77, 0x01, 0x13, 0x57, 0x9b, 0xdf, 0x20, /* 0xd0 */
=A0 =A0 =A0 =A00x64, 0xa8, 0xec, 0xd1, 0x0f, 0x11, 0x11, 0x81,
- =A0 =A0 =A0 0x10, 0xe0, 0xbb, 0xbb, 0x00, 0x11, 0x00, 0x00, // 0xe0
+ =A0 =A0 =A0 0x10, 0xe0, 0xbb, 0xbb, 0x00, 0x11, 0x00, 0x00, /* 0xe0 */
=A0 =A0 =A0 =A00x11, 0x00, 0x00, 0x11, 0x00, 0x00, 0x11, 0x00,
- =A0 =A0 =A0 0x83, 0xb5, 0x09, 0x78, 0x85, 0x00, 0x01, 0x20, // 0xf0
+ =A0 =A0 =A0 0x83, 0xb5, 0x09, 0x78, 0x85, 0x00, 0x01, 0x20, /* 0xf0 */
=A0 =A0 =A0 =A00x64, 0x11, 0x40, 0xaf, 0xff, 0x00, 0x00, 0x00,
=A0};

=A0static u8 tbl_tw2865_ntsc_template[] =3D {
- =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x02, // 0x00
+ =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x02, /* 0x00 */
=A0 =A0 =A0 =A00x12, 0xff, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
- =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x02, // 0x10
+ =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x02, /* 0x10 */
=A0 =A0 =A0 =A00x12, 0xff, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
- =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x02, // 0x20
+ =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x02, /* 0x20 */
=A0 =A0 =A0 =A00x12, 0xff, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
- =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x48, 0x80, 0x80, 0x00, 0x02, // 0x30
+ =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x48, 0x80, 0x80, 0x00, 0x02, /* 0x30 */
=A0 =A0 =A0 =A00x12, 0xff, 0x09, 0xd0, 0x00, 0x00, 0x00, 0x7f,
- =A0 =A0 =A0 0x00, 0x00, 0x90, 0x68, 0x00, 0x38, 0x80, 0x80, // 0x40
+ =A0 =A0 =A0 0x00, 0x00, 0x90, 0x68, 0x00, 0x38, 0x80, 0x80, /* 0x40 */
=A0 =A0 =A0 =A00x80, 0x80, 0x77, 0x00, 0x00, 0x00, 0x00, 0x00,
- =A0 =A0 =A0 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x50
+ =A0 =A0 =A0 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x50 */
=A0 =A0 =A0 =A00x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
- =A0 =A0 =A0 0x45, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x60
+ =A0 =A0 =A0 0x45, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x60 */
=A0 =A0 =A0 =A00x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x43,
- =A0 =A0 =A0 0x08, 0x00, 0x00, 0x01, 0xf1, 0x03, 0xEF, 0x03, // 0x70
+ =A0 =A0 =A0 0x08, 0x00, 0x00, 0x01, 0xf1, 0x03, 0xEF, 0x03, /* 0x70 */
=A0 =A0 =A0 =A00xE9, 0x03, 0xD9, 0x15, 0x15, 0xE4, 0xA3, 0x80,
- =A0 =A0 =A0 0x00, 0x02, 0x00, 0xCC, 0x00, 0x80, 0x44, 0x50, // 0x80
+ =A0 =A0 =A0 0x00, 0x02, 0x00, 0xCC, 0x00, 0x80, 0x44, 0x50, /* 0x80 */
=A0 =A0 =A0 =A00x22, 0x01, 0xD8, 0xBC, 0xB8, 0x44, 0x38, 0x00,
- =A0 =A0 =A0 0x00, 0x78, 0x44, 0x3D, 0x14, 0xA5, 0xE0, 0x05, // 0x90
+ =A0 =A0 =A0 0x00, 0x78, 0x44, 0x3D, 0x14, 0xA5, 0xE0, 0x05, /* 0x90 */
=A0 =A0 =A0 =A00x00, 0x28, 0x44, 0x44, 0xA0, 0x90, 0x52, 0x13,
- =A0 =A0 =A0 0x08, 0x08, 0x08, 0x08, 0x1A, 0x1A, 0x1B, 0x1A, // 0xa0
+ =A0 =A0 =A0 0x08, 0x08, 0x08, 0x08, 0x1A, 0x1A, 0x1B, 0x1A, /* 0xa0 */
=A0 =A0 =A0 =A00x00, 0x00, 0x00, 0xF0, 0xF0, 0xF0, 0xF0, 0x44,
- =A0 =A0 =A0 0x44, 0x4A, 0x00, 0xFF, 0xEF, 0xEF, 0xEF, 0xEF, // 0xb0
+ =A0 =A0 =A0 0x44, 0x4A, 0x00, 0xFF, 0xEF, 0xEF, 0xEF, 0xEF, /* 0xb0 */
=A0 =A0 =A0 =A00xFF, 0xE7, 0xE9, 0xE9, 0xEB, 0xFF, 0xD6, 0xD8,
- =A0 =A0 =A0 0xD8, 0xD7, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0xc0
+ =A0 =A0 =A0 0xD8, 0xD7, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0xc0 */
=A0 =A0 =A0 =A00x00, 0x00, 0x55, 0x00, 0xE4, 0x39, 0x00, 0x80,
- =A0 =A0 =A0 0x77, 0x77, 0x03, 0x20, 0x57, 0x9b, 0xdf, 0x31, // 0xd0
+ =A0 =A0 =A0 0x77, 0x77, 0x03, 0x20, 0x57, 0x9b, 0xdf, 0x31, /* 0xd0 */
=A0 =A0 =A0 =A00x64, 0xa8, 0xec, 0xd1, 0x0f, 0x11, 0x11, 0x81,
- =A0 =A0 =A0 0x10, 0xC0, 0xAA, 0xAA, 0x00, 0x11, 0x00, 0x00, // 0xe0
+ =A0 =A0 =A0 0x10, 0xC0, 0xAA, 0xAA, 0x00, 0x11, 0x00, 0x00, /* 0xe0 */
=A0 =A0 =A0 =A00x11, 0x00, 0x00, 0x11, 0x00, 0x00, 0x11, 0x00,
- =A0 =A0 =A0 0x83, 0xB5, 0x09, 0x78, 0x85, 0x00, 0x01, 0x20, // 0xf0
+ =A0 =A0 =A0 0x83, 0xB5, 0x09, 0x78, 0x85, 0x00, 0x01, 0x20, /* 0xf0 */
=A0 =A0 =A0 =A00x64, 0x51, 0x40, 0xaf, 0xFF, 0xF0, 0x00, 0xC0,
=A0};

=A0static u8 tbl_tw2865_pal_template[] =3D {
- =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, // 0x00
+ =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, /* 0x00 */
=A0 =A0 =A0 =A00x11, 0xff, 0x01, 0xc3, 0x00, 0x00, 0x01, 0x7f,
- =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, // 0x10
+ =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, /* 0x10 */
=A0 =A0 =A0 =A00x11, 0xff, 0x01, 0xc3, 0x00, 0x00, 0x01, 0x7f,
- =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, // 0x20
+ =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, /* 0x20 */
=A0 =A0 =A0 =A00x11, 0xff, 0x01, 0xc3, 0x00, 0x00, 0x01, 0x7f,
- =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, // 0x30
+ =A0 =A0 =A0 0x00, 0xf0, 0x70, 0x30, 0x80, 0x80, 0x00, 0x12, /* 0x30 */
=A0 =A0 =A0 =A00x11, 0xff, 0x01, 0xc3, 0x00, 0x00, 0x01, 0x7f,
- =A0 =A0 =A0 0x00, 0x94, 0x90, 0x48, 0x00, 0x38, 0x7F, 0x80, // 0x40
+ =A0 =A0 =A0 0x00, 0x94, 0x90, 0x48, 0x00, 0x38, 0x7F, 0x80, /* 0x40 */
=A0 =A0 =A0 =A00x80, 0x80, 0x77, 0x00, 0x00, 0x00, 0x00, 0x00,
- =A0 =A0 =A0 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x50
+ =A0 =A0 =A0 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x50 */
=A0 =A0 =A0 =A00x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
- =A0 =A0 =A0 0x45, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0x60
+ =A0 =A0 =A0 0x45, 0x11, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0x60 */
=A0 =A0 =A0 =A00x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x21, 0x43,
- =A0 =A0 =A0 0x08, 0x00, 0x00, 0x01, 0xf1, 0x03, 0xEF, 0x03, // 0x70
+ =A0 =A0 =A0 0x08, 0x00, 0x00, 0x01, 0xf1, 0x03, 0xEF, 0x03, /* 0x70 */
=A0 =A0 =A0 =A00xEA, 0x03, 0xD9, 0x15, 0x15, 0xE4, 0xA3, 0x80,
- =A0 =A0 =A0 0x00, 0x02, 0x00, 0xCC, 0x00, 0x80, 0x44, 0x50, // 0x80
+ =A0 =A0 =A0 0x00, 0x02, 0x00, 0xCC, 0x00, 0x80, 0x44, 0x50, /* 0x80 */
=A0 =A0 =A0 =A00x22, 0x01, 0xD8, 0xBC, 0xB8, 0x44, 0x38, 0x00,
- =A0 =A0 =A0 0x00, 0x78, 0x44, 0x3D, 0x14, 0xA5, 0xE0, 0x05, // 0x90
+ =A0 =A0 =A0 0x00, 0x78, 0x44, 0x3D, 0x14, 0xA5, 0xE0, 0x05, /* 0x90 */
=A0 =A0 =A0 =A00x00, 0x28, 0x44, 0x44, 0xA0, 0x90, 0x52, 0x13,
- =A0 =A0 =A0 0x08, 0x08, 0x08, 0x08, 0x1A, 0x1A, 0x1A, 0x1A, // 0xa0
+ =A0 =A0 =A0 0x08, 0x08, 0x08, 0x08, 0x1A, 0x1A, 0x1A, 0x1A, /* 0xa0 */
=A0 =A0 =A0 =A00x00, 0x00, 0x00, 0xF0, 0xF0, 0xF0, 0xF0, 0x44,
- =A0 =A0 =A0 0x44, 0x4A, 0x00, 0xFF, 0xEF, 0xEF, 0xEF, 0xEF, // 0xb0
+ =A0 =A0 =A0 0x44, 0x4A, 0x00, 0xFF, 0xEF, 0xEF, 0xEF, 0xEF, /* 0xb0 */
=A0 =A0 =A0 =A00xFF, 0xE7, 0xE9, 0xE9, 0xE9, 0xFF, 0xD7, 0xD8,
- =A0 =A0 =A0 0xD9, 0xD8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, // 0xc0
+ =A0 =A0 =A0 0xD9, 0xD8, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, /* 0xc0 */
=A0 =A0 =A0 =A00x00, 0x00, 0x55, 0x00, 0xE4, 0x39, 0x00, 0x80,
- =A0 =A0 =A0 0x77, 0x77, 0x03, 0x20, 0x57, 0x9b, 0xdf, 0x31, // 0xd0
+ =A0 =A0 =A0 0x77, 0x77, 0x03, 0x20, 0x57, 0x9b, 0xdf, 0x31, /* 0xd0 */
=A0 =A0 =A0 =A00x64, 0xa8, 0xec, 0xd1, 0x0f, 0x11, 0x11, 0x81,
- =A0 =A0 =A0 0x10, 0xC0, 0xAA, 0xAA, 0x00, 0x11, 0x00, 0x00, // 0xe0
+ =A0 =A0 =A0 0x10, 0xC0, 0xAA, 0xAA, 0x00, 0x11, 0x00, 0x00, /* 0xe0 */
=A0 =A0 =A0 =A00x11, 0x00, 0x00, 0x11, 0x00, 0x00, 0x11, 0x00,
- =A0 =A0 =A0 0x83, 0xB5, 0x09, 0x00, 0xA0, 0x00, 0x01, 0x20, // 0xf0
+ =A0 =A0 =A0 0x83, 0xB5, 0x09, 0x00, 0xA0, 0x00, 0x01, 0x20, /* 0xf0 */
=A0 =A0 =A0 =A00x64, 0x51, 0x40, 0xaf, 0xFF, 0xF0, 0x00, 0xC0,
=A0};

@@ -181,8 +181,8 @@ static void tw_write_and_verify(struct
solo6010_dev *solo_dev, u8 addr, u8 off,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0msleep_interruptible(1);
=A0 =A0 =A0 =A0}

-// =A0 =A0 printk("solo6010/tw28: Error writing register: %02x->%02x [%02x=
]\n",
-// =A0 =A0 =A0 =A0 =A0 =A0 addr, off, val);
+/* =A0 =A0 printk("solo6010/tw28: Error writing register: %02x->%02x [%02x=
]\n",
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr, off, val); */
=A0}

=A0static int tw2865_setup(struct solo6010_dev *solo_dev, u8 dev_addr)
@@ -217,7 +217,7 @@ static int tw2865_setup(struct solo6010_dev
*solo_dev, u8 dev_addr)

=A0 =A0 =A0 =A0for (i =3D 0; i < 0xff; i++) {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Skip read only registers */
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i >=3D 0xb8 && i <=3D 0xc1 )
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i >=3D 0xb8 && i <=3D 0xc1)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((i & ~0x30) =3D 0x00 ||
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(i & ~0x30) =3D 0x0c ||
@@ -302,7 +302,7 @@ static int tw2864_setup(struct solo6010_dev
*solo_dev, u8 dev_addr)

=A0 =A0 =A0 =A0for (i =3D 0; i < 0xff; i++) {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Skip read only registers */
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i >=3D 0xb8 && i <=3D 0xc1 )
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i >=3D 0xb8 && i <=3D 0xc1)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0continue;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if ((i & ~0x30) =3D 0x00 ||
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(i & ~0x30) =3D 0x0c ||
@@ -334,13 +334,13 @@ static int tw2815_setup(struct solo6010_dev
*solo_dev, u8 dev_addr)
=A0 =A0 =A0 =A0};

=A0 =A0 =A0 =A0u8 tbl_tw2815_sfr[] =3D {
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00, 0x00, 0x00, 0xc0, 0x45, 0xa0, 0xd0, 0x2=
f, // 0x00
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00, 0x00, 0x00, 0xc0, 0x45, 0xa0, 0xd0, 0x2=
f, /* 0x00 */
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x64, 0x80, 0x80, 0x82, 0x82, 0x00, 0x00, 0x=
00,
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00, 0x0f, 0x05, 0x00, 0x00, 0x80, 0x06, 0x0=
0, // 0x10
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x00, 0x0f, 0x05, 0x00, 0x00, 0x80, 0x06, 0x0=
0, /* 0x10 */
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x00, 0x00, 0x00, 0xff, 0x8f, 0x00, 0x00, 0x=
00,
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x88, 0x88, 0xc0, 0x00, 0x20, 0x64, 0xa8, 0xe=
c, // 0x20
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x88, 0x88, 0xc0, 0x00, 0x20, 0x64, 0xa8, 0xe=
c, /* 0x20 */
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A00x31, 0x75, 0xb9, 0xfd, 0x00, 0x00, 0x88, 0x=
88,
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x88, 0x11, 0x00, 0x88, 0x88, 0x00, =A0 =A0 =
=A0 =A0 =A0 =A0 // 0x30
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x88, 0x11, 0x00, 0x88, 0x88, 0x00, =A0 =A0 =
=A0 =A0 =A0 =A0 /* 0x30 */
=A0 =A0 =A0 =A0};
=A0 =A0 =A0 =A0u8 *tbl_tw2815_common;
=A0 =A0 =A0 =A0int i;
@@ -459,7 +459,7 @@ static int tw2815_setup(struct solo6010_dev
*solo_dev, u8 dev_addr)

=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; i < 0x0f; i++) {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (i =3D 0x00)
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue; =A0=
 =A0 =A0 // read-only
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue; =A0=
 =A0 =A0 /* read-only */
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0solo_i2c_writebyte(solo_dev,=
 SOLO_I2C_TW,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 dev_addr, (ch * 0x10) + i,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 tbl_tw2815_common[i]);
@@ -597,7 +597,7 @@ int solo_tw28_init(struct solo6010_dev *solo_dev)
=A0 =A0 =A0 =A0return 0;
=A0}

-/*
+/*
=A0* We accessed the video status signal in the Techwell chip through
=A0* iic/i2c because the video status reported by register REG_VI_STATUS1
=A0* (address 0x012C) of the SOLO6010 chip doesn't give the correct video
@@ -751,7 +751,7 @@ int tw28_get_ctrl_val(struct solo6010_dev
*solo_dev, u32 ctrl, u8 ch,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0rval =3D tw_readbyte(solo_dev, chip_num,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 TW286x_=
BRIGHTNESS_ADDR(ch),
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 TW_BRIG=
HTNESS_ADDR(ch));
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (is_tw286x(solo_dev, chip_num))
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (is_tw286x(solo_dev, chip_num))
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*val =3D (s32)((char)rval) +=
 128;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*val =3D rval;
diff --git a/drivers/staging/solo6x10/solo6010-v4l2-enc.c
b/drivers/staging/solo6x10/solo6010-v4l2-enc.c
index bbf3d9c..2122f26 100644
--- a/drivers/staging/solo6x10/solo6010-v4l2-enc.c
+++ b/drivers/staging/solo6x10/solo6010-v4l2-enc.c
@@ -488,7 +488,8 @@ static int solo_enc_fillbuf(struct solo_enc_fh *fh,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -1;
=A0 =A0 =A0 =A0}

- =A0 =A0 =A0 if (!(vbuf =3D videobuf_to_dma_contig(vb)))
+ =A0 =A0 =A0 vbuf =3D videobuf_to_dma_contig(vb);
+ =A0 =A0 =A0 if (!vbuf)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -1;

=A0 =A0 =A0 =A0/* Is it ok that we mess with this buffer out of lock? */
@@ -499,7 +500,7 @@ static int solo_enc_fillbuf(struct solo_enc_fh *fh,
=A0 =A0 =A0 =A0else
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D solo_fill_jpeg(fh, enc_buf, vb, vbuf=
);

- =A0 =A0 =A0 if (ret) // Ignore failures
+ =A0 =A0 =A0 if (ret) /* Ignore failures */
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;

=A0 =A0 =A0 =A0list_del(&vb->queue);
@@ -557,7 +558,7 @@ static int solo_enc_thread(void *data)

=A0 =A0 =A0 =A0remove_wait_queue(&solo_enc->thread_wait, &wait);

- =A0 =A0 =A0 =A0return 0;
+ =A0 =A0 =A0 return 0;
=A0}

=A0void solo_motion_isr(struct solo6010_dev *solo_dev)
@@ -614,7 +615,8 @@ void solo_enc_v4l2_isr(struct solo6010_dev *solo_dev)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0jpeg_next =3D solo_reg_read(solo_dev,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0SOLO_VE_JPEG_QUE(solo_dev->enc_idx));

- =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((ch =3D (mpeg_current >> 24) & 0x1f) >=3D=
 SOLO_MAX_CHANNELS) {
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ch =3D (mpeg_current >> 24) & 0x1f;
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ch >=3D SOLO_MAX_CHANNELS) {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ch -=3D SOLO_MAX_CHANNELS;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0enc_type =3D SOLO_ENC_TYPE_E=
XT;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else
@@ -669,12 +671,12 @@ void solo_enc_v4l2_isr(struct solo6010_dev *solo_dev)
=A0static int solo_enc_buf_setup(struct videobuf_queue *vq, unsigned int *c=
ount,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0unsigned int *si=
ze)
=A0{
- =A0 =A0 =A0 =A0*size =3D FRAME_BUF_SIZE;
+ =A0 =A0 =A0 *size =3D FRAME_BUF_SIZE;

- =A0 =A0 =A0 =A0if (*count < MIN_VID_BUFFERS)
+ =A0 =A0 =A0 if (*count < MIN_VID_BUFFERS)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*count =3D MIN_VID_BUFFERS;

- =A0 =A0 =A0 =A0return 0;
+ =A0 =A0 =A0 return 0;
=A0}

=A0static int solo_enc_buf_prepare(struct videobuf_queue *vq,
@@ -750,7 +752,8 @@ static int solo_enc_open(struct file *file)
=A0 =A0 =A0 =A0struct solo_enc_dev *solo_enc =3D video_drvdata(file);
=A0 =A0 =A0 =A0struct solo_enc_fh *fh;

- =A0 =A0 =A0 if ((fh =3D kzalloc(sizeof(*fh), GFP_KERNEL)) =3D NULL)
+ =A0 =A0 =A0 fh =3D kzalloc(sizeof(*fh), GFP_KERNEL);
+ =A0 =A0 =A0 if (fh =3D NULL)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;

=A0 =A0 =A0 =A0spin_lock(&solo_enc->lock);
@@ -785,7 +788,7 @@ static ssize_t solo_enc_read(struct file *file,
char __user *data,

=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0spin_lock(&solo_enc->lock);
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D solo_enc_on(fh);
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock(&solo_enc->lock);
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 spin_unlock(&solo_enc->lock);
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
=A0 =A0 =A0 =A0}
@@ -915,9 +918,8 @@ static int solo_enc_try_fmt_cap(struct file *file,
void *priv,

=A0 =A0 =A0 =A0if (pix->field =3D V4L2_FIELD_ANY)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pix->field =3D V4L2_FIELD_INTERLACED;
- =A0 =A0 =A0 else if (pix->field !=3D V4L2_FIELD_INTERLACED) {
+ =A0 =A0 =A0 else if (pix->field !=3D V4L2_FIELD_INTERLACED)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0pix->field =3D V4L2_FIELD_INTERLACED;
- =A0 =A0 =A0 }

=A0 =A0 =A0 =A0/* Just set these */
=A0 =A0 =A0 =A0pix->colorspace =3D V4L2_COLORSPACE_SMPTE170M;
@@ -937,7 +939,8 @@ static int solo_enc_set_fmt_cap(struct file *file,
void *priv,

=A0 =A0 =A0 =A0spin_lock(&solo_enc->lock);

- =A0 =A0 =A0 if ((ret =3D solo_enc_try_fmt_cap(file, priv, f))) {
+ =A0 =A0 =A0 ret =3D solo_enc_try_fmt_cap(file, priv, f);
+ =A0 =A0 =A0 if (ret) {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0spin_unlock(&solo_enc->lock);
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
=A0 =A0 =A0 =A0}
@@ -977,7 +980,7 @@ static int solo_enc_get_fmt_cap(struct file *file,
void *priv,
=A0 =A0 =A0 =A0return 0;
=A0}

-static int solo_enc_reqbufs(struct file *file, void *priv,
+static int solo_enc_reqbufs(struct file *file, void *priv,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct v4l2_requestb=
uffers *req)
=A0{
=A0 =A0 =A0 =A0struct solo_enc_fh *fh =3D priv;
@@ -1136,7 +1139,7 @@ static int solo_g_parm(struct file *file, void *priv,
=A0 =A0 =A0 =A0/* XXX: Shouldn't we be able to get/set this from videobuf? =
*/
=A0 =A0 =A0 =A0cp->readbuffers =3D 2;

- =A0 =A0 =A0 =A0return 0;
+ =A0 =A0 =A0 return 0;
=A0}

=A0static int solo_s_parm(struct file *file, void *priv,
@@ -1176,7 +1179,7 @@ static int solo_s_parm(struct file *file, void *priv,

=A0 =A0 =A0 =A0spin_unlock(&solo_enc->lock);

- =A0 =A0 =A0 =A0return 0;
+ =A0 =A0 =A0 return 0;
=A0}

=A0static int solo_queryctrl(struct file *file, void *priv,
@@ -1240,7 +1243,7 @@ static int solo_queryctrl(struct file *file, void *pr=
iv,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return 0;
=A0 =A0 =A0 =A0}

- =A0 =A0 =A0 =A0return -EINVAL;
+ =A0 =A0 =A0 return -EINVAL;
=A0}

=A0static int solo_querymenu(struct file *file, void *priv,
@@ -1250,7 +1253,8 @@ static int solo_querymenu(struct file *file, void *pr=
iv,
=A0 =A0 =A0 =A0int err;

=A0 =A0 =A0 =A0qctrl.id =3D qmenu->id;
- =A0 =A0 =A0 if ((err =3D solo_queryctrl(file, priv, &qctrl)))
+ =A0 =A0 =A0 err =3D solo_queryctrl(file, priv, &qctrl);
+ =A0 =A0 =A0 if (err)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return err;

=A0 =A0 =A0 =A0return v4l2_ctrl_query_menu(qmenu, &qctrl, NULL);
@@ -1350,9 +1354,9 @@ static int solo_s_ext_ctrls(struct file *file, void *=
priv,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0switch (ctrl->id) {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case V4L2_CID_RDS_TX_RADIO_TEXT:
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ctrl->size - 1 > OSD_TEX=
T_MAX)
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0err =3D -E=
RANGE;
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D -ERAN=
GE;
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else {
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D copy_=
from_user(solo_enc->osd_text,
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 err =3D copy_=
from_user(solo_enc->osd_text,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ctrl->string,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 OSD_TEXT_MAX);
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0solo_enc->os=
d_text[OSD_TEXT_MAX] =3D '\0';
@@ -1505,7 +1509,7 @@ static struct solo_enc_dev
*solo_enc_alloc(struct solo6010_dev *solo_dev, u8 ch)
=A0 =A0 =A0 =A0atomic_set(&solo_enc->readers, 0);

=A0 =A0 =A0 =A0solo_enc->qp =3D SOLO_DEFAULT_QP;
- =A0 =A0 =A0 =A0solo_enc->gop =3D solo_dev->fps;
+ =A0 =A0 =A0 solo_enc->gop =3D solo_dev->fps;
=A0 =A0 =A0 =A0solo_enc->interval =3D 1;
=A0 =A0 =A0 =A0solo_enc->mode =3D SOLO_ENC_MODE_CIF;
=A0 =A0 =A0 =A0solo_enc->motion_thresh =3D SOLO_DEF_MOT_THRESH;
diff --git a/drivers/staging/solo6x10/solo6010-v4l2.c
b/drivers/staging/solo6x10/solo6010-v4l2.c
index 9731fa0..1340f1d 100644
--- a/drivers/staging/solo6x10/solo6010-v4l2.c
+++ b/drivers/staging/solo6x10/solo6010-v4l2.c
@@ -31,7 +31,7 @@

=A0#define SOLO_HW_BPL =A0 =A0 =A0 =A0 =A0 =A02048
=A0#define SOLO_DISP_PIX_FIELD =A0 =A0V4L2_FIELD_INTERLACED
-#define SOLO_DISP_BUF_SIZE =A0 =A0 (64 * 1024) // 64k
+#define SOLO_DISP_BUF_SIZE =A0 =A0 (64 * 1024) /* 64k */

=A0/* Image size is two fields, SOLO_HW_BPL is one horizontal line */
=A0#define solo_vlines(__solo) =A0 =A0(__solo->video_vsize * 2)
@@ -96,7 +96,7 @@ static void solo_win_setup(struct solo6010_dev
*solo_dev, u8 ch,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SOLO_VI_WIN_EX(ex) |
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SOLO_VI_WIN_SCALE(scale));

- =A0 =A0 =A0 =A0solo_reg_write(solo_dev, SOLO_VI_WIN_CTRL1(ch),
+ =A0 =A0 =A0 solo_reg_write(solo_dev, SOLO_VI_WIN_CTRL1(ch),
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SOLO_VI_WIN_SY(sy) |
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 SOLO_VI_WIN_EY(ey));
=A0}
@@ -213,7 +213,8 @@ static void solo_fillbuf(struct solo_filehandle *fh,
=A0 =A0 =A0 =A0int error =3D 1;
=A0 =A0 =A0 =A0int i;

- =A0 =A0 =A0 if (!(vbuf =3D videobuf_to_dma_contig(vb)))
+ =A0 =A0 =A0 vbuf =3D videobuf_to_dma_contig(vb)
+ =A0 =A0 =A0 if (!vbuf)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto finish_buf;

=A0 =A0 =A0 =A0if (erase_off(solo_dev)) {
@@ -310,7 +311,7 @@ static int solo_thread(void *data)

=A0 =A0 =A0 =A0remove_wait_queue(&solo_dev->disp_thread_wait, &wait);

- =A0 =A0 =A0 =A0return 0;
+ =A0 =A0 =A0 return 0;
=A0}

=A0static int solo_start_thread(struct solo_filehandle *fh)
@@ -337,12 +338,12 @@ static int solo_buf_setup(struct videobuf_queue
*vq, unsigned int *count,
=A0 =A0 =A0 =A0struct solo_filehandle *fh =3D vq->priv_data;
=A0 =A0 =A0 =A0struct solo6010_dev *solo_dev =A0=3D fh->solo_dev;

- =A0 =A0 =A0 =A0*size =3D solo_image_size(solo_dev);
+ =A0 =A0 =A0 *size =3D solo_image_size(solo_dev);

- =A0 =A0 =A0 =A0if (*count < MIN_VID_BUFFERS)
+ =A0 =A0 =A0 if (*count < MIN_VID_BUFFERS)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*count =3D MIN_VID_BUFFERS;

- =A0 =A0 =A0 =A0return 0;
+ =A0 =A0 =A0 return 0;
=A0}

=A0static int solo_buf_prepare(struct videobuf_queue *vq,
@@ -404,7 +405,7 @@ static unsigned int solo_v4l2_poll(struct file *file,
=A0{
=A0 =A0 =A0 =A0struct solo_filehandle *fh =3D file->private_data;

- =A0 =A0 =A0 =A0return videobuf_poll_stream(file, &fh->vidq, wait);
+ =A0 =A0 =A0 return videobuf_poll_stream(file, &fh->vidq, wait);
=A0}

=A0static int solo_v4l2_mmap(struct file *file, struct vm_area_struct *vma)
@@ -420,7 +421,8 @@ static int solo_v4l2_open(struct file *file)
=A0 =A0 =A0 =A0struct solo_filehandle *fh;
=A0 =A0 =A0 =A0int ret;

- =A0 =A0 =A0 if ((fh =3D kzalloc(sizeof(*fh), GFP_KERNEL)) =3D NULL)
+ =A0 =A0 =A0 fh =3D kzalloc(sizeof(*fh), GFP_KERNEL);
+ =A0 =A0 =A0 if (fh =3D NULL)
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOMEM;

=A0 =A0 =A0 =A0spin_lock_init(&fh->slock);
@@ -428,7 +430,8 @@ static int solo_v4l2_open(struct file *file)
=A0 =A0 =A0 =A0fh->solo_dev =3D solo_dev;
=A0 =A0 =A0 =A0file->private_data =3D fh;

- =A0 =A0 =A0 if ((ret =3D solo_start_thread(fh))) {
+ =A0 =A0 =A0 ret =3D solo_start_thread(fh);
+ =A0 =A0 =A0 if (ret) {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(fh);
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return ret;
=A0 =A0 =A0 =A0}
@@ -622,7 +625,7 @@ static int solo_get_fmt_cap(struct file *file, void *pr=
iv,
=A0 =A0 =A0 =A0return 0;
=A0}

-static int solo_reqbufs(struct file *file, void *priv,
+static int solo_reqbufs(struct file *file, void *priv,
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct v4l2_requestbuffers *=
req)
=A0{
=A0 =A0 =A0 =A0struct solo_filehandle *fh =3D priv;
@@ -781,11 +784,11 @@ static const struct v4l2_ioctl_ops solo_v4l2_ioctl_op=
s =3D {
=A0 =A0 =A0 =A0.vidioc_qbuf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D solo=
_qbuf,
=A0 =A0 =A0 =A0.vidioc_dqbuf =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D solo_d=
qbuf,
=A0 =A0 =A0 =A0.vidioc_streamon =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D solo_str=
eamon,
- =A0 =A0 =A0 =A0.vidioc_streamoff =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D solo_stre=
amoff,
+ =A0 =A0 =A0 .vidioc_streamoff =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D solo_stream=
off,
=A0 =A0 =A0 =A0/* Controls */
=A0 =A0 =A0 =A0.vidioc_queryctrl =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D solo_disp_=
queryctrl,
- =A0 =A0 =A0 =A0.vidioc_g_ctrl =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D solo_di=
sp_g_ctrl,
- =A0 =A0 =A0 =A0.vidioc_s_ctrl =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D solo_di=
sp_s_ctrl,
+ =A0 =A0 =A0 .vidioc_g_ctrl =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D solo_di=
sp_g_ctrl,
+ =A0 =A0 =A0 .vidioc_s_ctrl =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D solo_di=
sp_s_ctrl,
=A0};

=A0static struct video_device solo_v4l2_template =3D {
@@ -836,13 +839,13 @@ int solo_v4l2_init(struct solo6010_dev *solo_dev)
=A0 =A0 =A0 =A0for (i =3D 0; i < solo_dev->nr_chans; i++) {
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0solo_v4l2_set_ch(solo_dev, i);
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0while (erase_off(solo_dev))
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;// Do nothing
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;/* Do nothing */
=A0 =A0 =A0 =A0}

=A0 =A0 =A0 =A0/* Set the default display channel */
=A0 =A0 =A0 =A0solo_v4l2_set_ch(solo_dev, 0);
=A0 =A0 =A0 =A0while (erase_off(solo_dev))
- =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;// Do nothing
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;/* Do nothing */

=A0 =A0 =A0 =A0solo6010_irq_on(solo_dev, SOLO_IRQ_VIDEO_IN);

diff --git a/drivers/staging/solo6x10/solo6010.h
b/drivers/staging/solo6x10/solo6010.h
index dca8e3e..4374c59 100644
--- a/drivers/staging/solo6x10/solo6010.h
+++ b/drivers/staging/solo6x10/solo6010.h
@@ -64,7 +64,7 @@
=A0#define SOLO6010_VER_MINOR =A0 =A0 =A0 =A0 =A0 =A0 0
=A0#define SOLO6010_VER_SUB =A0 =A0 =A0 =A0 =A0 =A0 =A0 0
=A0#define SOLO6010_VER_NUM \
- =A0 =A0KERNEL_VERSION(SOLO6010_VER_MAJOR, SOLO6010_VER_MINOR, SOLO6010_VE=
R_SUB)
+ =A0 =A0 =A0 KERNEL_VERSION(SOLO6010_VER_MAJOR, SOLO6010_VER_MINOR, SOLO60=
10_VER_SUB)

=A0/*
=A0* The SOLO6010 actually has 8 i2c channels, but we only use 2.
@@ -212,7 +212,7 @@ struct solo6010_dev {
=A0 =A0 =A0 =A0struct solo_enc_buf =A0 =A0 enc_buf[SOLO_NR_RING_BUFS];

=A0 =A0 =A0 =A0/* Current video settings */
- =A0 =A0 =A0 u32 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 video_type;
+ =A0 =A0 =A0 u32 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 video_type;
=A0 =A0 =A0 =A0u16 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 video_hsize, vid=
eo_vsize;
=A0 =A0 =A0 =A0u16 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vout_hstart, vou=
t_vstart;
=A0 =A0 =A0 =A0u16 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vin_hstart, vin_=
vstart;
--
1.7.0.4
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
