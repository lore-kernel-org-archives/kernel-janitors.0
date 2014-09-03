From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 03 Sep 2014 14:46:17 +0000
Subject: Re: [PATCH] hid-apple: fix coding style error
Message-Id: <20140903144617.GH6600@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <540720D0.2060800@nosuchfail.org>
In-Reply-To: <540720D0.2060800@nosuchfail.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Thanks for the patch.

Everyone's first patch is rejected.

Don't send patches as attachments.  Send them inline.  Read the first
paragraph of Documentation/email-clients.txt

On Wed, Sep 03, 2014 at 04:08:16PM +0200, Jonathan Klee wrote:
> Hello everyone,
> please find attached a patch fixing a coding style error.
> 
> Regards,
> jklee

> >From e66b1e0cb9733ab20a73bb3234578006afd02639 Mon Sep 17 00:00:00 2001
> From: "Jonathan Klee (jklee)" <jklee@nosuchfail.org>
> Date: Wed, 3 Sep 2014 15:43:13 +0200
> Subject: [PATCH] fix coding style error

No patch prefix.

Patch description should say something about spaces after commas.

No signed-off-by.

> 
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

The spacing here is done deliberately to make all the 'K's in the same
column.  Find something else to change.

regards,
dan carpenter

