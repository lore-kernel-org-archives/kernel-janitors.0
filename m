From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 23 Jul 2020 17:21:41 +0000
Subject: Re: [PATCH] mfd: max14577: remove redundant initialization of variable current_bits
Message-Id: <20200723172141.GB1126023@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200723161541.994669-1-colin.king@canonical.com>
In-Reply-To: <20200723161541.994669-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Colin King <colin.king@canonical.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 23 Jul 2020, Colin King wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable current_bits is being initialized with a value that is
> never read and it is being updated later with a new value. The
> initialization is redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/mfd/max14577.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
