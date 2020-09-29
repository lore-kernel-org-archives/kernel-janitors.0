From: Florian Fainelli <f.fainelli@gmail.com>
Date: Tue, 29 Sep 2020 16:45:57 +0000
Subject: Re: [bug report] net: vlan: Avoid using BUG() in vlan_proto_idx()
Message-Id: <46958e70-0236-cc9f-71fa-e71584ec5b1b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200929092808.GA485919@mwanda>
In-Reply-To: <20200929092808.GA485919@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



On 9/29/2020 2:28 AM, Dan Carpenter wrote:
> Hello Florian Fainelli,
> 
> The patch d0186842ec5f: "net: vlan: Avoid using BUG() in
> vlan_proto_idx()" from Sep 24, 2020, leads to the following static
> checker warning:
> 
> 	net/8021q/vlan.c:60 vlan_group_prealloc_vid()
> 	warn: unsigned 'pidx' is never less than zero.

Fixed with:

https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/commit/?id75c285ea65540cccae64c87dfc7a00c7ede03a

Thanks
-- 
Florian
