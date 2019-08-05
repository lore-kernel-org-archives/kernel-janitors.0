From: "Bowers, AndrewX" <andrewx.bowers@intel.com>
Date: Mon, 05 Aug 2019 21:49:19 +0000
Subject: RE: [Intel-wired-lan] [PATCH][net-next] ice: fix potential infinite loop
Message-Id: <26D9FDECA4FBDD4AADA65D8E2FC68A4A1D40F188@ORSMSX104.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190802155217.16996-1-colin.king@canonical.com>
In-Reply-To: <20190802155217.16996-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> -----Original Message-----
> From: Intel-wired-lan [mailto:intel-wired-lan-bounces@osuosl.org] On
> Behalf Of Colin King
> Sent: Friday, August 2, 2019 8:52 AM
> To: Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>; David S . Miller
> <davem@davemloft.net>; intel-wired-lan@lists.osuosl.org;
> netdev@vger.kernel.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [Intel-wired-lan] [PATCH][net-next] ice: fix potential infinite loop
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The loop counter of a for-loop is a u8 however this is being compared to an
> int upper bound and this can lead to an infinite loop if the upper bound is
> greater than 255 since the loop counter will wrap back to zero. Fix this
> potential issue by making the loop counter an int.
> 
> Addresses-Coverity: ("Infinite loop")
> Fixes: c7aeb4d1b9bf ("ice: Disable VFs until reset is completed")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/intel/ice/ice_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Tested-by: Andrew Bowers <andrewx.bowers@intel.com>
