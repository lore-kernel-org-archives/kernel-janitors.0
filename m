From: Florian Fainelli <f.fainelli@gmail.com>
Date: Mon, 22 Jan 2018 23:09:48 +0000
Subject: Re: [PATCH -next] hwrng: bcm2835 - Remove redundant dev_err call in bcm2835_rng_probe()
Message-Id: <2f6aedf1-4712-73b9-6012-349cdcc2605a@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1516189234-11957-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1516189234-11957-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On 01/17/2018 03:40 AM, Wei Yongjun wrote:
> There is a error message within devm_ioremap_resource
> already, so remove the dev_err call to avoid redundant
> error message.
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
