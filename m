From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 24 Sep 2020 12:40:30 +0000
Subject: Re: [PATCH] mfd: sm501: Fix leaks in probe()
Message-Id: <20200924124030.GK4678@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200911113326.GB367487@mwanda>
In-Reply-To: <20200911113326.GB367487@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Ben Dooks <ben@fluff.org.uk>, Andrew Morton <akpm@linux-foundation.org>, Vincent Sanders <vince@arm.linux.org.uk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 11 Sep 2020, Dan Carpenter wrote:

> This code should clean up if sm501_init_dev() fails.
> 
> Fixes: b6d6454fdb66 ("[PATCH] mfd: SM501 core driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mfd/sm501.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
