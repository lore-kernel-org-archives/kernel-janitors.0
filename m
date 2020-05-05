From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Date: Tue, 05 May 2020 11:42:15 +0000
Subject: Re: [PATCH] PCI: altera: clean up indentation issue on a return statement
Message-Id: <20200505114215.GE12543@e121166-lin.cambridge.arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200327134556.265411-1-colin.king@canonical.com>
In-Reply-To: <20200327134556.265411-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Ley Foon Tan <ley.foon.tan@intel.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>, Bjorn Helgaas <bhelgaas@google.com>, rfi@lists.rocketboards.org, linux-pci@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Mar 27, 2020 at 01:45:56PM +0000, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> A return statment is indented incorrectly, remove extraneous space.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/pci/controller/pcie-altera.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to pci/altera, thanks.

Lorenzo

> diff --git a/drivers/pci/controller/pcie-altera.c b/drivers/pci/controller/pcie-altera.c
> index b447c3e4abad..24cb1c331058 100644
> --- a/drivers/pci/controller/pcie-altera.c
> +++ b/drivers/pci/controller/pcie-altera.c
> @@ -193,7 +193,7 @@ static bool altera_pcie_valid_device(struct altera_pcie *pcie,
>  	if (bus->number = pcie->root_bus_nr && dev > 0)
>  		return false;
>  
> -	 return true;
> +	return true;
>  }
>  
>  static int tlp_read_packet(struct altera_pcie *pcie, u32 *value)
> -- 
> 2.25.1
> 
