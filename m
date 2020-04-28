From: Lee Jones <lee.jones@linaro.org>
Date: Tue, 28 Apr 2020 10:39:22 +0000
Subject: Re: [PATCH] mfd: wcd934x: Drop kfree for memory allocated with devm_kzalloc
Message-Id: <20200428103922.GS3559@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427110805.154447-1-weiyongjun1@huawei.com>
 <20200427122922.56643-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427122922.56643-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 27 Apr 2020, Wei Yongjun wrote:

> It's not necessary to free memory allocated with devm_kzalloc
> and using kfree leads to a double free.
> 
> Fixes: 6ac7e4d7ad70 ("mfd: wcd934x: Add support to wcd9340/wcd9341 codec")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/mfd/wcd934x.c | 1 -
>  1 file changed, 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
