From: Andrew Lunn <andrew@lunn.ch>
Date: Fri, 04 Jan 2019 13:11:46 +0000
Subject: Re: [PATCH] watchdog: tqmx86: Fix a couple IS_ERR() vs NULL bugs
Message-Id: <20190104131146.GA11435@lunn.ch>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190104064725.GC30627@kadam>
In-Reply-To: <20190104064725.GC30627@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jan 04, 2019 at 09:47:25AM +0300, Dan Carpenter wrote:
> These functions return NULL on error but we accidentally check
> for IS_ERR() instead.
> 
> Fixes: e3c21e088f89 ("watchdog: tqmx86: Add watchdog driver for the IO controller")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
