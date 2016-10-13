From: David Miller <davem@davemloft.net>
Date: Thu, 13 Oct 2016 16:12:29 +0000
Subject: Re: [patch -next] net: rtnl: info leak in rtnl_fill_vfinfo()
Message-Id: <20161013.121229.1557386309718710932.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161013084528.GA16198@mwanda>
In-Reply-To: <20161013084528.GA16198@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: moshe@mellanox.com, roopa@cumulusnetworks.com, nicolas.dichtel@6wind.com, nikolay@cumulusnetworks.com, edumazet@google.com, hannes@stressinduktion.org, nogahf@mellanox.com, bblanco@plumgrid.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 13 Oct 2016 11:45:28 +0300

> The "vf_vlan_info" struct ends with a 2 byte struct hole so we have to
> memset it to ensure that no stack information is revealed to user space.
> 
> Fixes: 79aab093a0b5 ('net: Update API for VF vlan protocol 802.1ad support')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
