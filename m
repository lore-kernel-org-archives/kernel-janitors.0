From: Takashi Iwai <tiwai@suse.de>
Date: Tue, 03 Nov 2020 13:12:32 +0000
Subject: Re: [PATCH] ALSA: hda: prevent undefined shift in snd_hdac_ext_bus_get_link()
Message-Id: <s5hh7q6oa7z.wl-tiwai@suse.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201103101807.GC1127762@mwanda>
In-Reply-To: <20201103101807.GC1127762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>, kernel-janitors@vger.kernel.org, Keyon Jie <yang.jie@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Jeeja KP <jeeja.kp@intel.com>

On Tue, 03 Nov 2020 11:18:07 +0100,
Dan Carpenter wrote:
> 
> This is harmless, but the "addr" comes from the user and it could lead
> to a negative shift or to shift wrapping if it's too high.
> 
> Fixes: 0b00a5615dc4 ("ALSA: hdac_ext: add hdac extended controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied.


Takashi
