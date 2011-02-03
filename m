From: Julia Lawall <julia@diku.dk>
Date: Thu, 03 Feb 2011 16:33:28 +0000
Subject: request_region/release_resource
Message-Id: <Pine.LNX.4.64.1102031731380.14058@pc-004.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Is there any circumstance in which it is ok to call release_resource on 
the result of calling request(_mem)_region?  One issue is that 
release_resource doesn't free its argument, but then what if the call to 
release_resource is followed by a call to kfree?

Example:
drivers/watchdog/s3c2410_wdt.c, in the function s3c2410wdt_probe

thanks,
julia
