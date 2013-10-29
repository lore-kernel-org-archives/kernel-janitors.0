From: Wim Van Sebroeck <wim@iguana.be>
Date: Tue, 29 Oct 2013 07:44:26 +0000
Subject: Re: [patch] watchdog: ts72xx_wdt: cleanup return codes in ioctl
Message-Id: <20131029074426.GA19704@spo001.leaseweb.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130823093832.GL31293@elgon.mountain>
In-Reply-To: <20130823093832.GL31293@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org

Hi Dan,

> There seems to be some confusion here which functions return positive
> numbers and which return negative error codes.
> 
> copy_to_user() returns the number of bytes remaining to be copied but we
> want to return -EFAULT.
> 
> The rest is just clean up.  get_user() actually returns zero on success
> and -EFAULT on error so we can preserve the error code.  The
> timeout_to_regval() function returns -EINVAL on failure, but we can
> propogate that back instead of hardcoding -EINVAL ourselves.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

This patch has been added to linux-watchdog-next.

Kind regards,
Wim.

