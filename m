From: Vinod Koul <vinod.koul@intel.com>
Date: Tue, 03 May 2016 16:18:12 +0000
Subject: Re: [patch] ASoC: hdac_hdmi: Potential NULL deref in hdac_hdmi_get_spk_alloc()
Message-Id: <20160503160611.GU2274@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160503074258.GA9722@mwanda>
 <20160503095639.GS2274@localhost>
In-Reply-To: <20160503095639.GS2274@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, "Subhransu S. Prusty" <subhransu.s.prusty@intel.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jeeja KP <jeeja.kp@intel.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Arnd Bergmann <arnd@arndb.de>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Sachin Mokashi <sachinx.mokashi@intel.com>, patches.audio@intel.com

On Tue, May 03, 2016 at 03:26:39PM +0530, Vinod Koul wrote:
> On Tue, May 03, 2016 at 10:42:58AM +0300, Dan Carpenter wrote:
> > We intended || here instead of &&.  The original code potentially leads
> > to a NULL dereference.
> 
> This looks good to me, I will test this and get back

Acked-by: Vinod Koul <vinod.koul@intel.com>
Tested-by: Sachin Mokashi <sachinx.mokashi@intel.com>

-- 
~Vinod
