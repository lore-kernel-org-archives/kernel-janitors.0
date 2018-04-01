From: David Miller <davem@davemloft.net>
Date: Sun, 01 Apr 2018 03:21:10 +0000
Subject: Re: [PATCH net-next] vlan: vlan_hw_filter_capable() can be static
Message-Id: <20180331.232110.214944125061454087.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1522476701-93237-1-git-send-email-weiyongjun1@huawei.com>
In-Reply-To: <1522476701-93237-1-git-send-email-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: weiyongjun1@huawei.com
Cc: Vishakha.Narvekar@dell.com, makita.toshiaki@lab.ntt.co.jp, kstewart@linuxfoundation.org, tariqt@mellanox.com, galp@mellanox.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>
Date: Sat, 31 Mar 2018 06:11:41 +0000

> Fixes the following sparse warning:
> 
> net/8021q/vlan_core.c:168:6: warning:
>  symbol 'vlan_hw_filter_capable' was not declared. Should it be static?
> 
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied, thank you.
