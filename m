From: Igor Russkikh <igor.russkikh@aquantia.com>
Date: Fri, 11 May 2018 12:40:43 +0000
Subject: Re: [PATCH][next] net: aquantia: fix unsigned numvecs comparison with less than zero
Message-Id: <a6f112f6-d3f3-4294-0b3a-5f8e440d474c@aquantia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180510125201.19707-1-colin.king@canonical.com>
 <20180510.175358.1296757435086922873.davem@davemloft.net>
In-Reply-To: <20180510.175358.1296757435086922873.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>, colin.king@canonical.com
Cc: pavel.belous@aquantia.com, weiyongjun1@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


>> Fixes: a09bd81b5413 ("net: aquantia: Limit number of vectors to actually allocated irqs")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> 
> This doesn't apply to net-next.
> 

Colin, believe thats because you should target to net, not net-next.

BR, Igor
