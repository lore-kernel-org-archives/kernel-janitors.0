From: Lee Jones <lee.jones@linaro.org>
Date: Thu, 15 Mar 2018 08:16:47 +0000
Subject: Re: [PATCH] mfd: pcf50633: Fix some memory leaks in the error handling path of 'pcf50633_probe()'
Message-Id: <20180315081647.nmchuykgsgma2kyp@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180314214755.25853-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20180314214755.25853-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 14 Mar 2018, Christophe JAILLET wrote:

> If a 'platform_device_alloc()' call fails, we still need to release the
> resources that have already been allocated before returning.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/mfd/pcf50633-core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
