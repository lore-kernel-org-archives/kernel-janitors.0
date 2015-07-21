From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 21 Jul 2015 10:57:43 +0000
Subject: Re: [patch] ASoC: max98925: reading beyond the end of the array
Message-Id: <20150721105743.GO5422@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150721085527.GA22070@mwanda>
 <20150721104350.GP11162@sirena.org.uk>
In-Reply-To: <20150721104350.GP11162@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Brown <broonie@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, Axel Lin <axel.lin@ingics.com>, alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>, Anish Kumar <yesanishhere@gmail.com>, kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>

On Tue, Jul 21, 2015 at 11:43:50AM +0100, Mark Brown wrote:
> On Tue, Jul 21, 2015 at 11:55:27AM +0300, Dan Carpenter wrote:
> > Debug prints are seldom useful and this one has an annoying thing where
> > it reads one space beyond the end of the array on error.
> 
> It's a pretty big stretch to say that debug prints are rarely useful...

I asked Anish if it was worth fixing and he said to delete it.

regards,
dan carpenter
