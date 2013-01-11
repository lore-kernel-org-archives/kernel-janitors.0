From: David Miller <davem@davemloft.net>
Date: Fri, 11 Jan 2013 07:00:43 +0000
Subject: Re: [patch] tg3: missing break statement in tg3_get_5720_nvram_info()
Message-Id: <20130110.230043.734496375588063177.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130111065733.GG13207@elgon.mountain>
In-Reply-To: <20130111065733.GG13207@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: mchan@broadcom.com, mcarlson@broadcom.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, netdev@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 Jan 2013 09:57:33 +0300

> There is a missing break statement so FLASH_5762_EEPROM_HD gets treated
> like FLASH_5762_EEPROM_LD.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied, thanks Dan.
