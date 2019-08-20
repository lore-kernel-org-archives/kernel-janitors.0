From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Tue, 20 Aug 2019 19:47:14 +0000
Subject: Re: [PATCH] rtc: rv3029: Revert my error handling patch to rv3029_eeprom_write()
Message-Id: <20190820194714.GV3545@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190817065604.GB29951@mwanda>
In-Reply-To: <20190817065604.GB29951@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Tom Evans <tom.evans@motec.com.au>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

On 17/08/2019 09:56:04+0300, Dan Carpenter wrote:
> My error handling "cleanup" was totally wrong.  Both the "err" and "ret"
> variables are required.  The "err" variable holds the error codes for
> rv3029_eeprom_enter/exit() and the "ret" variable holds the error codes
> for if actual write fails.  In my patch if the write failed, the
> function probably still returned success.
> 
> Reported-by: Tom Evans <tom.evans@motec.com.au>
> Fixes: 97f5b0379c38 ("rtc: rv3029: Clean up error handling in rv3029_eeprom_write()")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/rtc/rtc-rv3029c2.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
