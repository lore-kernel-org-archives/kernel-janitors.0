From: David Miller <davem@davemloft.net>
Date: Mon, 17 Jun 2019 21:05:59 +0000
Subject: Re: [PATCH][next] net: hns3: fix dereference of ae_dev before it is null checked
Message-Id: <20190617.140559.2007026200675147689.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190617114214.25276-1-colin.king@canonical.com>
In-Reply-To: <20190617114214.25276-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Mon, 17 Jun 2019 12:42:14 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer ae_dev is null checked however, prior to that it is dereferenced
> when assigned pointer ops. Fix this by assigning pointer ops after ae_dev
> has been null checked.
> 
> Addresses-Coverity: ("Dereference before null check")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
