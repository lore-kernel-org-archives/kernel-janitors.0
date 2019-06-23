From: David Miller <davem@davemloft.net>
Date: Sun, 23 Jun 2019 18:08:35 +0000
Subject: Re: [PATCH][net-next] hinic: fix dereference of pointer hwdev before it is null checked
Message-Id: <20190623.110835.523516058927476452.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190620132751.26438-1-colin.king@canonical.com>
In-Reply-To: <20190620132751.26438-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: xuechaojing@huawei.com, aviad.krawczyk@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 20 Jun 2019 14:27:51 +0100

> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently pointer hwdev is dereferenced when assigning hwif before
> hwdev is null checked.  Fix this by only derefencing hwdev after the
> null check.
> 
> Addresses-Coverity: ("Dereference before null check")
> Fixes: 4fdc51bb4e92 ("hinic: add support for rss parameters with ethtool")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.
