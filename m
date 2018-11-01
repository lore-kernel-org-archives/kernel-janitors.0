From: "Brown, Aaron F" <aaron.f.brown@intel.com>
Date: Thu, 01 Nov 2018 19:24:54 +0000
Subject: RE: [PATCH net-next] igc: Remove set but not used variable 'pci_using_dac'
Message-Id: <309B89C4C689E141A5FF6A0C5FB2118B96598688@ORSMSX101.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539953291-189201-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539953291-189201-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>, "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>, "David S. Miller" <davem@davemloft.net>, "Neftin, Sasha" <sasha.neftin@intel.com>
Cc: "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> From: netdev-owner@vger.kernel.org [mailto:netdev-
> owner@vger.kernel.org] On Behalf Of YueHaibing
> Sent: Friday, October 19, 2018 5:48 AM
> To: Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>; David S. Miller
> <davem@davemloft.net>; Neftin, Sasha <sasha.neftin@intel.com>
> Cc: YueHaibing <yuehaibing@huawei.com>; intel-wired-lan@lists.osuosl.org;
> netdev@vger.kernel.org; kernel-janitors@vger.kernel.org
> Subject: [PATCH net-next] igc: Remove set but not used variable
> 'pci_using_dac'
> 
> Fixes gcc '-Wunused-but-set-variable' warning:
> 
> drivers/net/ethernet/intel/igc/igc_main.c: In function 'igc_probe':
> drivers/net/ethernet/intel/igc/igc_main.c:3535:11: warning:
>  variable 'pci_using_dac' set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction in commit
> d89f88419f99 ("igc: Add skeletal frame for Intel(R) 2.5G Ethernet Controller
> support")
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/net/ethernet/intel/igc/igc_main.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 

Tested-by: Aaron Brown <aaron.f.brown@intel.com>
