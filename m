From: Johan Hovold <johan@kernel.org>
Date: Mon, 07 Jul 2014 08:53:43 +0000
Subject: Re: [PATCH 1/11 V2] USB: kl5kusb105: Remove klsi_105_tiocmset function
Message-Id: <20140707085343.GE29098@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1401552180-9445-1-git-send-email-peter.senna@gmail.com>
 <20140601093117.GC14935@localhost>
In-Reply-To: <20140601093117.GC14935@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Peter Senna Tschudin <peter.senna@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Oliver Neukum <oliver@neukum.org>, kernel-janitors@vger.kernel.org, Johan Hovold <jhovold@gmail.com>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, Jun 01, 2014 at 11:31:17AM +0200, Johan Hovold wrote:
> On Sat, May 31, 2014 at 01:03:00PM -0300, Peter Senna Tschudin wrote:
> > This patch remove the function klsi_105_tiocmset which was only
> > returning -EINVAL. It also removes the function prototype and
> > the .tiocmset entry in the struct usb_serial_driver.
> > 
> > Verified by compilation only.
> > 
> > Signed-off-by: Peter Senna Tschudin <peter.senna@gmail.com>
> 
> Signed-off-by: Johan Hovold <jhovold@gmail.com>

It seems this one was never picked up, but I'm applying it to my tree
now.

Thanks again, Peter.

Johan
