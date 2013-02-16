From: Anton Vorontsov <anton@enomsg.org>
Date: Sat, 16 Feb 2013 21:27:57 +0000
Subject: Re: [patch] generic-adc-battery: forever loop in gab_remove()
Message-Id: <20130216212757.GB1741@lizard.sbx05280.losalca.wayport.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130214072643.GA4690@elgon.mountain>
In-Reply-To: <20130214072643.GA4690@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Feb 14, 2013 at 10:26:43AM +0300, Dan Carpenter wrote:
> There is a forever loop calling iio_channel_release() because the
> "chan < " part of the "chan < ARRAY_SIZE()" is missing.  This is in both
> the error handling on probe and also in the remove function.
> 
> The other thing is that it's possible for some of the elements of the
> adc_bat->channel[chan] array to be an ERR_PTR().  I've changed them to
> be NULL instead.  We're still not allowed to pass NULLs to
> iio_channel_release() so I've added a check.
> 
> Finally, I removed an unused "chan = ARRAY_SIZE(gab_chan_name);"
> statement as a small cleanup.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks a lot!

Anton
