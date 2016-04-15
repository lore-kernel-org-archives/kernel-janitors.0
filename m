From: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 15 Apr 2016 22:04:20 +0000
Subject: Re: [patch] gpio: brcmstb: missing error code
Message-Id: <57116564.4000002@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160415144528.GC8953@mwanda>
In-Reply-To: <20160415144528.GC8953@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Gregory Fong <gregory.0xf0@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Brian Norris <computersforpeace@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org

On 15/04/16 07:45, Dan Carpenter wrote:
> We should set the error code before returning here.  Otherwise "err"
> could be uninitialized or zero.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Axel just sent an identical patch which Linus picked already:

http://www.spinics.net/lists/linux-gpio/msg13728.html

Thanks Dan!
-- 
Florian
