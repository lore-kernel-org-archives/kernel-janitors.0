From: Greg KH <gregkh@linuxfoundation.org>
Date: Mon, 21 Mar 2016 21:05:06 +0000
Subject: Re: [PATCH 2/3] staging: dgnc: use pointer type of tty_struct
Message-Id: <20160321210506.GD9749@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160314042831.GA5760@SEL-JYOUN-D1>
In-Reply-To: <20160314042831.GA5760@SEL-JYOUN-D1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Daeseok Youn <daeseok.youn@gmail.com>
Cc: devel@driverdev.osuosl.org, lidza.louina@gmail.com, driverdev-devel@linuxdriverproject.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Mar 14, 2016 at 01:28:31PM +0900, Daeseok Youn wrote:
> For using tty_alloc_driver, SerialDriver has to be pointer type.

Yes, but you aren't calling tty_alloc_driver, so this patch totally
breaks the working code :(

Please be more careful...

greg k-h
