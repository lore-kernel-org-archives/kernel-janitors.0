From: Kalle Valo <kvalo@codeaurora.org>
Date: Wed, 24 Jul 2019 11:56:24 +0000
Subject: Re: [PATCH wireless-drivers-next v2] mwifiex: use eth_broadcast_addr() to assign broadcast address
Message-Id: <20190724115624.85D4660237@smtp.codeaurora.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190724062545.119041-1-maowenan@huawei.com>
In-Reply-To: <20190724062545.119041-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>
Cc: amitkarwar@gmail.com, nishants@marvell.com, gbhat@marvell.com, huxinming820@gmail.com, linux-wireless@vger.kernel.org, kernel-janitors@vger.kernel.org

Mao Wenan <maowenan@huawei.com> wrote:

> This patch is to use eth_broadcast_addr() to assign broadcast address
> insetad of memcpy().
> 
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Patch applied to wireless-drivers-next.git, thanks.

15e830e90fde mwifiex: use eth_broadcast_addr() to assign broadcast address

-- 
https://patchwork.kernel.org/patch/11056129/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
