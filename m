From: Greg KH <gregkh@linuxfoundation.org>
Date: Thu, 22 Sep 2016 07:20:36 +0000
Subject: Re: [PATCH 01/11] staging: dgnc: remove redundant initialization for
Message-Id: <20160922072036.GA4333@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160922052051.GA27160@SEL-JYOUN-D1>
In-Reply-To: <20160922052051.GA27160@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: lidza.louina@gmail.com, devel@driverdev.osuosl.org, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Sep 22, 2016 at 02:20:51PM +0900, Daeseok Youn wrote:
> The channel array in board_t was initialized in dgnc_found_board()
> with NULL. But the channel is going to initialize in dgnc_tty_init().
> So the channel array doesn't need to set NULL for initailization.
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
>  drivers/staging/dgnc/dgnc_driver.c | 3 ---
>  1 file changed, 3 deletions(-)

Your subject is odd, why end in "for"?

