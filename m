From: Guenter Roeck <linux@roeck-us.net>
Date: Wed, 11 Feb 2015 14:01:25 +0000
Subject: Re: [patch] watchdog: mtk_wdt: signedness bug in mtk_wdt_start()
Message-Id: <54DB60B5.4040403@roeck-us.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150211102621.GC18515@mwanda>
In-Reply-To: <20150211102621.GC18515@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Wim Van Sebroeck <wim@iguana.be>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-watchdog@vger.kernel.org, kernel-janitors@vger.kernel.org

On 02/11/2015 02:26 AM, Dan Carpenter wrote:
> "ret" should be signed for the error handling to work correctly.  This
> doesn't matter much in real life since mtk_wdt_set_timeout() always
> succeeds.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

