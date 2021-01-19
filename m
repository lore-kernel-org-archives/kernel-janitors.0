From: Florian Fainelli <f.fainelli@gmail.com>
Date: Tue, 19 Jan 2021 17:14:03 +0000
Subject: Re: [PATCH net] net: dsa: b53: fix an off by one in checking "vlan->vid"
Message-Id: <44c35bd8-b7c3-49be-3a67-e9b1c8a02617@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YAbxI97Dl/pmBy5V@mwanda>
In-Reply-To: <YAbxI97Dl/pmBy5V@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



On 1/19/2021 6:48 AM, Dan Carpenter wrote:
> The > comparison should be >= to prevent accessing one element beyond
> the end of the dev->vlans[] array in the caller function, b53_vlan_add().
> The "dev->vlans" array is allocated in the b53_switch_init() function
> and it has "dev->num_vlans" elements.
> 
> Fixes: a2482d2ce349 ("net: dsa: b53: Plug in VLAN support")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
