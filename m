From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 19 Feb 2018 18:11:56 +0000
Subject: [PATCH v2] [media] Use common error handling code in 20 functions
Message-Id: <227d2d7c-5aee-1190-1624-26596a048d9c@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-media@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>, Andi Shyti <andi.shyti@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Andrey Utkin <andrey_utkin@fastmail.com>, Arvind Yadav <arvind.yadav.cs@gmail.com>, Bhumika Goyal <bhumirks@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Brian Johnson <brijohn@gmail.com>, =?UTF-8?Q?Christoph_B=c3=b6hmwalder?= <christoph@boehmwalder.at>, Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Colin Ian King <colin.king@canonical.com>, Daniele Nicolodi <daniele@grinta.net>, =?UTF-8?Q?David_H=c3=a4rdeman?= <david@hardeman.nu>, Devendra Sharma <devendra.sharma9091@gmail.com>, "Gustavo A. R. Silva" <garsilva@embeddedor.com>, Hans Verkuil <hans.verkuil@cisco.com>, Inki Dae <inki.dae@samsung.com>, Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Max Kellermann <max.kellermann@gmail.com>, Mike Isely <isely@pobox.com>, Philippe Ombredanne <pombredanne@nexb.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Santosh Kumar Singh <kumar.san1093@gmail.com>, Satendra Singh Thakur <satendra.t@samsung.com>, Sean Young <sean@mess.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, Shyam Saini <mayhs11saini@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, Todor Tomov <todor.tomov@linaro.org>, Wei Yongjun <weiyongjun1@huawei.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 19 Feb 2018 18:50:40 +0100

Adjust jump targets so that a bit of exception handling can be better
reused at the end of these functions.

This issue was partly detected by using the Coccinelle software.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---

v2:
Hans Verkuil insisted on patch squashing. Thus several changes
were recombined based on source files from Linux next-20180216.

The implementation of the function "tda8261_set_params" was improved
after a notification by Christoph B=C3=B6hmwalder on 2017-09-26.

 drivers/media/dvb-core/dmxdev.c                    | 16 ++++----
 drivers/media/dvb-frontends/tda1004x.c             | 20 ++++++----
 drivers/media/dvb-frontends/tda8261.c              | 19 ++++++----
 drivers/media/pci/bt8xx/dst.c                      | 19 ++++++----
 drivers/media/pci/bt8xx/dst_ca.c                   | 30 +++++++--------
 drivers/media/pci/cx88/cx88-input.c                | 17 +++++----
 drivers/media/platform/omap3isp/ispvideo.c         | 29 +++++++--------
 .../media/platform/qcom/camss-8x16/camss-csid.c    | 20 +++++-----
 drivers/media/tuners/tuner-xc2028.c                | 30 +++++++--------
 drivers/media/usb/cpia2/cpia2_usb.c                | 13 ++++---
 drivers/media/usb/gspca/gspca.c                    | 17 +++++----
 drivers/media/usb/gspca/sn9c20x.c                  | 17 +++++----
 drivers/media/usb/pvrusb2/pvrusb2-ioread.c         | 10 +++--
 drivers/media/usb/tm6000/tm6000-cards.c            |  7 ++--
 drivers/media/usb/tm6000/tm6000-dvb.c              | 11 ++++--
 drivers/media/usb/tm6000/tm6000-video.c            | 13 ++++---
 drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c  | 13 +++----
 drivers/media/usb/ttusb-dec/ttusb_dec.c            | 43 ++++++++----------=
----
 drivers/media/usb/uvc/uvc_v4l2.c                   | 13 ++++---
 19 files changed, 180 insertions(+), 177 deletions(-)

diff --git a/drivers/media/dvb-core/dmxdev.c b/drivers/media/dvb-core/dmxde=
v.c
index 6d53af00190e..6a0411c91195 100644
--- a/drivers/media/dvb-core/dmxdev.c
+++ b/drivers/media/dvb-core/dmxdev.c
@@ -645,18 +645,18 @@ static int dvb_dmxdev_start_feed(struct dmxdev *dmxde=
v,
 	tsfeed->priv =3D filter;
=20
 	ret =3D tsfeed->set(tsfeed, feed->pid, ts_type, ts_pes, timeout);
-	if (ret < 0) {
-		dmxdev->demux->release_ts_feed(dmxdev->demux, tsfeed);
-		return ret;
-	}
+	if (ret < 0)
+		goto release_feed;
=20
 	ret =3D tsfeed->start_filtering(tsfeed);
-	if (ret < 0) {
-		dmxdev->demux->release_ts_feed(dmxdev->demux, tsfeed);
-		return ret;
-	}
+	if (ret < 0)
+		goto release_feed;
=20
 	return 0;
+
+release_feed:
+	dmxdev->demux->release_ts_feed(dmxdev->demux, tsfeed);
+	return ret;
 }
=20
 static int dvb_dmxdev_filter_start(struct dmxdev_filter *filter)
diff --git a/drivers/media/dvb-frontends/tda1004x.c b/drivers/media/dvb-fro=
ntends/tda1004x.c
index 58e3beff5adc..85ca111fc8c4 100644
--- a/drivers/media/dvb-frontends/tda1004x.c
+++ b/drivers/media/dvb-frontends/tda1004x.c
@@ -1299,20 +1299,22 @@ struct dvb_frontend* tda10045_attach(const struct t=
da1004x_config* config,
 	id =3D tda1004x_read_byte(state, TDA1004X_CHIPID);
 	if (id < 0) {
 		printk(KERN_ERR "tda10045: chip is not answering. Giving up.\n");
-		kfree(state);
-		return NULL;
+		goto free_state;
 	}
=20
 	if (id !=3D 0x25) {
 		printk(KERN_ERR "Invalid tda1004x ID =3D 0x%02x. Can't proceed\n", id);
-		kfree(state);
-		return NULL;
+		goto free_state;
 	}
=20
 	/* create dvb_frontend */
 	memcpy(&state->frontend.ops, &tda10045_ops, sizeof(struct dvb_frontend_op=
s));
 	state->frontend.demodulator_priv =3D state;
 	return &state->frontend;
+
+free_state:
+	kfree(state);
+	return NULL;
 }
=20
 static const struct dvb_frontend_ops tda10046_ops =3D {
@@ -1369,19 +1371,21 @@ struct dvb_frontend* tda10046_attach(const struct t=
da1004x_config* config,
 	id =3D tda1004x_read_byte(state, TDA1004X_CHIPID);
 	if (id < 0) {
 		printk(KERN_ERR "tda10046: chip is not answering. Giving up.\n");
-		kfree(state);
-		return NULL;
+		goto free_state;
 	}
 	if (id !=3D 0x46) {
 		printk(KERN_ERR "Invalid tda1004x ID =3D 0x%02x. Can't proceed\n", id);
-		kfree(state);
-		return NULL;
+		goto free_state;
 	}
=20
 	/* create dvb_frontend */
 	memcpy(&state->frontend.ops, &tda10046_ops, sizeof(struct dvb_frontend_op=
s));
 	state->frontend.demodulator_priv =3D state;
 	return &state->frontend;
+
+free_state:
+	kfree(state);
+	return NULL;
 }
=20
 module_param(debug, int, 0644);
diff --git a/drivers/media/dvb-frontends/tda8261.c b/drivers/media/dvb-fron=
tends/tda8261.c
index f72a54e7eb23..7b9a29939b74 100644
--- a/drivers/media/dvb-frontends/tda8261.c
+++ b/drivers/media/dvb-frontends/tda8261.c
@@ -129,18 +129,17 @@ static int tda8261_set_params(struct dvb_frontend *fe)
=20
 	/* Set params */
 	err =3D tda8261_write(state, buf);
-	if (err < 0) {
-		pr_err("%s: I/O Error\n", __func__);
-		return err;
-	}
+	if (err < 0)
+		goto report_failure;
+
 	/* sleep for some time */
 	pr_debug("%s: Waiting to Phase LOCK\n", __func__);
 	msleep(20);
 	/* check status */
-	if ((err =3D tda8261_get_status(fe, &status)) < 0) {
-		pr_err("%s: I/O Error\n", __func__);
-		return err;
-	}
+	err =3D tda8261_get_status(fe, &status);
+	if (err < 0)
+		goto report_failure;
+
 	if (status =3D 1) {
 		pr_debug("%s: Tuner Phase locked: status=3D%d\n", __func__,
 			 status);
@@ -150,6 +149,10 @@ static int tda8261_set_params(struct dvb_frontend *fe)
 	}
=20
 	return 0;
+
+report_failure:
+	pr_err("%s: I/O Error\n", __func__);
+	return err;
 }
=20
 static void tda8261_release(struct dvb_frontend *fe)
diff --git a/drivers/media/pci/bt8xx/dst.c b/drivers/media/pci/bt8xx/dst.c
index 4f0bba9e4c48..7014cb6a0ad6 100644
--- a/drivers/media/pci/bt8xx/dst.c
+++ b/drivers/media/pci/bt8xx/dst.c
@@ -134,17 +134,20 @@ EXPORT_SYMBOL(rdc_reset_state);
 static int rdc_8820_reset(struct dst_state *state)
 {
 	dprintk(3, "Resetting DST\n");
-	if (dst_gpio_outb(state, RDC_8820_RESET, RDC_8820_RESET, 0, NO_DELAY) < 0=
) {
-		pr_err("dst_gpio_outb ERROR !\n");
-		return -1;
-	}
+	if (dst_gpio_outb(state, RDC_8820_RESET, RDC_8820_RESET, 0, NO_DELAY)
+	    < 0)
+		goto report_failure;
+
 	udelay(1000);
-	if (dst_gpio_outb(state, RDC_8820_RESET, RDC_8820_RESET, RDC_8820_RESET, =
DELAY) < 0) {
-		pr_err("dst_gpio_outb ERROR !\n");
-		return -1;
-	}
+	if (dst_gpio_outb(state, RDC_8820_RESET, RDC_8820_RESET,
+			  RDC_8820_RESET, DELAY) < 0)
+		goto report_failure;
=20
 	return 0;
+
+report_failure:
+	pr_err("dst_gpio_outb ERROR !\n");
+	return -1;
 }
=20
 static int dst_pio_enable(struct dst_state *state)
diff --git a/drivers/media/pci/bt8xx/dst_ca.c b/drivers/media/pci/bt8xx/dst=
_ca.c
index 0a7623c0fc8e..26e05a8457e6 100644
--- a/drivers/media/pci/bt8xx/dst_ca.c
+++ b/drivers/media/pci/bt8xx/dst_ca.c
@@ -83,33 +83,33 @@ static int dst_ci_command(struct dst_state* state, u8 *=
 data, u8 *ca_string, u8
=20
 	if (write_dst(state, data, len)) {
 		dprintk(verbose, DST_CA_INFO, 1, " Write not successful, trying to recov=
er");
-		dst_error_recovery(state);
-		goto error;
+		goto error_recovery;
 	}
 	if ((dst_pio_disable(state)) < 0) {
 		dprintk(verbose, DST_CA_ERROR, 1, " DST PIO disable failed.");
-		goto error;
-	}
-	if (read_dst(state, &reply, GET_ACK) < 0) {
-		dprintk(verbose, DST_CA_INFO, 1, " Read not successful, trying to recove=
r");
-		dst_error_recovery(state);
-		goto error;
+		goto unlock;
 	}
+	if (read_dst(state, &reply, GET_ACK) < 0)
+		goto report_read_failure;
+
 	if (read) {
 		if (! dst_wait_dst_ready(state, LONG_DELAY)) {
 			dprintk(verbose, DST_CA_NOTICE, 1, " 8820 not ready");
-			goto error;
-		}
-		if (read_dst(state, ca_string, 128) < 0) {	/*	Try to make this dynamic	*/
-			dprintk(verbose, DST_CA_INFO, 1, " Read not successful, trying to recov=
er");
-			dst_error_recovery(state);
-			goto error;
+			goto unlock;
 		}
+		/* Try to make this dynamic */
+		if (read_dst(state, ca_string, 128) < 0)
+			goto report_read_failure;
 	}
 	mutex_unlock(&state->dst_mutex);
 	return 0;
=20
-error:
+report_read_failure:
+	dprintk(verbose, DST_CA_INFO, 1,
+		" Read not successful, trying to recover");
+error_recovery:
+	dst_error_recovery(state);
+unlock:
 	mutex_unlock(&state->dst_mutex);
 	return -EIO;
 }
diff --git a/drivers/media/pci/cx88/cx88-input.c b/drivers/media/pci/cx88/c=
x88-input.c
index 4e9953e61a12..c972efcd6bb6 100644
--- a/drivers/media/pci/cx88/cx88-input.c
+++ b/drivers/media/pci/cx88/cx88-input.c
@@ -566,20 +566,17 @@ static int get_key_pvr2000(struct IR_i2c *ir, enum rc=
_proto *protocol,
=20
 	/* poll IR chip */
 	flags =3D i2c_smbus_read_byte_data(ir->c, 0x10);
-	if (flags < 0) {
-		dprintk("read error\n");
-		return 0;
-	}
+	if (flags < 0)
+		goto report_read_failure;
+
 	/* key pressed ? */
 	if (0 =3D (flags & 0x80))
 		return 0;
=20
 	/* read actual key code */
 	code =3D i2c_smbus_read_byte_data(ir->c, 0x00);
-	if (code < 0) {
-		dprintk("read error\n");
-		return 0;
-	}
+	if (code < 0)
+		goto report_read_failure;
=20
 	dprintk("IR Key/Flags: (0x%02x/0x%02x)\n",
 		code & 0xff, flags & 0xff);
@@ -588,6 +585,10 @@ static int get_key_pvr2000(struct IR_i2c *ir, enum rc_=
proto *protocol,
 	*scancode =3D code & 0xff;
 	*toggle =3D 0;
 	return 1;
+
+report_read_failure:
+	dprintk("read error\n");
+	return 0;
 }
=20
 void cx88_i2c_init_ir(struct cx88_core *core)
diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/pla=
tform/omap3isp/ispvideo.c
index a751c89a3ea8..2ddcac736402 100644
--- a/drivers/media/platform/omap3isp/ispvideo.c
+++ b/drivers/media/platform/omap3isp/ispvideo.c
@@ -1315,14 +1315,12 @@ static int isp_video_open(struct file *file)
 	/* If this is the first user, initialise the pipeline. */
 	if (omap3isp_get(video->isp) =3D NULL) {
 		ret =3D -EBUSY;
-		goto done;
+		goto delete_fh;
 	}
=20
 	ret =3D v4l2_pipeline_pm_use(&video->video.entity, 1);
-	if (ret < 0) {
-		omap3isp_put(video->isp);
-		goto done;
-	}
+	if (ret < 0)
+		goto put_isp;
=20
 	queue =3D &handle->queue;
 	queue->type =3D video->type;
@@ -1335,10 +1333,8 @@ static int isp_video_open(struct file *file)
 	queue->dev =3D video->isp->dev;
=20
 	ret =3D vb2_queue_init(&handle->queue);
-	if (ret < 0) {
-		omap3isp_put(video->isp);
-		goto done;
-	}
+	if (ret < 0)
+		goto put_isp;
=20
 	memset(&handle->format, 0, sizeof(handle->format));
 	handle->format.type =3D video->type;
@@ -1346,14 +1342,15 @@ static int isp_video_open(struct file *file)
=20
 	handle->video =3D video;
 	file->private_data =3D &handle->vfh;
+	goto exit;
=20
-done:
-	if (ret < 0) {
-		v4l2_fh_del(&handle->vfh);
-		v4l2_fh_exit(&handle->vfh);
-		kfree(handle);
-	}
-
+put_isp:
+	omap3isp_put(video->isp);
+delete_fh:
+	v4l2_fh_del(&handle->vfh);
+	v4l2_fh_exit(&handle->vfh);
+	kfree(handle);
+exit:
 	return ret;
 }
=20
diff --git a/drivers/media/platform/qcom/camss-8x16/camss-csid.c b/drivers/=
media/platform/qcom/camss-8x16/camss-csid.c
index 64df82817de3..92d4dc6b4a66 100644
--- a/drivers/media/platform/qcom/camss-8x16/camss-csid.c
+++ b/drivers/media/platform/qcom/camss-8x16/camss-csid.c
@@ -328,16 +328,12 @@ static int csid_set_power(struct v4l2_subdev *sd, int=
 on)
 			return ret;
=20
 		ret =3D csid_set_clock_rates(csid);
-		if (ret < 0) {
-			regulator_disable(csid->vdda);
-			return ret;
-		}
+		if (ret < 0)
+			goto disable_regulator;
=20
 		ret =3D camss_enable_clocks(csid->nclocks, csid->clock, dev);
-		if (ret < 0) {
-			regulator_disable(csid->vdda);
-			return ret;
-		}
+		if (ret < 0)
+			goto disable_regulator;
=20
 		enable_irq(csid->irq);
=20
@@ -345,8 +341,7 @@ static int csid_set_power(struct v4l2_subdev *sd, int o=
n)
 		if (ret < 0) {
 			disable_irq(csid->irq);
 			camss_disable_clocks(csid->nclocks, csid->clock);
-			regulator_disable(csid->vdda);
-			return ret;
+			goto disable_regulator;
 		}
=20
 		hw_version =3D readl_relaxed(csid->base + CAMSS_CSID_HW_VERSION);
@@ -357,6 +352,11 @@ static int csid_set_power(struct v4l2_subdev *sd, int =
on)
 		ret =3D regulator_disable(csid->vdda);
 	}
=20
+	goto exit;
+
+disable_regulator:
+	regulator_disable(csid->vdda);
+exit:
 	return ret;
 }
=20
diff --git a/drivers/media/tuners/tuner-xc2028.c b/drivers/media/tuners/tun=
er-xc2028.c
index fca85e08ebd7..2199b04c0ba9 100644
--- a/drivers/media/tuners/tuner-xc2028.c
+++ b/drivers/media/tuners/tuner-xc2028.c
@@ -571,7 +571,7 @@ static int load_firmware(struct dvb_frontend *fe, unsig=
ned int type,
 		/* Checks if there's enough bytes to read */
 		if (p + sizeof(size) > endp) {
 			tuner_err("Firmware chunk size is wrong\n");
-			return -EINVAL;
+			goto e_inval;
 		}
=20
 		size =3D le16_to_cpu(*(__le16 *) p);
@@ -583,28 +583,23 @@ static int load_firmware(struct dvb_frontend *fe, uns=
igned int type,
 		if (!size) {
 			/* Special callback command received */
 			rc =3D do_tuner_callback(fe, XC2028_TUNER_RESET, 0);
-			if (rc < 0) {
-				tuner_err("Error at RESET code %d\n",
-					   (*p) & 0x7f);
-				return -EINVAL;
-			}
+			if (rc < 0)
+				goto report_failure;
+
 			continue;
 		}
 		if (size >=3D 0xff00) {
 			switch (size) {
 			case 0xff00:
 				rc =3D do_tuner_callback(fe, XC2028_RESET_CLK, 0);
-				if (rc < 0) {
-					tuner_err("Error at RESET code %d\n",
-						  (*p) & 0x7f);
-					return -EINVAL;
-				}
+				if (rc < 0)
+					goto report_failure;
+
 				break;
 			default:
 				tuner_info("Invalid RESET code %d\n",
 					   size & 0x7f);
-				return -EINVAL;
-
+				goto e_inval;
 			}
 			continue;
 		}
@@ -618,7 +613,7 @@ static int load_firmware(struct dvb_frontend *fe, unsig=
ned int type,
 		if ((size + p > endp)) {
 			tuner_err("missing bytes: need %d, have %d\n",
 				   size, (int)(endp - p));
-			return -EINVAL;
+			goto e_inval;
 		}
=20
 		buf[0] =3D *p;
@@ -635,7 +630,7 @@ static int load_firmware(struct dvb_frontend *fe, unsig=
ned int type,
 			rc =3D i2c_send(priv, buf, len + 1);
 			if (rc < 0) {
 				tuner_err("%d returned from send\n", rc);
-				return -EINVAL;
+				goto e_inval;
 			}
=20
 			p +=3D len;
@@ -650,6 +645,11 @@ static int load_firmware(struct dvb_frontend *fe, unsi=
gned int type,
 		}
 	}
 	return 0;
+
+report_failure:
+	tuner_err("Error at RESET code %d\n", (*p) & 0x7f);
+e_inval:
+	return -EINVAL;
 }
=20
 static int load_scode(struct dvb_frontend *fe, unsigned int type,
diff --git a/drivers/media/usb/cpia2/cpia2_usb.c b/drivers/media/usb/cpia2/=
cpia2_usb.c
index f3a1e5b1e57c..c6eaecbac831 100644
--- a/drivers/media/usb/cpia2/cpia2_usb.c
+++ b/drivers/media/usb/cpia2/cpia2_usb.c
@@ -848,15 +848,13 @@ static int cpia2_usb_probe(struct usb_interface *intf,
 	ret =3D set_alternate(cam, USBIF_CMDONLY);
 	if (ret < 0) {
 		ERR("%s: usb_set_interface error (ret =3D %d)\n", __func__, ret);
-		kfree(cam);
-		return ret;
+		goto free_data;
 	}
=20
=20
 	if((ret =3D cpia2_init_camera(cam)) < 0) {
 		ERR("%s: failed to initialize cpia2 camera (ret =3D %d)\n", __func__, re=
t);
-		kfree(cam);
-		return ret;
+		goto free_data;
 	}
 	LOG("  CPiA Version: %d.%02d (%d.%d)\n",
 	       cam->params.version.firmware_revision_hi,
@@ -876,11 +874,14 @@ static int cpia2_usb_probe(struct usb_interface *intf,
 	ret =3D cpia2_register_camera(cam);
 	if (ret < 0) {
 		ERR("%s: Failed to register cpia2 camera (ret =3D %d)\n", __func__, ret);
-		kfree(cam);
-		return ret;
+		goto free_data;
 	}
=20
 	return 0;
+
+free_data:
+	kfree(cam);
+	return ret;
 }
=20
 /*************************************************************************=
*****
diff --git a/drivers/media/usb/gspca/gspca.c b/drivers/media/usb/gspca/gspc=
a.c
index d29773b8f696..7ca44e109a69 100644
--- a/drivers/media/usb/gspca/gspca.c
+++ b/drivers/media/usb/gspca/gspca.c
@@ -907,10 +907,8 @@ static int gspca_init_transfer(struct gspca_dev *gspca=
_dev)
 			ret =3D create_urbs(gspca_dev,
 				alt_xfer(&intf->altsetting[alt], xfer,
 					 gspca_dev->xfer_ep));
-			if (ret < 0) {
-				destroy_urbs(gspca_dev);
-				goto out;
-			}
+			if (ret < 0)
+				goto destroy_urbs;
 		}
=20
 		/* clear the bulk endpoint */
@@ -920,10 +918,9 @@ static int gspca_init_transfer(struct gspca_dev *gspca=
_dev)
=20
 		/* start the cam */
 		ret =3D gspca_dev->sd_desc->start(gspca_dev);
-		if (ret < 0) {
-			destroy_urbs(gspca_dev);
-			goto out;
-		}
+		if (ret < 0)
+			goto destroy_urbs;
+
 		gspca_dev->streaming =3D 1;
 		v4l2_ctrl_handler_setup(gspca_dev->vdev.ctrl_handler);
=20
@@ -974,6 +971,10 @@ static int gspca_init_transfer(struct gspca_dev *gspca=
_dev)
 out:
 	gspca_input_create_urb(gspca_dev);
 	return ret;
+
+destroy_urbs:
+	destroy_urbs(gspca_dev);
+	goto out;
 }
=20
 static void gspca_set_default_mode(struct gspca_dev *gspca_dev)
diff --git a/drivers/media/usb/gspca/sn9c20x.c b/drivers/media/usb/gspca/sn=
9c20x.c
index cfa2a04d9f3f..06ec3a3253e1 100644
--- a/drivers/media/usb/gspca/sn9c20x.c
+++ b/drivers/media/usb/gspca/sn9c20x.c
@@ -1788,10 +1788,8 @@ static int sd_init(struct gspca_dev *gspca_dev)
 	for (i =3D 0; i < ARRAY_SIZE(bridge_init); i++) {
 		value =3D bridge_init[i][1];
 		reg_w(gspca_dev, bridge_init[i][0], &value, 1);
-		if (gspca_dev->usb_err < 0) {
-			pr_err("Device initialization failed\n");
-			return gspca_dev->usb_err;
-		}
+		if (gspca_dev->usb_err < 0)
+			goto report_failure;
 	}
=20
 	if (sd->flags & LED_REVERSE)
@@ -1800,10 +1798,8 @@ static int sd_init(struct gspca_dev *gspca_dev)
 		reg_w1(gspca_dev, 0x1006, 0x20);
=20
 	reg_w(gspca_dev, 0x10c0, i2c_init, 9);
-	if (gspca_dev->usb_err < 0) {
-		pr_err("Device initialization failed\n");
-		return gspca_dev->usb_err;
-	}
+	if (gspca_dev->usb_err < 0)
+		goto report_failure;
=20
 	switch (sd->sensor) {
 	case SENSOR_OV9650:
@@ -1869,6 +1865,11 @@ static int sd_init(struct gspca_dev *gspca_dev)
 		pr_err("Unsupported sensor\n");
 		gspca_dev->usb_err =3D -ENODEV;
 	}
+	goto exit;
+
+report_failure:
+	pr_err("Device initialization failed\n");
+exit:
 	return gspca_dev->usb_err;
 }
=20
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-ioread.c b/drivers/media/usb=
/pvrusb2/pvrusb2-ioread.c
index 602097bdcf14..0218614ce988 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-ioread.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-ioread.c
@@ -266,8 +266,7 @@ static int pvr2_ioread_get_buffer(struct pvr2_ioread *c=
p)
 				pvr2_trace(PVR2_TRACE_DATA_FLOW,
 					   "/*---TRACE_READ---*/ pvr2_ioread_read id=3D%p queue_error=3D%d",
 					   cp,stat);
-				pvr2_ioread_stop(cp);
-				return 0;
+				goto stop_read;
 			}
 			cp->c_buf =3D NULL;
 			cp->c_data_ptr =3D NULL;
@@ -286,9 +285,8 @@ static int pvr2_ioread_get_buffer(struct pvr2_ioread *c=
p)
 				pvr2_trace(PVR2_TRACE_DATA_FLOW,
 					   "/*---TRACE_READ---*/ pvr2_ioread_read id=3D%p buffer_error=3D%d",
 					   cp,stat);
-				pvr2_ioread_stop(cp);
 				// Give up.
-				return 0;
+				goto stop_read;
 			}
 			// Start over...
 			continue;
@@ -298,6 +296,10 @@ static int pvr2_ioread_get_buffer(struct pvr2_ioread *=
cp)
 			pvr2_buffer_get_id(cp->c_buf)];
 	}
 	return !0;
+
+stop_read:
+	pvr2_ioread_stop(cp);
+	return 0;
 }
=20
 static void pvr2_ioread_filter(struct pvr2_ioread *cp)
diff --git a/drivers/media/usb/tm6000/tm6000-cards.c b/drivers/media/usb/tm=
6000/tm6000-cards.c
index 4d5f4cc4887e..e5c376a6495a 100644
--- a/drivers/media/usb/tm6000/tm6000-cards.c
+++ b/drivers/media/usb/tm6000/tm6000-cards.c
@@ -861,15 +861,14 @@ int tm6000_cards_setup(struct tm6000_core *dev)
 		for (i =3D 0; i < 2; i++) {
 			rc =3D tm6000_set_reg(dev, REQ_03_SET_GET_MCU_PIN,
 						dev->gpio.tuner_reset, 0x00);
-			if (rc < 0) {
-				printk(KERN_ERR "Error %i doing tuner reset\n", rc);
-				return rc;
-			}
+			if (rc < 0)
+				goto report_failure;
=20
 			msleep(10); /* Just to be conservative */
 			rc =3D tm6000_set_reg(dev, REQ_03_SET_GET_MCU_PIN,
 						dev->gpio.tuner_reset, 0x01);
 			if (rc < 0) {
+report_failure:
 				printk(KERN_ERR "Error %i doing tuner reset\n", rc);
 				return rc;
 			}
diff --git a/drivers/media/usb/tm6000/tm6000-dvb.c b/drivers/media/usb/tm60=
00/tm6000-dvb.c
index c811fc6cf48a..7cc5c5aa08c2 100644
--- a/drivers/media/usb/tm6000/tm6000-dvb.c
+++ b/drivers/media/usb/tm6000/tm6000-dvb.c
@@ -134,8 +134,8 @@ static int tm6000_start_stream(struct tm6000_core *dev)
=20
 	dvb->bulk_urb->transfer_buffer =3D kzalloc(size, GFP_KERNEL);
 	if (!dvb->bulk_urb->transfer_buffer) {
-		usb_free_urb(dvb->bulk_urb);
-		return -ENOMEM;
+		ret =3D -ENOMEM;
+		goto free_urb;
 	}
=20
 	usb_fill_bulk_urb(dvb->bulk_urb, dev->udev, pipe,
@@ -160,11 +160,14 @@ static int tm6000_start_stream(struct tm6000_core *de=
v)
 									ret);
=20
 		kfree(dvb->bulk_urb->transfer_buffer);
-		usb_free_urb(dvb->bulk_urb);
-		return ret;
+		goto free_urb;
 	}
=20
 	return 0;
+
+free_urb:
+	usb_free_urb(dvb->bulk_urb);
+	return ret;
 }
=20
 static void tm6000_stop_stream(struct tm6000_core *dev)
diff --git a/drivers/media/usb/tm6000/tm6000-video.c b/drivers/media/usb/tm=
6000/tm6000-video.c
index 8314d3fa9241..7c1d5e259ea3 100644
--- a/drivers/media/usb/tm6000/tm6000-video.c
+++ b/drivers/media/usb/tm6000/tm6000-video.c
@@ -589,10 +589,8 @@ static int tm6000_prepare_isoc(struct tm6000_core *dev)
=20
 	dev->isoc_ctl.transfer_buffer =3D kmalloc(sizeof(void *)*num_bufs,
 				   GFP_KERNEL);
-	if (!dev->isoc_ctl.transfer_buffer) {
-		kfree(dev->isoc_ctl.urb);
-		return -ENOMEM;
-	}
+	if (!dev->isoc_ctl.transfer_buffer)
+		goto free_urb;
=20
 	dprintk(dev, V4L2_DEBUG_QUEUE, "Allocating %d x %d packets (%d bytes) of =
%d bytes each to handle %u size\n",
 		    max_packets, num_bufs, sb_size,
@@ -604,9 +602,8 @@ static int tm6000_prepare_isoc(struct tm6000_core *dev)
=20
 		/* call free, as some buffers might have been allocated */
 		tm6000_free_urb_buffers(dev);
-		kfree(dev->isoc_ctl.urb);
 		kfree(dev->isoc_ctl.transfer_buffer);
-		return -ENOMEM;
+		goto free_urb;
 	}
=20
 	/* allocate urbs and transfer buffers */
@@ -636,6 +633,10 @@ static int tm6000_prepare_isoc(struct tm6000_core *dev)
 	}
=20
 	return 0;
+
+free_urb:
+	kfree(dev->isoc_ctl.urb);
+	return -ENOMEM;
 }
=20
 static int tm6000_start_thread(struct tm6000_core *dev)
diff --git a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c b/drivers/me=
dia/usb/ttusb-budget/dvb-ttusb-budget.c
index eed56895c2b9..b093a843644b 100644
--- a/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
+++ b/drivers/media/usb/ttusb-budget/dvb-ttusb-budget.c
@@ -1665,8 +1665,7 @@ static int ttusb_probe(struct usb_interface *intf, co=
nst struct usb_device_id *i
 	if (result < 0) {
 		dprintk("%s: ttusb_alloc_iso_urbs - failed\n", __func__);
 		mutex_unlock(&ttusb->semi2c);
-		kfree(ttusb);
-		return result;
+		goto err_free_usb;
 	}
=20
 	if (ttusb_init_controller(ttusb))
@@ -1677,11 +1676,9 @@ static int ttusb_probe(struct usb_interface *intf, c=
onst struct usb_device_id *i
 	result =3D dvb_register_adapter(&ttusb->adapter,
 				      "Technotrend/Hauppauge Nova-USB",
 				      THIS_MODULE, &udev->dev, adapter_nr);
-	if (result < 0) {
-		ttusb_free_iso_urbs(ttusb);
-		kfree(ttusb);
-		return result;
-	}
+	if (result < 0)
+		goto err_free_iso_urbs;
+
 	ttusb->adapter.priv =3D ttusb;
=20
 	/* i2c */
@@ -1752,7 +1749,9 @@ static int ttusb_probe(struct usb_interface *intf, co=
nst struct usb_device_id *i
 	i2c_del_adapter(&ttusb->i2c_adap);
 err_unregister_adapter:
 	dvb_unregister_adapter (&ttusb->adapter);
+err_free_iso_urbs:
 	ttusb_free_iso_urbs(ttusb);
+err_free_usb:
 	kfree(ttusb);
 	return result;
 }
diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c b/drivers/media/usb/tt=
usb-dec/ttusb_dec.c
index a8900f5571f7..99095b025859 100644
--- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
+++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
@@ -1498,10 +1498,7 @@ static int ttusb_dec_init_dvb(struct ttusb_dec *dec)
 	if ((result =3D dvb_dmx_init(&dec->demux)) < 0) {
 		printk("%s: dvb_dmx_init failed: error %d\n", __func__,
 		       result);
-
-		dvb_unregister_adapter(&dec->adapter);
-
-		return result;
+		goto unregister_adapter;
 	}
=20
 	dec->dmxdev.filternum =3D 32;
@@ -1511,43 +1508,33 @@ static int ttusb_dec_init_dvb(struct ttusb_dec *dec)
 	if ((result =3D dvb_dmxdev_init(&dec->dmxdev, &dec->adapter)) < 0) {
 		printk("%s: dvb_dmxdev_init failed: error %d\n",
 		       __func__, result);
-
-		dvb_dmx_release(&dec->demux);
-		dvb_unregister_adapter(&dec->adapter);
-
-		return result;
+		goto release_demux;
 	}
=20
 	dec->frontend.source =3D DMX_FRONTEND_0;
=20
-	if ((result =3D dec->demux.dmx.add_frontend(&dec->demux.dmx,
-						  &dec->frontend)) < 0) {
-		printk("%s: dvb_dmx_init failed: error %d\n", __func__,
-		       result);
-
-		dvb_dmxdev_release(&dec->dmxdev);
-		dvb_dmx_release(&dec->demux);
-		dvb_unregister_adapter(&dec->adapter);
-
-		return result;
-	}
+	result =3D dec->demux.dmx.add_frontend(&dec->demux.dmx, &dec->frontend);
+	if (result < 0)
+		goto report_failure;
=20
 	if ((result =3D dec->demux.dmx.connect_frontend(&dec->demux.dmx,
 						      &dec->frontend)) < 0) {
-		printk("%s: dvb_dmx_init failed: error %d\n", __func__,
-		       result);
-
 		dec->demux.dmx.remove_frontend(&dec->demux.dmx, &dec->frontend);
-		dvb_dmxdev_release(&dec->dmxdev);
-		dvb_dmx_release(&dec->demux);
-		dvb_unregister_adapter(&dec->adapter);
-
-		return result;
+		goto report_failure;
 	}
=20
 	dvb_net_init(&dec->adapter, &dec->dvb_net, &dec->demux.dmx);
=20
 	return 0;
+
+report_failure:
+	printk("%s: dvb_dmx_init failed: error %d\n", __func__, result);
+	dvb_dmxdev_release(&dec->dmxdev);
+release_demux:
+	dvb_dmx_release(&dec->demux);
+unregister_adapter:
+	dvb_unregister_adapter(&dec->adapter);
+	return result;
 }
=20
 static void ttusb_dec_exit_dvb(struct ttusb_dec *dec)
diff --git a/drivers/media/usb/uvc/uvc_v4l2.c b/drivers/media/usb/uvc/uvc_v=
4l2.c
index a13ad4e178be..f64c851adea2 100644
--- a/drivers/media/usb/uvc/uvc_v4l2.c
+++ b/drivers/media/usb/uvc/uvc_v4l2.c
@@ -994,10 +994,8 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file, vo=
id *fh,
 			struct v4l2_queryctrl qc =3D { .id =3D ctrl->id };
=20
 			ret =3D uvc_query_v4l2_ctrl(chain, &qc);
-			if (ret < 0) {
-				ctrls->error_idx =3D i;
-				return ret;
-			}
+			if (ret < 0)
+				goto set_index;
=20
 			ctrl->value =3D qc.default_value;
 		}
@@ -1013,14 +1011,17 @@ static int uvc_ioctl_g_ext_ctrls(struct file *file,=
 void *fh,
 		ret =3D uvc_ctrl_get(chain, ctrl);
 		if (ret < 0) {
 			uvc_ctrl_rollback(handle);
-			ctrls->error_idx =3D i;
-			return ret;
+			goto set_index;
 		}
 	}
=20
 	ctrls->error_idx =3D 0;
=20
 	return uvc_ctrl_rollback(handle);
+
+set_index:
+	ctrls->error_idx =3D i;
+	return ret;
 }
=20
 static int uvc_ioctl_s_try_ext_ctrls(struct uvc_fh *handle,
--=20
2.16.1

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
