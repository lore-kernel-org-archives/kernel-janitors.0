From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 21 Mar 2016 12:30:13 +0000
Subject: Re: [patch] mfd: lp8788-irq: uninitialized variable in irq handler
Message-Id: <20160321123013.GW5273@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160311081139.GC31887@mwanda>
 <20160321115457.GH4140@x1>
In-Reply-To: <20160321115457.GH4140@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lee Jones <lee.jones@linaro.org>
Cc: Milo Kim <milo.kim@ti.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Gar, the truth is I'm never going to remember to capitalize patches for
you.  No one else has that rule.  Plus the last two times we had this
discussion the patches I was fixing were not capitalized either.

git log -p --author="Dan Carpenter" drivers/mfd | grep Fixes | head -n 2

regards,
dan carpenter

