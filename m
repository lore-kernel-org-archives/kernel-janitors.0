From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Fri, 03 Apr 2020 11:40:21 +0000
Subject: Re: [PATCH][next][V3] rtc: ds1307: check for failed memory allocation on wdt
Message-Id: <20200403114021.GS3683@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200403110437.57420-1-colin.king@canonical.com>
In-Reply-To: <20200403110437.57420-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Guenter Roeck <linux@roeck-us.net>, Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/04/2020 12:04:37+0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently a failed memory allocation will lead to a null pointer
> dereference on point wdt.  Fix this by checking for a failed
> allocation and just returning.
> 
> Addresses-Coverity: ("Dereference null return")
> Fixes: fd90d48db037 ("rtc: ds1307: add support for watchdog timer on ds1388")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: move error exit label and remove a return statement, thanks to 
>     Walter Harms for spotting this clean up.
> V3: simplify, just bail out and return on detecting the out of memory
>     condition
> 
> ---
> 
>  drivers/rtc/rtc-ds1307.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
