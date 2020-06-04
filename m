From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 04 Jun 2020 07:41:01 +0000
Subject: Re: [PATCH] mailbox: mailbox-test: Fix a potential Oops on allocation failure
Message-Id: <20200604074101.GV3714@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200603103329.GB1845750@mwanda>
In-Reply-To: <20200603103329.GB1845750@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 03 Jun 2020, Dan Carpenter wrote:

> The callers are expecting NULL on error so if we return an error pointer
> it eventually results in an Oops.
> 
> Fixes: 8ea4484d0c2b ("mailbox: Add generic mechanism for testing Mailbox Controllers")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/mailbox/mailbox-test.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
