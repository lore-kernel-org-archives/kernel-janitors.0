From: Lee Jones <lee.jones@linaro.org>
Date: Fri, 20 Apr 2018 08:12:46 +0000
Subject: Re: [PATCH] regulator: ab8500: tidy ab8500_regulator_get_mode()
Message-Id: <20180420081246.zos5mblrna2bsj3l@dell>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180419100828.GA10724@mwanda>
In-Reply-To: <20180419100828.GA10724@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 19 Apr 2018, Dan Carpenter wrote:

> The indenting here is confusing.
> 
> Also we don't check "ret".  That isn't likely to cause a runtime issue
> because if it fails here fails then we'd probably return -EINVAL at the
> end anyway.  But it does introduce a static checker warning since "val"
> is only inititialized on the success path.
> 
>     drivers/regulator/ab8500.c:429 ab8500_regulator_get_mode()
>     error: uninitialized symbol 'val'.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
