From: Vivien Didelot <vivien.didelot@gmail.com>
Date: Wed, 13 Feb 2019 13:13:13 +0000
Subject: Re: [PATCH net] net: dsa: bcm_sf2: potential array overflow in bcm_sf2_sw_suspend()
Message-Id: <20190213081313.GB26654@t480s.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190213082304.GA14113@kadam>
In-Reply-To: <20190213082304.GA14113@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 13 Feb 2019 11:23:04 +0300, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> The value of ->num_ports comes from bcm_sf2_sw_probe() and it is less
> than or equal to DSA_MAX_PORTS.  The ds->ports[] array is used inside
> the dsa_is_user_port() and dsa_is_cpu_port() functions.  The ds->ports[]
> array is allocated in dsa_switch_alloc() and it has ds->num_ports
> elements so this leads to a static checker warning about a potential out
> of bounds read.
> 
> Fixes: 8cfa94984c9c ("net: dsa: bcm_sf2: add suspend/resume callbacks")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Vivien Didelot <vivien.didelot@gmail.com>
