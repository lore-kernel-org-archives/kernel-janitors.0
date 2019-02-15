From: Florian Fainelli <f.fainelli@gmail.com>
Date: Fri, 15 Feb 2019 00:31:36 +0000
Subject: Re: [PATCH net] net: dsa: bcm_sf2: potential array overflow in bcm_sf2_sw_suspend()
Message-Id: <34584cb4-f012-c7c1-6cc9-6bbede46109b@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190213082304.GA14113@kadam>
 <20190213.221323.1768150771970232999.davem@davemloft.net>
In-Reply-To: <20190213.221323.1768150771970232999.davem@davemloft.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Miller <davem@davemloft.net>, dan.carpenter@oracle.com
Cc: andrew@lunn.ch, vivien.didelot@gmail.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On 2/13/19 10:13 PM, David Miller wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
> Date: Wed, 13 Feb 2019 11:23:04 +0300
> 
>> The value of ->num_ports comes from bcm_sf2_sw_probe() and it is less
>> than or equal to DSA_MAX_PORTS.  The ds->ports[] array is used inside
>> the dsa_is_user_port() and dsa_is_cpu_port() functions.  The ds->ports[]
>> array is allocated in dsa_switch_alloc() and it has ds->num_ports
>> elements so this leads to a static checker warning about a potential out
>> of bounds read.

This would not happen here because bcm_sf2 calls b53_switch_alloc()
which does allocate the full port range (not for a good reason), but
it's good to fix that anyways.

>>
>> Fixes: 8cfa94984c9c ("net: dsa: bcm_sf2: add suspend/resume callbacks")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Applied.
> 


-- 
Florian
