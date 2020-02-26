From: "Bowers, AndrewX" <andrewx.bowers@intel.com>
Date: Wed, 26 Feb 2020 22:06:17 +0000
Subject: RE: [Intel-wired-lan] [PATCH][next] ice: remove redundant assignment to pointer vsi
Message-Id: <86c1fa9338da4e35a977773832a1188c@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200222171054.171505-1-colin.king@canonical.com>
In-Reply-To: <20200222171054.171505-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> -----Original Message-----
> From: Intel-wired-lan [mailto:intel-wired-lan-bounces@osuosl.org] On
> Behalf Of Colin King
> Sent: Saturday, February 22, 2020 9:11 AM
> To: Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>; David S . Miller
> <davem@davemloft.net>; intel-wired-lan@lists.osuosl.org;
> netdev@vger.kernel.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [Intel-wired-lan] [PATCH][next] ice: remove redundant assignment
> to pointer vsi
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Pointer vsi is being re-assigned a value that is never read, the assignment is
> redundant and can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/intel/ice/ice_virtchnl_pf.c | 1 -
>  1 file changed, 1 deletion(-)

Tested-by: Andrew Bowers <andrewx.bowers@intel.com>
