From: David Miller <davem@davemloft.net>
Date: Mon, 24 Feb 2020 19:21:43 +0000
Subject: Re: [PATCH][V2] net: hns3: remove redundant initialization of pointer 'client'
Message-Id: <20200224.112143.2283025986833354811.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200224192022.407524-1-colin.king@canonical.com>
In-Reply-To: <20200224192022.407524-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, tanhuazhong@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 24 Feb 2020 19:20:22 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer 'client' is being initialized with a value that is never
> read, it is being updated later on. The initialization is redundant
> and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
> 
> V2: use reverse christmas tree ordering of local variables

Applied to net-next, thanks Colin.
