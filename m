From: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 21 Mar 2016 21:05:32 +0000
Subject: Re: [PATCH 3/3] staging: dgnc: use tty_alloc_driver instead of kcalloc
Message-Id: <20160321210532.GE9749@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160314042900.GA6179@SEL-JYOUN-D1>
In-Reply-To: <20160314042900.GA6179@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: devel@driverdev.osuosl.org, lidza.louina@gmail.com, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 14, 2016 at 01:29:00PM +0900, Daeseok Youn wrote:
> the tty_alloc_driver() can allocate memory for ttys and termios.
> And also it can release allocated memory easly with using
> put_tty_driver().
> 
> Signed-off-by: Daeseok Youn <daeseok.youn@gmail.com>

But you broke the driver in the previous patch, you can't do that, each
patch has to be 'stand-alone'.

thanks,

greg k-h
