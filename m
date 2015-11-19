From: Vinod Koul <vinod.koul@intel.com>
Date: Thu, 19 Nov 2015 10:47:20 +0000
Subject: Re: [patch] ASoC: Intel: pass correct parameter in sst_alloc_stream_mrfld()
Message-Id: <20151119105059.GB25173@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151118100255.GA15236@mwanda>
 <20151118182249.GY25173@localhost>
In-Reply-To: <20151118182249.GY25173@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@intel.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, "Mirche, Dinesh" <dinesh.mirche@intel.com>

On Wed, Nov 18, 2015 at 11:52:49PM +0530, Vinod Koul wrote:
> On Wed, Nov 18, 2015 at 01:04:20PM +0300, Dan Carpenter wrote:
> > "data" is always NULL in this function.  I think we should be passing
> > "&data" to sst_prepare_and_post_msg() instead of "data".
> > 
> > Fixes: 3d9ff34622ba ('ASoC: Intel: sst: add stream operations')
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > Not tested.
> 
> This looks right to me but this should have resulted in broken stuff, I will
> test this tomorrow and get back

we tested and looks right, so

Tested-by: Dinesh Mirche <dinesh.mirche@intel.com>
Acked-by: Vinod Koul <vinod.koul@intel.com>

-- 
~Vinod
