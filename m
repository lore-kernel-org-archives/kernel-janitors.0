From: Vinod Koul <vkoul@kernel.org>
Date: Sat, 06 Feb 2021 10:15:31 +0000
Subject: Re: [PATCH] phy: qcom-qmp: make a const array static, makes object smaller
Message-Id: <20210206100331.GK2656@vkoul-mobl.Dlink>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210204180313.108876-1-colin.king@canonical.com>
In-Reply-To: <20210204180313.108876-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Kishon Vijay Abraham I <kishon@ti.com>, linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 04-02-21, 18:03, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Don't populate the const array cfg1_settings on the stack but instead make
> it static. Makes the object code smaller by 24 bytes:
> 
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   73585	  20240	     64	  93889	  16ec1	drivers/phy/qualcomm/phy-qcom-qmp.o
> 
> After:
>    text	   data	    bss	    dec	    hex	filename
>   73465	  20336	     64	  93865	  16ea9	drivers/phy/qualcomm/phy-qcom-qmp.o
> 
> (gcc version 10.2.0)

Applied, thanks

-- 
~Vinod
