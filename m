From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 13 Oct 2017 10:57:10 +0000
Subject: [PATCH] ALSA: hda - silence uninitialized variable warning in activate_amp_in()
Message-Id: <20171013105710.4cksv562jhk4zwwi@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@perex.cz>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Hui Wang <hui.wang@canonical.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>

If snd_hda_get_conn_list() fails then "conn" isn't initialized.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/pci/hda/hda_generic.c b/sound/pci/hda/hda_generic.c
index 28e265a88383..5cc65093d941 100644
--- a/sound/pci/hda/hda_generic.c
+++ b/sound/pci/hda/hda_generic.c
@@ -795,6 +795,8 @@ static void activate_amp_in(struct hda_codec *codec, struct nid_path *path,
 	hda_nid_t nid = path->path[i];
 
 	nums = snd_hda_get_conn_list(codec, nid, &conn);
+	if (nums < 0)
+		return;
 	type = get_wcaps_type(get_wcaps(codec, nid));
 	if (type = AC_WID_PIN ||
 	    (type = AC_WID_AUD_IN && codec->single_adc_amp)) {
