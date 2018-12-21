From: Dimitris Papavasiliou <dpapavas@gmail.com>
Date: Fri, 21 Dec 2018 13:54:26 +0000
Subject: Re: [PATCH] ASoC: pcm512x: Fix a double unlock in pcm512x_digital_mute()
Message-Id: <87751c04-3bb9-0fc2-5ddc-2dd86dbe9b05@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181221091120.GG2735@kadam>
 <f8f14c6a-46c2-995d-2df4-4ae821e1b895@gmail.com>
 <20181221120056.GD2240@kadam> <20181221121050.GE4996@sirena.org.uk>
In-Reply-To: <20181221121050.GE4996@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: alsa-devel@alsa-project.org, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>

On 12/21/18 2:10 PM, Mark Brown wrote:
> On Fri, Dec 21, 2018 at 03:00:56PM +0300, Dan Carpenter wrote:
>> On Fri, Dec 21, 2018 at 01:23:37PM +0200, Dimitris Papavasiliou wrote:
> 
>>> Maintainers, please let me know if there's anything I need to do
>>> with respect to this.
> 
>> All you need to is reply with a reviewed-by tag so we can mark on the
>> fix that you approved it.
> 
>> Reviewed-by: Your Name <email>
> 
> I've just gone and applied the tag but yeah, what Dan says - there's
> tools that can pick tags like this out of e-mail which is also useful.

Thanks to both, but Mark, I'm afraid you've misspelled "Reviewed" in
the patch you applied.
