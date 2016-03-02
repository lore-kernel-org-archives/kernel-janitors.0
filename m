From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Wed, 02 Mar 2016 23:36:09 +0000
Subject: Re: [patch] rtc: ds1685: passing bogus values to irq_restore
Message-Id: <20160302233609.GC2567@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160302100745.GB5533@mwanda>
In-Reply-To: <20160302100745.GB5533@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Joshua Kinard <kumba@gentoo.org>, Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 02/03/2016 at 13:07:45 +0300, Dan Carpenter wrote :
> We call spin_lock_irqrestore with "flags" set to zero instead of to the
> value from spin_lock_irqsave().
> 
> Fixes: aaaf5fbf56f1 ('rtc: add driver for DS1685 family of real time clocks')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/drivers/rtc/rtc-ds1685.c b/drivers/rtc/rtc-ds1685.c
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
