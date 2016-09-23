From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 23 Sep 2016 12:15:39 +0000
Subject: Re: [PATCH 01/11 V2] staging: dgnc: remove redundant initialization for channel array
Message-Id: <20160923121539.GA14829@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160923012502.GA31785@SEL-JYOUN-D1>
In-Reply-To: <20160923012502.GA31785@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: lidza.louina@gmail.com, devel@driverdev.osuosl.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Sep 23, 2016 at 10:25:02AM +0900, Daeseok Youn wrote:
> The channel array in board_t was initialized in dgnc_found_board()
> with NULL. But the channel is going to initialize in dgnc_tty_init()
> again. So the channel array doesn't need to set NULL
> for initailization in dgnc_found_board().
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
> V2: The subject line was cut off, I put it completely and update
> change log.

I only got 6 patches of an 11 patch series here, what happened?

Please resend the whole series.

thanks,

greg k-h
