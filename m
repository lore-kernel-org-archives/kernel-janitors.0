From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 18 Oct 2010 23:31:45 +0000
Subject: Re: [PATCH 1/2] sound/soc/davinci/davinci-mcasp.c: Return error
Message-Id: <20101018233112.GA26745@opensource.wolfsonmicro.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1287411074-19825-1-git-send-email-julia@diku.dk>
In-Reply-To: <1287411074-19825-1-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>

On Mon, Oct 18, 2010 at 04:11:13PM +0200, Julia Lawall wrote:
> In this code, 0 is returned on failure, even though other
> failures return -ENOMEM or other similar values.

Applied, thanks.
