From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Fri, 16 Mar 2018 09:21:50 +0000
Subject: Re: [PATCH -next] ASoC: wm8400: Use devm_snd_soc_register_component()
Message-Id: <20180316092150.osexp6amtg3utvhm@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1521185527-164406-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1521185527-164406-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, patches@opensource.cirrus.com, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org

On Fri, Mar 16, 2018 at 07:32:07AM +0000, Wei Yongjun wrote:
> Since the remove callback is removed, the snd_soc_unregister_component()
> is missing when remove device. Using devm_snd_soc_register_component()
> instead of snd_soc_register_component().
> 
> Fixes: 10dc44c6462d ("ASoC: wm8400: replace codec to component")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Thanks for spotting this.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
