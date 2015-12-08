From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 08 Dec 2015 05:53:22 +0000
Subject: [patch] ASoC: Intel: Skylake: pointer math issue
Message-Id: <20151208055321.GA5597@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Vinod Koul <vinod.koul@intel.com>, Jeeja KP <jeeja.kp@intel.com>, "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>, Hardik T Shah <hardik.t.shah@intel.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

"data" is a u32 pointer so this copies the information to wrong place
entirely.

Fixes: 140adfba5280 ('ASoC: Intel: Skylake: Add tlv byte kcontrols')
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
index dde8d3c..2c4405e 100644
--- a/sound/soc/intel/skylake/skl-topology.c
+++ b/sound/soc/intel/skylake/skl-topology.c
@@ -885,9 +885,9 @@ static int skl_tplg_tlv_control_get(struct snd_kcontrol *kcontrol,
 	if (bc->params) {
 		if (copy_to_user(data, &bc->param_id, sizeof(u32)))
 			return -EFAULT;
-		if (copy_to_user(data + sizeof(u32), &size, sizeof(u32)))
+		if (copy_to_user(data + 1, &size, sizeof(u32)))
 			return -EFAULT;
-		if (copy_to_user(data + 2 * sizeof(u32), bc->params, size))
+		if (copy_to_user(data + 2, bc->params, size))
 			return -EFAULT;
 	}
 
