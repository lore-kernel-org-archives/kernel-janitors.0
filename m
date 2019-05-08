From: David Miller <davem@davemloft.net>
Date: Wed, 08 May 2019 16:44:48 +0000
Subject: Re: [PATCH] net: hns3: remove redundant assignment of l2_hdr to itself
Message-Id: <20190508.094448.2122383359846407940.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190508105135.13170-1-colin.king@canonical.com>
In-Reply-To: <20190508105135.13170-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Wed,  8 May 2019 11:51:35 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer l2_hdr is being assigned to itself, this is redundant
> and can be removed.
> 
> Addresses-Coverity: ("Evaluation order violation")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
