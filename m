From: Vinod Koul <vinod.koul@intel.com>
Date: Thu, 22 Jun 2017 10:42:35 +0000
Subject: Re: [alsa-devel] [PATCH] ASoC: max9867: make array ni_div static const
Message-Id: <20170622103034.GS19154@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170622093231.11389-1-colin.king@canonical.com>
In-Reply-To: <20170622093231.11389-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jun 22, 2017 at 10:32:31AM +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The array ni_div does not need to be in global scope and is not
> modified, so make it static const.
> 
> Cleans up sparse warning:
> "symbol 'ni_div' was not declared. Should it be static?"

Acked-By: Vinod Koul <vinod.koul@intel.com>

-- 
~Vinod
