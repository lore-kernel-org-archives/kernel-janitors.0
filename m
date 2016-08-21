From: Greg KH <gregkh@linuxfoundation.org>
Date: Sun, 21 Aug 2016 15:56:36 +0000
Subject: Re: [PATCH 2/2] staging: dgnc: refactor the dgnc_maxcps_room() to improve
Message-Id: <20160821155636.GB3303@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160819010519.GA8031@SEL-JYOUN-D1>
In-Reply-To: <20160819010519.GA8031@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: devel@driverdev.osuosl.org, lidza.louina@gmail.com, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Aug 19, 2016 at 10:05:19AM +0900, Daeseok Youn wrote:
> The whole code in dgnc_maxcps_room() function surrounds with
> one if-statement for checking channel's maxcps and buffer size.
> I tried to separate the logic for this function from if-condition.
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>
> ---
>  drivers/staging/dgnc/dgnc_tty.c | 46 +++++++++++++++++++++--------------------
>  1 file changed, 24 insertions(+), 22 deletions(-)

Have you tested this on the hardware?

Until you do, I'm loath to take changes like this, especially as you are
adding more code than you remove :(

sorry,

greg k-h
