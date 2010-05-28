From: Dan Carpenter <error27@gmail.com>
Date: Fri, 28 May 2010 13:55:34 +0000
Subject: Re: question about leds-88pm860x.c
Message-Id: <20100528135533.GZ22515@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100528123122.GY22515@bicker>
In-Reply-To: <20100528123122.GY22515@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, May 28, 2010 at 06:42:33AM -0700, Haojian Zhuang wrote:
> Thanks for your good catch. We needn't this checking at here. Now I format this patch.
> 
> Best Regards
> Haojian
> 

Sorry, I only noticed this after I had already sent the email but
__check_device() in drivers/video/backlight/88pm860x_bl.c has the same
thing.

regards,
dan carpenter


