From: Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Tue, 27 Oct 2020 11:32:32 +0000
Subject: Re: [PATCH] rtc: pcf2127: fix pcf2127_nvmem_read/write() returns
Message-Id: <160379780345.96488.3985201259905259323.b4-ty@bootlin.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201022070451.GA2817669@mwanda>
In-Reply-To: <20201022070451.GA2817669@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Alessandro Zummo <a.zummo@towertech.it>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, kernel-janitors@vger.kernel.org, linux-rtc@vger.kernel.org

On Thu, 22 Oct 2020 10:04:51 +0300, Dan Carpenter wrote:
> These functions should return zero on success.  Non-zero returns are
> treated as error.  On some paths, this doesn't matter but in
> nvmem_cell_read() a non-zero return would be passed to ERR_PTR() and
> lead to an Oops.

Applied, thanks!

[1/1] rtc: pcf2127: fix pcf2127_nvmem_read/write() returns
      commit: ba1c30bf3f2536f248d262c6f257b5a787305991

Best regards,
-- 
Alexandre Belloni <alexandre.belloni@bootlin.com>
