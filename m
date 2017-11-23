From: David Miller <davem@davemloft.net>
Date: Thu, 23 Nov 2017 17:31:40 +0000
Subject: Re: [PATCH] bnxt_en: Fix an error handling path in 'bnxt_get_module_eeprom()'
Message-Id: <20171124.023140.2020403161571941972.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171121194649.11724-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20171121194649.11724-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: christophe.jaillet@wanadoo.fr
Cc: michael.chan@broadcom.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Date: Tue, 21 Nov 2017 20:46:49 +0100

> Error code returned by 'bnxt_read_sfp_module_eeprom_info()' is handled a
> few lines above when reading the A0 portion of the EEPROM.
> The same should be done when reading the A2 portion of the EEPROM.
> 
> In order to correctly propagate an error, update 'rc' in this 2nd call as
> well, otherwise 0 (success) is returned.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

Michael, please take a look at this.
