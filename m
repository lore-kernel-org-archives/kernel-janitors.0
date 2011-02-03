From: Dan Carpenter <error27@gmail.com>
Date: Thu, 03 Feb 2011 19:07:41 +0000
Subject: Re: request_region/release_resource
Message-Id: <20110203190741.GT20606@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1102031731380.14058@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1102031731380.14058@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thu, Feb 03, 2011 at 05:33:28PM +0100, Julia Lawall wrote:
> Is there any circumstance in which it is ok to call release_resource on 
> the result of calling request(_mem)_region?  One issue is that 
> release_resource doesn't free its argument, but then what if the call to 
> release_resource is followed by a call to kfree?
> 
> Example:
> drivers/watchdog/s3c2410_wdt.c, in the function s3c2410wdt_probe
> 

Best to ask on lkml.  Greg is the maintainer for driver core so CC him.

regards,
dan carpenter
