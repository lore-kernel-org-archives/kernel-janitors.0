From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 20 Apr 2017 10:17:02 +0000
Subject: [PATCH] ASoC: Intel: Skylake: Uninitialized variable in probe_codec()
Message-Id: <20170420101702.nlq3537xumrseu26@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Liam Girdwood <lgirdwood@gmail.com>, Jeeja KP <jeeja.kp@intel.com>
Cc: alsa-devel@alsa-project.org, Dharageswari R <dharageswari.r@intel.com>, Lukas Wunner <lukas@wunner.de>, Vinod Koul <vinod.koul@intel.com>, Pardha Saradhi K <pardha.saradhi.kesapragada@intel.com>, Jayachandran B <jayachandran.b@intel.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>, Yong Zhi <yong.zhi@intel.com>

My static checker complains that if snd_hdac_bus_get_response() returns
-EIO then "res" is uninitialized.  Fix this by initializing it to -1 so
that the error is handled correctly.

Fixes: d8c2dab8381d ("ASoC: Intel: Add Skylake HDA audio driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 0c57d4eaae3a..6df3b317a476 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -512,7 +512,7 @@ static int probe_codec(struct hdac_ext_bus *ebus, int addr)
 	struct hdac_bus *bus = ebus_to_hbus(ebus);
 	unsigned int cmd = (addr << 28) | (AC_NODE_ROOT << 20) |
 		(AC_VERB_PARAMETERS << 8) | AC_PAR_VENDOR_ID;
-	unsigned int res;
+	unsigned int res = -1;
 
 	mutex_lock(&bus->cmd_mutex);
 	snd_hdac_bus_send_cmd(bus, cmd);
