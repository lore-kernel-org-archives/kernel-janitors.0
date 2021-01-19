From: Florian Fainelli <f.fainelli@gmail.com>
Date: Tue, 19 Jan 2021 17:47:38 +0000
Subject: Re: [PATCH net-next] net: dsa: Fix off by one in dsa_loop_port_vlan_add()
Message-Id: <dd234f6a-7b30-09a8-df14-e0243d2e9304@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <YAbyb5kBJQlpYCs2@mwanda>
In-Reply-To: <YAbyb5kBJQlpYCs2@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: ", Andrew Lunn" <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org



On 1/19/2021 6:53 AM, Dan Carpenter wrote:
> The > comparison is intended to be >= to prevent reading beyond the
> end of the ps->vlans[] array.  It doesn't affect run time though because
> the ps->vlans[] array has VLAN_N_VID (4096) elements and the vlan->vid
> cannot be > 4094 because it is checked earlier.
> 
> Fixes: 98cd1552ea27 ("net: dsa: Mock-up driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
