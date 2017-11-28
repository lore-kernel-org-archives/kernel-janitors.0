From: David Miller <davem@davemloft.net>
Date: Tue, 28 Nov 2017 15:56:02 +0000
Subject: Re: [PATCH] bnxt_en: Fix an error handling path in 'bnxt_get_module_eeprom()'
Message-Id: <20171128.105602.879657812684686339.davem@davemloft.net>
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

Patch applied, thanks Chrisophe.

I cannot see any legitimate reason to ignore errors returned here, as
an error would mean a partial read back of the data to the caller.
