From: David Miller <davem@davemloft.net>
Date: Wed, 06 Nov 2019 02:02:00 +0000
Subject: Re: [PATCH] net: hns3: remove unused macros
Message-Id: <20191105.180200.375431647174027237.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191103131538.25234-1-colin.king@canonical.com>
In-Reply-To: <20191103131538.25234-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, tanhuazhong@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sun,  3 Nov 2019 13:15:38 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The macros HCLGE_MPF_ENBALE and HCLGEVF_MPF_ENBALE are defined but never
> used.  I was going to fix the spelling mistake "ENBALE" -> "ENABLE" but
> found these macros are not used, so they can be removed.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
