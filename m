From: Kalle Valo <kvalo@codeaurora.org>
Date: Thu, 09 Aug 2018 15:14:03 +0000
Subject: Re: [PATCH] rsi: remove redundant variables bss, wh and temp_flash_content
Message-Id: <20180809151403.BF64160B23@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180803074636.20479-1-colin.king@canonical.com>
In-Reply-To: <20180803074636.20479-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, Amitkumar Karwar <amit.karwar@redpinesignals.com>, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> Variables bss, wh and temp_flash_content are being assigned but are
> never used hence they are redundant and can be removed.
> 
> Cleans up clang warnings:
> warning: variable 'bss' set but not used [-Wunused-but-set-variable]
> warning: variable 'wh' set but not used [-Wunused-but-set-variable]
> warning: variable 'temp_flash_content' set but not used
>  [-Wunused-but-set-variable]
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Patch applied to wireless-drivers-next.git, thanks.

35204d0aa83f rsi: remove redundant variables bss, wh and temp_flash_content

-- 
https://patchwork.kernel.org/patch/10554759/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

