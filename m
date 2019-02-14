From: David Miller <davem@davemloft.net>
Date: Thu, 14 Feb 2019 06:13:23 +0000
Subject: Re: [PATCH net] net: dsa: bcm_sf2: potential array overflow in bcm_sf2_sw_suspend()
Message-Id: <20190213.221323.1768150771970232999.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190213082304.GA14113@kadam>
In-Reply-To: <20190213082304.GA14113@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: andrew@lunn.ch, f.fainelli@gmail.com, vivien.didelot@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 13 Feb 2019 11:23:04 +0300

> The value of ->num_ports comes from bcm_sf2_sw_probe() and it is less
> than or equal to DSA_MAX_PORTS.  The ds->ports[] array is used inside
> the dsa_is_user_port() and dsa_is_cpu_port() functions.  The ds->ports[]
> array is allocated in dsa_switch_alloc() and it has ds->num_ports
> elements so this leads to a static checker warning about a potential out
> of bounds read.
> 
> Fixes: 8cfa94984c9c ("net: dsa: bcm_sf2: add suspend/resume callbacks")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
