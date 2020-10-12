From: Charles Keepax <ckeepax@opensource.cirrus.com>
Date: Mon, 12 Oct 2020 09:26:18 +0000
Subject: Re: [PATCH 1/8] ASoC: wm8350: use semicolons rather than commas to separate statements
Message-Id: <20201012092618.GY10899@ediswmail.ad.cirrus.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1602407979-29038-1-git-send-email-Julia.Lawall@inria.fr>
 <1602407979-29038-2-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1602407979-29038-2-git-send-email-Julia.Lawall@inria.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: alsa-devel@alsa-project.org, Valdis =?utf-8?Q?Kl=C4=93tnieks?= <valdis.kletnieks@vt.edu>, patches@opensource.cirrus.com, Takashi Iwai <tiwai@suse.com>, kernel-janitors@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Joe Perches <joe@perches.com>, Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org

On Sun, Oct 11, 2020 at 11:19:32AM +0200, Julia Lawall wrote:
> Replace commas with semicolons.  What is done is essentially described by
> the following Coccinelle semantic patch (http://coccinelle.lip6.fr/):
> 
> // <smpl>
> @@ expression e1,e2; @@
> e1
> -,
> +;
> e2
> ... when any
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> 
> ---

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
