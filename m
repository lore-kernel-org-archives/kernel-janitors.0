From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Mon, 19 Oct 2009 15:12:52 +0000
Subject: Re: [PATCH 1/14] sound/soc: Move dereference after NULL test
Message-Id: <20091019151251.GB29796@sirena.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0910170832300.9213@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0910170832300.9213@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Liam Girdwood <lrg@slimlogic.co.uk>

On Sat, Oct 17, 2009 at 08:32:56AM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> If the NULL test on jack is needed, then the derefernce should be after the
> NULL test.

Applied, thanks.
