From: Jakub Kicinski <jakub.kicinski@netronome.com>
Date: Tue, 29 Aug 2017 20:05:56 +0000
Subject: Re: [PATCH net] nfp: double free on error in probe
Message-Id: <20170829130556.7632d5ed@cakuba>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170829190855.fabfktv2dg57x3gs@mwanda>
In-Reply-To: <20170829190855.fabfktv2dg57x3gs@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Simon Horman <simon.horman@netronome.com>, oss-drivers@netronome.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 29 Aug 2017 22:15:16 +0300, Dan Carpenter wrote:
> Both the nfp_net_pf_app_start() and the nfp_net_pci_probe() functions
> call nfp_net_pf_app_stop_ctrl(pf) so there is a double free.  The free
> should be done from the probe function because it's allocated there so
> I have removed the call from nfp_net_pf_app_start().
> 
> Fixes: 02082701b974 ("nfp: create control vNICs and wire up rx/tx")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Acked-by: Jakub Kicinski <jakub.kicinski@netronome.com>
