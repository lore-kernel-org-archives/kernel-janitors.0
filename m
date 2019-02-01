From: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 01 Feb 2019 05:06:02 +0000
Subject: Re: [PATCH -next] soc: bcm: bcm2835-pm: Make local symbol static
Message-Id: <20190201050602.27265-1-f.fainelli@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1547617457-60066-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1547617457-60066-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bcm-kernel-feedback-list@broadcom.com, Wei Yongjun <weiyongjun1@huawei.com>, Eric Anholt <eric@anholt.net>, Stefan Wahren <stefan.wahren@i2se.com>, Ray Jui <rjui@broadcom.com>, =?iso-8859-1?q?Scott=0A?= Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>
Cc: kernel-janitors@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On Wed, 16 Jan 2019 05:44:17 +0000, Wei Yongjun <weiyongjun1@huawei.com> wrote:
> Fixes the following sparse warning:
> 
> drivers/soc/bcm/bcm2835-power.c:556:32: warning:
>  symbol 'bcm2835_reset_ops' was not declared. Should it be static?
> 
> Fixes: 670c672608a1 ("soc: bcm: bcm2835-pm: Add support for power domains under a new binding.")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---

Applied to drivers/next, thanks!
--
Florian
