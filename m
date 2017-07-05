From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Date: Wed, 05 Jul 2017 21:09:27 +0000
Subject: Re: [PATCH] rtc: rtc-nuc900: fix loop timeout test
Message-Id: <20170705210927.uajd2c5hqz7rb5on@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623082900.GB7922@elgon.mountain>
In-Reply-To: <20170623082900.GB7922@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wan ZongShun <mcuos.com@gmail.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org

On 23/06/2017 at 11:29:00 +0300, Dan Carpenter wrote:
> We should change this post-op to a pre-op because we want the loop to
> exit with "timeout" set to zero.
> 
> Fixes: 0a89b55364e0 ("nuc900/rtc: change the waiting for device ready implement")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
