From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 23 Jul 2020 16:18:21 +0000
Subject: Re: [PATCH] mfd: max14577: remove redundant initialization of variable current_bits
Message-Id: <20200723161821.GA31365@kozik-lap>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200723161541.994669-1-colin.king@canonical.com>
In-Reply-To: <20200723161541.994669-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Lee Jones <lee.jones@linaro.org>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Jul 23, 2020 at 05:15:41PM +0100, Colin King wrote:
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

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
