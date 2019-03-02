From: Samuel Thibault <samuel.thibault@ens-lyon.org>
Date: Sat, 02 Mar 2019 19:42:11 +0000
Subject: Re: [PATCH] staging: speakup: i18n: fix spelling mistake "phoneticly" -> "phonetically"
Message-Id: <20190302194211.4aj6r3dr4hahbnqi@function>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181128161232.14907-1-colin.king@canonical.com>
In-Reply-To: <20181128161232.14907-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: William Hubbs <w.d.hubbs@gmail.com>, Chris Brannon <chris@the-brannons.com>, Kirk Reiser <kirk@reisers.ca>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, speakup@linux-speakup.org, devel@driverdev.osuosl.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Hello,

Colin King, le mer. 28 nov. 2018 16:12:32 +0000, a ecrit:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in array speakup_default_msgs at index
> MSG_FUNCNAME_SPELL_WORD_PHONETICALLY, fix this.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

We never got any feedback from the speakup mailing list, I guess fixing
the typo is fine.

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  drivers/staging/speakup/i18n.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/speakup/i18n.c b/drivers/staging/speakup/i18n.c
> index cea8707653f5..ee240d36f947 100644
> --- a/drivers/staging/speakup/i18n.c
> +++ b/drivers/staging/speakup/i18n.c
> @@ -336,7 +336,7 @@ static char *speakup_default_msgs[MSG_LAST_INDEX] = {
>  	[MSG_FUNCNAME_SPELL_DELAY_DEC] = "spell delay decrement",
>  	[MSG_FUNCNAME_SPELL_DELAY_INC] = "spell delay increment",
>  	[MSG_FUNCNAME_SPELL_WORD] = "spell word",
> -	[MSG_FUNCNAME_SPELL_WORD_PHONETICALLY] = "spell word phoneticly",
> +	[MSG_FUNCNAME_SPELL_WORD_PHONETICALLY] = "spell word phonetically",
>  	[MSG_FUNCNAME_TONE_DEC] = "tone decrement",
>  	[MSG_FUNCNAME_TONE_INC] = "tone increment",
>  	[MSG_FUNCNAME_VOICE_DEC] = "voice decrement",
> -- 
> 2.19.1
> 
