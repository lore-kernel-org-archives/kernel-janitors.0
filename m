From: John Stultz <johnstul@us.ibm.com>
Date: Tue, 13 Nov 2012 19:05:33 +0000
Subject: Re: [patch] clocksource: clean up parse_pmtmr()
Message-Id: <50A299FD.2060409@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121020034948.GV5685@mwanda>
In-Reply-To: <20121020034948.GV5685@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 10/19/2012 09:46 PM, Dan Carpenter wrote:
> I changed the strict_strtoul() to kstrtouint().  That has the check
> for UINT_MAX built in to it so the ifdefs can be removed.  Also
> I changed a printk() to pr_info().
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Applied. Thanks!
-john

