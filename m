From: walter harms <wharms@bfs.de>
Date: Fri, 02 Mar 2012 09:00:06 +0000
Subject: Re: [patch] edac i5000: fix pointer math in i5000_get_mc_regs()
Message-Id: <4F508C16.30900@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120302065441.GB24508@elgon.mountain>
In-Reply-To: <20120302065441.GB24508@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Eric Wollesen <ericw@xmtp.net>, Doug Thompson <dougthompson@xmission.com>, list-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org



Am 02.03.2012 07:54, schrieb Dan Carpenter:
> "pvt->ambase" is a u64 datatype.  The intent here is to fill the first
> half in the first call to pci_read_config_dword() and the other half in
> the second.  Unfortunately the pointer math is wrong so we set the wrong
> data.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> I don't have the hardware to test this.  Please review carefully.
> 
> diff --git a/drivers/edac/i5000_edac.c b/drivers/edac/i5000_edac.c
> index 4dc3ac2..fcdc4ab 100644
> --- a/drivers/edac/i5000_edac.c
> +++ b/drivers/edac/i5000_edac.c
> @@ -1130,7 +1130,7 @@ static void i5000_get_mc_regs(struct mem_ctl_info *mci)
>  	pci_read_config_dword(pvt->system_address, AMBASE,
>  			(u32 *) & pvt->ambase);
>  	pci_read_config_dword(pvt->system_address, AMBASE + sizeof(u32),
> -			((u32 *) & pvt->ambase) + sizeof(u32));
> +			(u32 *)((char *) &pvt->ambase + sizeof(u32)));
>  
>  	maxdimmperch = pvt->maxdimmperch;
>  	maxch = pvt->maxch;

i think this is hard to understand. personally i would prefer a union or other
more obvious solutions. my suggestion would be to get rid of this.

u32 bottom,top;
 	pci_read_config_dword(pvt->system_address, AMBASE,
  			&bottom);
	pci_read_config_dword(pvt->system_address, AMBASE+ sizeof(u32),
  			&top);
	maxdimmperch=(u64)top<<32|bottom;
	
you can find this pattern in other parts of the kernel also.

hope that helps
re,
 wh


