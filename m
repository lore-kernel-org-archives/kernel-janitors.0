From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Fri, 03 Apr 2020 09:22:45 +0000
Subject: Re: [PATCH][V2][next] rtc: ds1307: check for failed memory allocation on wdt
Message-Id: <20200403092245.GR3683@piout.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200402135201.548313-1-colin.king@canonical.com>
 <c6fe9db8-3e27-b6fc-fff7-131cecad3f88@roeck-us.net>
 <20200402145312.GN3683@piout.net>
 <20200403084504.GZ2001@kadam>
In-Reply-To: <20200403084504.GZ2001@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Colin King <colin.king@canonical.com>, Alessandro Zummo <a.zummo@towertech.it>, Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 03/04/2020 11:45:04+0300, Dan Carpenter wrote:
> On Thu, Apr 02, 2020 at 04:53:12PM +0200, Alexandre Belloni wrote:
> > 
> > As stated, I also prefer keeping the watchdog optional and ignore the
> > error.
> 
> Hopefully you aren't running out of memory on start up.  In current
> kernels small memory allocations like this never fail so it doesn't
> really affect runtime.  It only silences the NULL dereference static
> checker warning.
> 

Yes, so the

if (!wdt)
 return;

would be enough instead of introducing unnecessary error handling.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
