From: David Miller <davem@davemloft.net>
Date: Tue, 13 Jun 2017 17:56:19 +0000
Subject: Re: [PATCH][netdev-next] net: hns: make guid hns_dsaf_acpi_dsm_guid static
Message-Id: <20170613.135619.350474759117231721.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170613130321.7797-1-colin.king@canonical.com>
In-Reply-To: <20170613130321.7797-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, huangdaode@hisilicon.com, yankejian@huawei.com, andriy.shevchenko@linux.intel.com, oulijun@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Tue, 13 Jun 2017 14:03:21 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The guid hns_dsaf_acpi_dsm_guid does not need to be in global
> scope, so make it static.
> 
> Cleans up sparse warning:
> "symbol 'hns_dsaf_acpi_dsm_guid' was not declared. Should it be static?"
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

That symbol doesn't even exist in th net-next tree.
