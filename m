From: Greg KH <gregkh@linuxfoundation.org>
Date: Fri, 11 Mar 2016 21:34:03 +0000
Subject: Re: [PATCH 1/2 V2] staging: dgnc: use pointer type of tty_struct
Message-Id: <20160311213403.GA20084@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160307075247.GA21011@SEL-JYOUN-D1>
In-Reply-To: <20160307075247.GA21011@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: devel@driverdev.osuosl.org, lidza.louina@gmail.com, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, sudipm.mukherjee@gmail.com

On Mon, Mar 07, 2016 at 04:52:47PM +0900, Daeseok Youn wrote:
> For using tty_alloc_driver, SerialDriver has to be pointer type.
> It also has checkpatch.pl warning about Camelcase, so
> SerialDriver is changed to serial_driver.

Please only fix one thing per patch.  This should be two different
patches, right?

Also it doesn't apply properly to my tree, please rebase it against the
staging-testing branch of staging.git and resend.

thanks,

greg k-h
