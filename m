From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 11 Mar 2016 21:34:21 +0000
Subject: Re: [PATCH 2/2 V2] staging: dgnc: use tty_alloc_driver instead of kcalloc
Message-Id: <20160311213421.GA20127@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160307075537.GA23008@SEL-JYOUN-D1>
In-Reply-To: <20160307075537.GA23008@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: devel@driverdev.osuosl.org, lidza.louina@gmail.com, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, sudipm.mukherjee@gmail.com

On Mon, Mar 07, 2016 at 04:55:38PM +0900, Daeseok Youn wrote:
> the tty_alloc_driver() can allocate memory for ttys and termios.
> And also it can release allocated memory easly with using
> put_tty_driver().

Also needs to be rebased and resent.
