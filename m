From: David Miller <davem@davemloft.net>
Date: Sat, 24 Nov 2018 01:21:58 +0000
Subject: Re: [PATCH][V2] net: hinic: fix null pointer dereference on pointer hwdev
Message-Id: <20181123.172158.1646655822759438209.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181122100501.15906-1-colin.king@canonical.com>
In-Reply-To: <20181122100501.15906-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: colin.king@canonical.com
Cc: aviad.krawczyk@huawei.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org, sergei.shtylyov@cogentembedded.com, linux-kernel@vger.kernel.org

From: Colin King <colin.king@canonical.com>
Date: Thu, 22 Nov 2018 10:05:01 +0000

> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer hwdev is being dereferenced when declaring hwif , however, later
> on hwdev is being null checked, hence we have dereference before null
> check error. Fix this by assigning hwif and pdef only once hwdev has
> been null checked.
> 
> Detected by CoverityScan, CID#1485581 ("Dereference before null check")
> 
> Fixes: 4a61abb100c8 ("net-next/hinic:add rx checksum offload for HiNIC")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied to net-next.
