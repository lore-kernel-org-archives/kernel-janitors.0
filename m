From: Huazhong Tan <tanhuazhong@huawei.com>
Date: Tue, 15 Dec 2020 01:34:45 +0000
Subject: Re: [PATCH][next] net: hns3: fix expression that is currently always true
Message-Id: <0b0cca1c-1208-c5b3-914b-314dcb484209@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201215000033.85383-1-colin.king@canonical.com>
In-Reply-To: <20201215000033.85383-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Jian Shen <shenjian15@huawei.com>, netdev@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


On 2020/12/15 8:00, Colin King wrote:
> From: Colin Ian King<colin.king@canonical.com>
>
> The ||  condition in hdev->fd_active_type != HCLGE_FD_ARFS_ACTIVE ||
> hdev->fd_active_type != HCLGE_FD_RULE_NONE will always be true because
> hdev->fd_active_type cannot be equal to two different values at the same
> time. The expression is always true which is not correct. Fix this by
> replacing || with && to correct the logic in the expression.
>
> Addresses-Coverity: ("Constant expression result")
> Fixes: 0205ec041ec6 ("net: hns3: add support for hw tc offload of tc flower")
> Signed-off-by: Colin Ian King<colin.king@canonical.com>

Reviewed-by: Huazhong Tan <tanhuazhong@huawei.com>

Thanks.
