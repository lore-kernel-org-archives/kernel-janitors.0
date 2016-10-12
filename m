From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 15:13:50 +0000
Subject: [PATCH 32/34] [media] DaVinci-VPIF-Display: Adjust 11 checks for null pointers
Message-Id: <c1f01855-e05c-2435-0fa0-e159b47fa065@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
In-Reply-To: <a99f89f2-a3be-9b5f-95c1-e0912a7d78f3@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-media@vger.kernel.org, Hans Verkuil <hans.verkuil@cisco.com>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 12 Oct 2016 15:40:32 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written =E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 drivers/media/platform/davinci/vpif_display.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/davinci/vpif_display.c b/drivers/media/=
platform/davinci/vpif_display.c
index 3347fa14..fff1ece 100644
--- a/drivers/media/platform/davinci/vpif_display.c
+++ b/drivers/media/platform/davinci/vpif_display.c
@@ -271,10 +271,10 @@ static void vpif_stop_streaming(struct vb2_queue *vq)
 		vb2_buffer_done(&common->cur_frm->vb.vb2_buf,
 				VB2_BUF_STATE_ERROR);
 	} else {
-		if (common->cur_frm !=3D NULL)
+		if (common->cur_frm)
 			vb2_buffer_done(&common->cur_frm->vb.vb2_buf,
 					VB2_BUF_STATE_ERROR);
-		if (common->next_frm !=3D NULL)
+		if (common->next_frm)
 			vb2_buffer_done(&common->next_frm->vb.vb2_buf,
 					VB2_BUF_STATE_ERROR);
 	}
@@ -686,7 +686,7 @@ static int vpif_s_std(struct file *file, void *priv, v4=
l2_std_id std_id)
 	struct v4l2_output output;
 	int ret;
=20
-	if (config->chan_config[ch->channel_id].outputs =3D NULL)
+	if (!config->chan_config[ch->channel_id].outputs)
 		return -ENODATA;
=20
 	chan_cfg =3D &config->chan_config[ch->channel_id];
@@ -732,7 +732,7 @@ static int vpif_g_std(struct file *file, void *priv, v4=
l2_std_id *std)
 	struct vpif_display_chan_config *chan_cfg;
 	struct v4l2_output output;
=20
-	if (config->chan_config[ch->channel_id].outputs =3D NULL)
+	if (!config->chan_config[ch->channel_id].outputs)
 		return -ENODATA;
=20
 	chan_cfg =3D &config->chan_config[ch->channel_id];
@@ -783,11 +783,11 @@ vpif_output_to_subdev(struct vpif_display_config *vpi=
f_cfg,
=20
 	vpif_dbg(2, debug, "vpif_output_to_subdev\n");
=20
-	if (chan_cfg->outputs =3D NULL)
+	if (!chan_cfg->outputs)
 		return -1;
=20
 	subdev_name =3D chan_cfg->outputs[index].subdev_name;
-	if (subdev_name =3D NULL)
+	if (!subdev_name)
 		return -1;
=20
 	/* loop through the sub device list to get the sub device info */
@@ -833,7 +833,7 @@ static int vpif_set_output(struct vpif_display_config *=
vpif_cfg,
 	}
 	ch->output_idx =3D index;
 	ch->sd =3D sd;
-	if (chan_cfg->outputs !=3D NULL)
+	if (chan_cfg->outputs)
 		/* update tvnorms from the sub device output info */
 		ch->video_dev.tvnorms =3D chan_cfg->outputs[index].output.std;
 	return 0;
@@ -885,7 +885,7 @@ vpif_enum_dv_timings(struct file *file, void *priv,
 	struct v4l2_output output;
 	int ret;
=20
-	if (config->chan_config[ch->channel_id].outputs =3D NULL)
+	if (!config->chan_config[ch->channel_id].outputs)
 		return -ENODATA;
=20
 	chan_cfg =3D &config->chan_config[ch->channel_id];
@@ -922,7 +922,7 @@ static int vpif_s_dv_timings(struct file *file, void *p=
riv,
 	struct v4l2_output output;
 	int ret;
=20
-	if (config->chan_config[ch->channel_id].outputs =3D NULL)
+	if (!config->chan_config[ch->channel_id].outputs)
 		return -ENODATA;
=20
 	chan_cfg =3D &config->chan_config[ch->channel_id];
@@ -1021,7 +1021,7 @@ static int vpif_g_dv_timings(struct file *file, void =
*priv,
 	struct video_obj *vid_ch =3D &ch->video;
 	struct v4l2_output output;
=20
-	if (config->chan_config[ch->channel_id].outputs =3D NULL)
+	if (!config->chan_config[ch->channel_id].outputs)
 		goto error;
=20
 	chan_cfg =3D &config->chan_config[ch->channel_id];
@@ -1280,7 +1280,7 @@ static __init int vpif_probe(struct platform_device *=
pdev)
 	subdev_count =3D vpif_obj.config->subdev_count;
 	subdevdata =3D vpif_obj.config->subdevinfo;
 	vpif_obj.sd =3D kcalloc(subdev_count, sizeof(*vpif_obj.sd), GFP_KERNEL);
-	if (vpif_obj.sd =3D NULL) {
+	if (!vpif_obj.sd) {
 		err =3D -ENOMEM;
 		goto vpif_unregister;
 	}
--=20
2.10.1

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
