From: walter harms <wharms@bfs.de>
Date: Mon, 13 Feb 2017 15:57:57 +0000
Subject: Re: [patch net-next] net: qcom/emac: fix a sizeof() typo
Message-Id: <58A1D785.5040105@bfs.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170213110021.GA17205@mwanda>
In-Reply-To: <20170213110021.GA17205@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org



Am 13.02.2017 16:43, schrieb Timur Tabi:
> walter harms wrote:
>> The question is: why is a simple calculation const*const
>> separated into a function ?
> 
> This is a callback function.  That's just how it's defined.
> 
> It's rare, but there are drivers that use the parameter, like this one:
> 
> http://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git/tree/drivers/net/ethernet/qlogic/qlge/qlge_ethtool.c#n591
> 
> 

this is the problem:
I used: http://lxr.free-electrons.com/source/drivers/net/ibm_emac/ibm_emac_core.c?v=2.6.24#L1778

here is the patched function emac_get_regs_len used the calculate the length in emac_ethtool_get_regs_len
what is used as callback.

in
http://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git/tree/drivers/net/ethernet/qualcomm/emac/emac-ethtool.c
is it now used directly.

sorry for the noise,

re,
 wh
