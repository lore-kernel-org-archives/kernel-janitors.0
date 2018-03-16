From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 16 Mar 2018 08:47:12 +0000
Subject: Re: [PATCH -next] ASoC: mediatek: mt2701: drop unnessary snd_soc_unregister_component()
Message-Id: <20180316084712.hh4ll7hfsncqqsos@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1521185516-164333-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1521185516-164333-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: alsa-devel@alsa-project.org, Ryder Lee <ryder.lee@mediatek.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org

On Fri, Mar 16, 2018 at 07:31:56AM +0000, Wei Yongjun wrote:
> It's not necessary to unregister a component registered
> with devm_snd_soc_register_component().
> 
> Fixes: f1b5bf07365d ("ASoC: mt2701/mt8173: replace platform to componen")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>


This fixes a double free on unload, right?

regards,
dan carpenter

