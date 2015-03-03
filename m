From: Lars-Peter Clausen <lars@metafoo.de>
Date: Tue, 03 Mar 2015 13:18:50 +0000
Subject: Re: [alsa-devel] [PATCH] ASoC: simple-card: Add a NULL pointer check in asoc_simple_card_dai_link_of
Message-Id: <54F5B4BA.7090408@metafoo.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <CAC3a_SBrJxS6x+qCwi0p5DcbEbVFX3AOP=-NxWbugY6bEvirLg@mail.gmail.com>
In-Reply-To: <CAC3a_SBrJxS6x+qCwi0p5DcbEbVFX3AOP=-NxWbugY6bEvirLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: vishal.thanki@gmail.com, kernel-janitors@vger.kernel.org, alsa-devel@alsa-project.org, broonie@kernel.org, lgirdwood@gmail.com

On 03/03/2015 02:14 PM, Vishal Thanki wrote:
[...]
> + if (!name) {
> + ret = -ENOMEM;
> + goto dai_link_of_err;
> + }
> +

The indention here is broken.

