From: David Miller <davem@redhat.com>
Date: Sun, 01 Sep 2019 19:12:32 +0000
Subject: Re: [PATCH][next] net: hns3: remove redundant assignment to pointer reg_info
Message-Id: <20190901.121232.2071064498490409022.davem@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190831072949.7505-1-colin.king@canonical.com>
In-Reply-To: <20190831072949.7505-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: yisen.zhuang@huawei.com, salil.mehta@huawei.com, tanhuazhong@huawei.com, liuzhongzhu@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Sat, 31 Aug 2019 08:29:49 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer reg_info is being initialized with a value that is never read and
> is being re-assigned a little later on. The assignment is redundant
> and hence can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
