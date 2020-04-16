From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 16 Apr 2020 10:14:39 +0000
Subject: Re: [PATCH] mfd: tqmx86: Fix a typo in MODULE_DESCRIPTION
Message-Id: <20200416101439.GD2167633@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200412213047.4827-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200412213047.4827-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: andrew@lunn.ch, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 12 Apr 2020, Christophe JAILLET wrote:

> Based on the file name and code of the driver, it is likely that this
> module is related to TQMx86 and not TQx86.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/mfd/tqmx86.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
