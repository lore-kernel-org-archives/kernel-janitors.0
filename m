From: Dimitris Papavasiliou <dpapavas@gmail.com>
Date: Fri, 21 Dec 2018 11:23:37 +0000
Subject: Re: [PATCH] ASoC: pcm512x: Fix a double unlock in pcm512x_digital_mute()
Message-Id: <f8f14c6a-46c2-995d-2df4-4ae821e1b895@gmail.com>
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

Ooops...  Looks like I left a spare unlock in there.  Thanks for
catching and fixing it!

Maintainers, please let me know if there's anything I need to do
with respect to this.
