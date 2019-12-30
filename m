From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Mon, 30 Dec 2019 10:44:53 +0000
Subject: Re: [PATCH] ASoC: cs47l92: Simplify error handling code in 'cs47l92_probe()'
Message-Id: <20191230104453.GG10451@ediswmail.ad.cirrus.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191226162907.9490-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20191226162907.9490-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: brian.austin@cirrus.com, alsa-devel@alsa-project.org, patches@opensource.cirrus.com, tiwai@suse.com, kernel-janitors@vger.kernel.org, lgirdwood@gmail.com, Paul.Handrigan@cirrus.com, rf@opensource.cirrus.com, broonie@kernel.org, linux-kernel@vger.kernel.org

On Thu, Dec 26, 2019 at 05:29:07PM +0100, Christophe JAILLET wrote:
> If 'madera_init_bus_error_irq()' fails,
> 'wm_adsp2_remove(&cs47l92->core.adsp[0])' will be called twice.
> Once in the 'if' block, and once in the error handling path.
> This is harmless, but one of this call can be axed.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
