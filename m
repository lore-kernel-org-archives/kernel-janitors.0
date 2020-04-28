From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 28 Apr 2020 17:58:14 +0000
Subject: Re: [PATCH] usb: phy: twl6030-usb: Fix a resource leak in an error handling path in 'twl6030_usb_pro
Message-Id: <20200428175814.GI2014@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427202116.94380-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200427202116.94380-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, Apr 27, 2020 at 10:21:16PM +0200, Christophe JAILLET wrote:
> A call to 'regulator_get()' is hidden in 'twl6030_usb_ldo_init()'. A
> corresponding put must be performed in the error handling path, as
> already done in the remove function.
> 
> While at it, also move a 'free_irq()' call in the error handling path in
> order to be consistent.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Maybe adding a 'twl6030_usb_ldo_uninit()' function would be more explicit.

It would be nicer, yes, but probably this is fine too.

Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
