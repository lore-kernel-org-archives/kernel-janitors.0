From: "Brown, Aaron F" <aaron.f.brown@intel.com>
Date: Tue, 28 Jul 2020 20:47:02 +0000
Subject: RE: [PATCH 2/4] e1000e/ethtool.c : Remove unnecessary usages of memset.
Message-Id: <DM6PR11MB28908C7DB5F2C1DD58AD132FBC730@DM6PR11MB2890.namprd11.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200714194117.GA21460@blackclown>
In-Reply-To: <20200714194117.GA21460@blackclown>
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
> Subject: [PATCH 2/4] e1000e/ethtool.c : Remove unnecessary usages of
> memset.
> 
> Replace memsets of 1 byte with simple assignments.
> Issue found with checkpatch.pl
> 
> Signed-off-by: Suraj Upadhyay <usuraj35@gmail.com>
> ---
>  drivers/net/ethernet/intel/e1000e/ethtool.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
Tested-by: Aaron Brown <aaron.f.brown@intel.com>
