From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Wed, 11 Feb 2015 17:36:34 +0000
Subject: Re: [patch] Input: pxa27x_keypad - remove an unneeded NULL check
Message-Id: <20150211173634.GA29440@dtor-ws>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150211102802.GD18515@mwanda>
In-Reply-To: <20150211102802.GD18515@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Chao Xie <chao.xie@marvell.com>, Rob Herring <robh@kernel.org>, Wolfram Sang <wsa@the-dreams.de>, Pramod Gurav <pramod.gurav@smartplayin.com>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Feb 11, 2015 at 01:28:02PM +0300, Dan Carpenter wrote:
> Static checkers complain about this NULL check because we dereference it
> without checking a couple lines later.  This function is only called
> when "keypad->pdata" is non-NULL so we can just delete the NULL test.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied in a modified form - removed the temp altogether.

> 
> diff --git a/drivers/input/keyboard/pxa27x_keypad.c b/drivers/input/keyboard/pxa27x_keypad.c
> index a89488a..385abf8 100644
> --- a/drivers/input/keyboard/pxa27x_keypad.c
> +++ b/drivers/input/keyboard/pxa27x_keypad.c
> @@ -346,7 +346,7 @@ static int pxa27x_keypad_build_keycode(struct pxa27x_keypad *keypad)
>  	const struct pxa27x_keypad_platform_data *pdata = keypad->pdata;
>  	struct input_dev *input_dev = keypad->input_dev;
>  	const struct matrix_keymap_data *keymap_data > -				pdata ? pdata->matrix_keymap_data : NULL;
> +						pdata->matrix_keymap_data;
>  	unsigned short keycode;
>  	int i;
>  	int error;

Thanks.

-- 
Dmitry
