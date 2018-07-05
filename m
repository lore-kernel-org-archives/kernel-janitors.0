From: David Miller <davem@davemloft.net>
Date: Thu, 05 Jul 2018 11:13:47 +0000
Subject: Re: [PATCH net] ixgbe: Off by one in ixgbe_ipsec_tx()
Message-Id: <20180705.201347.878730091080292422.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704095337.nqiczkkd5r6k755v@kili.mountain>
In-Reply-To: <20180704095337.nqiczkkd5r6k755v@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: jeffrey.t.kirsher@intel.com, shannon.nelson@oracle.com, intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 4 Jul 2018 12:53:37 +0300

> The ipsec->tx_tbl[] has IXGBE_IPSEC_MAX_SA_COUNT elements so the > needs
> to be changed to >= so we don't read one element beyond the end of the
> array.
> 
> Fixes: 592594704761 ("ixgbe: process the Tx ipsec offload")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

I'll let Jeff pick this up.
