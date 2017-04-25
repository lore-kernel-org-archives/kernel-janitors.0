From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Tue, 25 Apr 2017 10:50:53 +0000
Subject: Re: [PATCH] rtc: hid-sensor-time: remove some dead code
Message-Id: <20170425105053.3f23toe4sjocu4ni@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170412083253.GB3250@mwanda>
In-Reply-To: <20170412083253.GB3250@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, rtc-linux@googlegroups.com, kernel-janitors@vger.kernel.org

On 12/04/2017 at 11:32:53 +0300, Dan Carpenter wrote:
> devm_rtc_device_register() doesn't ever return NULL so there is no need
> to check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
