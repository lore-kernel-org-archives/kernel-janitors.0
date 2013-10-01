From: Guenter Roeck <linux@roeck-us.net>
Date: Tue, 01 Oct 2013 15:44:02 +0000
Subject: Re: [2/2] watchdog: ts72xx_wdt: locking bug in ioctl
Message-Id: <20131001154402.GA309@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130823084059.GE31293@elgon.mountain>
In-Reply-To: <20130823084059.GE31293@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wim Van Sebroeck <wim@iguana.be>, linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Aug 23, 2013 at 04:40:59PM -0000, Dan Carpenter wrote:
> Calling the WDIOC_GETSTATUS & WDIOC_GETBOOTSTATUS and twice will cause a
> interruptible deadlock.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
