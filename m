From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 03 Sep 2014 15:36:28 +0000
Subject: Re: [PATCH] fix coding style error
Message-Id: <alpine.DEB.2.10.1409031734250.2453@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1409758334-32721-1-git-send-email-jklee@nosuchfail.org>
In-Reply-To: <1409758334-32721-1-git-send-email-jklee@nosuchfail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

The patch is now inlined in the message, but the description is not very
clear, and there is no signed off.  And anyway, Dan pointed out that this
particular patch is not very desirable.  Take a look at some other patches
to see the general structure, and read SubmittingPatches again.

julia

On Wed, 3 Sep 2014, Jonathan Klee wrote:

> ---
>  drivers/hid/hid-apple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
> index f822fd2..df9348f 100644
> --- a/drivers/hid/hid-apple.c
> +++ b/drivers/hid/hid-apple.c
> @@ -160,7 +160,7 @@ static const struct apple_key_translation swapped_option_cmd_keys[] = {
>  	{ KEY_LEFTALT,	KEY_LEFTMETA },
>  	{ KEY_LEFTMETA,	KEY_LEFTALT },
>  	{ KEY_RIGHTALT,	KEY_RIGHTMETA },
> -	{ KEY_RIGHTMETA,KEY_RIGHTALT },
> +	{ KEY_RIGHTMETA, KEY_RIGHTALT },
>  	{ }
>  };
>
> --
> 2.1.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
