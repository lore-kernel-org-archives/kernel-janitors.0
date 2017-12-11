From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 11 Dec 2017 12:01:29 +0000
Subject: Re: [alsa-devel] [PATCH 1/2] ASoC: nuc900: Fix platform_get_irq() error checking some more
Message-Id: <20171211120129.ssrw65eghtdpmjej@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171209115203.pdtdfnmzwz6zpjqs@mwanda>
 <5A2BE644.3070009@gmail.com> <20171209172732.GF15660@piout.net>
 <20171210015200.gr4mxzqgzyvamxui@mwanda>
 <5A2C9E9A.7020501@gmail.com>
 <20171211084053.p5ke733i3kzzk5mz@mwanda>
 <a191218d-fe63-db5f-1993-2167a2077f70@gmail.com>
 <20171211102730.agtoczxiu4dcn5ra@mwanda>
 <20171211114950.GB32306@piout.net>
In-Reply-To: <20171211114950.GB32306@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>, Arvind Yadav <arvind.yadav.cs@gmail.com>

On Mon, Dec 11, 2017 at 12:49:50PM +0100, Alexandre Belloni wrote:
> Maybe the good thing to do is to actaully leave the nuc900 code alone
> instead of trying to change something that never failed and that doesn't
> seem to interest anyone anymore (else the platform would have been
> converted to DT).
>

I don't know.  The bug is less than a month old and this discussion has
been useful for me as I review any platform_get_irq() changes sent to
staging.

regards,
dan carpenter

