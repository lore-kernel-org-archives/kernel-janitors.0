From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Date: Sat, 06 Jul 2019 09:00:19 +0000
Subject: Re: [PATCH] staging: speakup: One function call less in speakup_win_enable()
Message-Id: <20190706090019.rivposzrqesodhso@function>
List-Id: <kernel-janitors.vger.kernel.org>
References: <11f79333-25c3-1ad9-4975-58c64821f3fe@web.de>
In-Reply-To: <11f79333-25c3-1ad9-4975-58c64821f3fe@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: devel@driverdev.osuosl.org, Kirk Reiser <kirk@reisers.ca>, kernel-janitors@vger.kernel.org, Bhagyashri Dighole <digholebhagyashri@gmail.com>, Okash Khawaja <okash.khawaja@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, speakup@linux-speakup.org, LKML <linux-kernel@vger.kernel.org>, Chris Brannon <chris@the-brannons.com>

Markus Elfring, le sam. 06 juil. 2019 10:15:30 +0200, a ecrit:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sat, 6 Jul 2019 10:03:56 +0200
> 
> Avoid an extra function call by using a ternary operator instead of
> a conditional statement.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  drivers/staging/speakup/main.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/speakup/main.c b/drivers/staging/speakup/main.c
> index 488f2539aa9a..03bbc9a4dbb3 100644
> --- a/drivers/staging/speakup/main.c
> +++ b/drivers/staging/speakup/main.c
> @@ -1917,10 +1917,9 @@ static void speakup_win_enable(struct vc_data *vc)
>  		return;
>  	}
>  	win_enabled ^= 1;
> -	if (win_enabled)
> -		synth_printf("%s\n", spk_msg_get(MSG_WINDOW_SILENCED));
> -	else
> -		synth_printf("%s\n", spk_msg_get(MSG_WINDOW_SILENCE_DISABLED));
> +	synth_printf("%s\n", spk_msg_get(win_enabled
> +					 ? MSG_WINDOW_SILENCED
> +					 : MSG_WINDOW_SILENCE_DISABLED));
>  }
> 
>  static void speakup_bits(struct vc_data *vc)
> --
> 2.22.0
> 

-- 
Samuel
--- christ gives channel operator status to Dieu
 -+- #ens-mim and hell -+-
