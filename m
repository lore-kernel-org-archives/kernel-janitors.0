From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Date: Thu, 02 Sep 2010 15:30:56 +0000
Subject: Re: [PATCH 2/4] sound/soc/fsl/p1022_ds.c: Add of_node_put to avoid
Message-Id: <20100902153056.GE5809@rakim.wolfsonmicro.main>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1283269738-14612-1-git-send-email-julia@diku.dk>
	<1283269738-14612-3-git-send-email-julia@diku.dk>
In-Reply-To: <1283269738-14612-3-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Likely <grant.likely@secretlab.ca>, Liam Girdwood <lrg@slimlogic.co.uk>

On Tue, Aug 31, 2010 at 05:48:56PM +0200, Julia Lawall wrote:
> Add a call to of_node_put in the error handling code following a call to
> of_parse_phandle.

Applied, thanks.
