From: Guenter Roeck <linux@roeck-us.net>
Date: Tue, 01 Oct 2013 15:39:30 +0000
Subject: Re: watchdog: ts72xx_wdt: cleanup return codes in ioctl
Message-Id: <20131001153930.GA25875@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130823093832.GL31293@elgon.mountain>
In-Reply-To: <20130823093832.GL31293@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 23, 2013 at 05:38:32PM -0000, Dan Carpenter wrote:
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
> 
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
