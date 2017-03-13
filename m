From: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 13 Mar 2017 22:26:11 +0000
Subject: Re: [PATCH 3/3] staging: dngc: ch->ch_bd is already assigned to bd variable
Message-Id: <20170313222611.GA23550@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170312144727.GA24031@jyoun-Latitude-E6530>
In-Reply-To: <20170312144727.GA24031@jyoun-Latitude-E6530>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: devel@driverdev.osuosl.org, lidza.louina@gmail.com, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Mar 12, 2017 at 11:47:28PM +0900, Daeseok Youn wrote:
> The bd variable in dgnc_tty_digiseta() is assigned with
> ch->ch_bd but it is not used in this function except checking NULL.
> The ch->ch_bd could be replaced with bd variable in dgnc_tty_digiseta()
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
>  drivers/staging/dgnc/dgnc_tty.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Please merge this with your first patch in the series and resend them.

thanks,

greg k-h
