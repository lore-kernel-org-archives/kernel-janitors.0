From: Dimitris Papavasiliou <dpapavas@gmail.com>
Date: Fri, 21 Dec 2018 13:51:16 +0000
Subject: Re: [PATCH] ASoC: pcm512x: Fix a double unlock in pcm512x_digital_mute()
Message-Id: <70125712-3f2a-3ff9-a8a2-61018dd6ba1c@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181221091120.GG2735@kadam>
In-Reply-To: <20181221091120.GG2735@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>

On 12/21/18 11:11 AM, Dan Carpenter wrote:
> We accidentally call mutex_unlock(&pcm512x->mutex); twice in a row.
> 
> I re-wrote the error handling to use "goto unlock;" instead of returning
> directly.  Hopefully, it makes the code a little simpler.
> 
> Fixes: 3500f1c589e9 ("ASoC: pcm512x: Implement the digital_mute interface")
> Signed-off-by: Dan Carpenter<dan.carpenter@oracle.com>
> ---
>   sound/soc/codecs/pcm512x.c | 11 ++++-------
>   1 file changed, 4 insertions(+), 7 deletions(-)

Reviewed-by: Dimitris Papavasiliou <dpapavas@gmail.com>
