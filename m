From: Vinod Koul <vinod.koul@intel.com>
Date: Wed, 18 Nov 2015 18:34:50 +0000
Subject: Re: [patch] ASoC: Intel: pass correct parameter in sst_alloc_stream_mrfld()
Message-Id: <20151118182249.GY25173@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151118100255.GA15236@mwanda>
In-Reply-To: <20151118100255.GA15236@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org

On Wed, Nov 18, 2015 at 01:04:20PM +0300, Dan Carpenter wrote:
> "data" is always NULL in this function.  I think we should be passing
> "&data" to sst_prepare_and_post_msg() instead of "data".
> 
> Fixes: 3d9ff34622ba ('ASoC: Intel: sst: add stream operations')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Not tested.

This looks right to me but this should have resulted in broken stuff, I will
test this tomorrow and get back

-- 
~Vinod
