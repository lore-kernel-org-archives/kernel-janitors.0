From: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 21 Aug 2016 15:55:51 +0000
Subject: Re: [PATCH 1/2] staging: dgnc: change a parameter from tty_struct to
Message-Id: <20160821155551.GA3303@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160819010452.GA8009@SEL-JYOUN-D1>
In-Reply-To: <20160819010452.GA8009@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: devel@driverdev.osuosl.org, lidza.louina@gmail.com, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Aug 19, 2016 at 10:04:52AM +0900, Daeseok Youn wrote:
> The dgnc_maxcps_room() function must be called only for print device.
> The if-statement for checking print device checks before calling
> maxcps_room() and also this function doesn't need to have any
> data except channel_t.
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
>  drivers/staging/dgnc/dgnc_tty.c | 18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)

Your subject line doesn't make much sense, does it?

:(

Please fix up and resend.

thanks,

greg k-h
