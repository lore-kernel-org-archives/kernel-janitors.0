From: David Miller <davem@davemloft.net>
Date: Sun, 07 Apr 2019 01:29:35 +0000
Subject: Re: [PATCH][next] net: hns: fix unsigned comparison to less than zero
Message-Id: <20190406.182935.1539123668739096067.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190405135916.1621-1-colin.king@canonical.com>
In-Reply-To: <20190405135916.1621-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, liuyonglong@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Fri,  5 Apr 2019 14:59:16 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently mskid is unsigned and hence comparisons with negative
> error return values are always false. Fix this by making mskid an
> int.
> 
> Fixes: f058e46855dc ("net: hns: fix ICMP6 neighbor solicitation messages discard problem")
> Addresses-Coverity: ("Operands don't affect result")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
