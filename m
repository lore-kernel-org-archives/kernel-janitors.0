From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 09 Jan 2019 09:40:39 +0000
Subject: Re: [PATCH -next] ASoC: Intel: bytcht_es8316: Set correct platform drvdata in snd_byt_cht_es8316_mc_
Message-Id: <20190109094039.GD1718@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547023011-8321-1-git-send-email-weiyongjun1@huawei.com>
 <20190109092924.GB1743@kadam>
 <21a053d4-ed3c-5dce-9630-e72c783914ae@redhat.com>
In-Reply-To: <21a053d4-ed3c-5dce-9630-e72c783914ae@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans de Goede <hdegoede@redhat.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Jie Yang <yang.jie@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, Vinod Koul <vkoul@kernel.org>, Mark Brown <broonie@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>

On Wed, Jan 09, 2019 at 10:33:38AM +0100, Hans de Goede wrote:
> Hi,
> 
> On 09-01-19 10:29, Dan Carpenter wrote:
> > I think the correct fix is actually this (untested):
> 
> Right, I'm pretty sure the soc framework depends on dev_get_drvdata
> returning the snd_soc_card and I forgot about this when adding
> the remove function.
> 
> Wei Yongjun, thank you for catching this.
> 
> Dan, thank you for the correct version of the patch :)
> 
> Dan, can you do an official submission of the correct version of the
> patch, with a Reported-by: Wei Yongjun <weiyongjun1@huawei.com>
> or shall I submit your version upstream ?

Wei can resend and get authorship credit.  I only wrote the patch by
accident because it was easier than explaining.  (Or if you really don't
want to, Wei, then message me and I will do it).

regards,
dan carpenter
