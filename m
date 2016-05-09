From: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 09 May 2016 12:08:49 +0000
Subject: Re: [PATCH 1/3] staging: dgnc: remove redundant NULL check in
Message-Id: <20160509120849.GA5302@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160504051304.GA20929@certreview.com>
In-Reply-To: <20160504051304.GA20929@certreview.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: devel@driverdev.osuosl.org, lidza.louina@gmail.com, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 04, 2016 at 02:13:04PM +0900, Daeseok Youn wrote:
> tty and ch are already checked for NULL
> before calling dgnc_block_til_ready().
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>

Your subject line doesn't make sense, please fix it up and resend.

thanks,

greg k-h
