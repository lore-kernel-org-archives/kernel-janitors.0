From: David Miller <davem@davemloft.net>
Date: Fri, 01 Feb 2019 17:59:33 +0000
Subject: Re: [PATCH net] ethtool: remove unnecessary check in ethtool_get_regs()
Message-Id: <20190201.095933.386906135442329993.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190201082406.GA8459@kadam>
In-Reply-To: <20190201082406.GA8459@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: linyunsheng@huawei.com, f.fainelli@gmail.com, wang6495@umn.edu, borisp@mellanox.com, ilyal@mellanox.com, ecree@solarflare.com, mkubecek@suse.cz, ynorov@caviumnetworks.com, jakub.kicinski@netronome.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 1 Feb 2019 11:24:06 +0300

> We recently changed this function in commit f9fc54d313fa ("ethtool:
> check the return value of get_regs_len") such that if "reglen" is zero
> we return directly.  That means we can remove this condition as well.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied to net-next, thanks.
