From: Johannes Berg <johannes@sipsolutions.net>
Date: Thu, 22 Aug 2019 16:55:07 +0000
Subject: Re: [PATCH] bcma: fix incorrect update of BCMA_CORE_PCI_MDIO_DATA
Message-Id: <fe3e6a33692a07d15287800749b688e796c43f9a.camel@sipsolutions.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190822133524.6274-1-colin.king@canonical.com>
         (sfid-20190822_153601_850332_39AACB50)
In-Reply-To: <20190822133524.6274-1-colin.king@canonical.com> (sfid-20190822_153601_850332_39AACB50)
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>, linux-wireless@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 2019-08-22 at 14:35 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> An earlier commit re-worked the setting of the bitmask and is now
> assigning v with some bit flags rather than bitwise or-ing them
> into v, consequently the earlier bit-settings of v are being lost.
> Fix this by replacing an assignment with the bitwise or instead.
> 
> Addresses-Coverity: ("Unused value")
> Fixes: 2be25cac8402 ("bcma: add constants for PCI and use them")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/bcma/driver_pci.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bcma/driver_pci.c b/drivers/bcma/driver_pci.c
> index f499a469e66d..d219ee947c07 100644
> --- a/drivers/bcma/driver_pci.c
> +++ b/drivers/bcma/driver_pci.c
> @@ -78,7 +78,7 @@ static u16 bcma_pcie_mdio_read(struct bcma_drv_pci *pc, u16 device, u8 address)
>  		v |= (address << BCMA_CORE_PCI_MDIODATA_REGADDR_SHF_OLD);
>  	}
>  
> -	v = BCMA_CORE_PCI_MDIODATA_START;
> +	v |= BCMA_CORE_PCI_MDIODATA_START;

The same bug/issue is in bcma_pcie_mdio_write() btw.

It *seems* correct to me - otherwise the "address" parameter to the
function is entirely unused, which can't really be right.

There are only two code paths that ever get here:
 * bcma_pcicore_serdes_workaround
 * bcma_core_pci_power_save

The register at 0 is BCMA_CORE_PCI_CTL, which only has a few bits so
even bad values written there by accident might not hurt much ...

So it seems possible that it was just always broken.

johannes
