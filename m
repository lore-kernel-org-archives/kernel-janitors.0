From: "Brown, Aaron F" <aaron.f.brown@intel.com>
Date: Tue, 28 Jul 2020 20:43:36 +0000
Subject: RE: [PATCH 1/4] e1000/e1000_ethtool.c: Remove unnecessary usages of memset
Message-Id: <DM6PR11MB2890145ABAA1BA9FEA288F8BBC730@DM6PR11MB2890.namprd11.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714194035.GA21382@blackclown>
In-Reply-To: <20200714194035.GA21382@blackclown>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suraj Upadhyay <usuraj35@gmail.com>, "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>, "davem@davemloft.net" <davem@davemloft.net>, "kuba@kernel.org" <kuba@kernel.org>
Cc: "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> From: Suraj Upadhyay <usuraj35@gmail.com>
> Sent: Tuesday, July 14, 2020 12:41 PM
> To: Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>; davem@davemloft.net;
> kuba@kernel.org
> Cc: intel-wired-lan@lists.osuosl.org; netdev@vger.kernel.org; linux-
> kernel@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH 1/4] e1000/e1000_ethtool.c: Remove unnecessary usages of
> memset
> 
> Replace memsets of 1 byte with simple assignments.
> Issue reported by checkpatch.pl.
> 
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
>  drivers/net/ethernet/intel/e1000/e1000_ethtool.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Tested-by: Aaron Brown <aaron.f.brown@intel.com>
