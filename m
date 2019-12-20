From: "Bowers, AndrewX" <andrewx.bowers@intel.com>
Date: Fri, 20 Dec 2019 20:22:28 +0000
Subject: RE: [Intel-wired-lan] [PATCH] ice: remove redundant assignment to variable xmit_done
Message-Id: <931e77969d3842d780aae153817c9d7c@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191219234535.37103-1-colin.king@canonical.com>
In-Reply-To: <20191219234535.37103-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> -----Original Message-----
> From: Intel-wired-lan [mailto:intel-wired-lan-bounces@osuosl.org] On
> Behalf Of Colin King
> Sent: Thursday, December 19, 2019 3:46 PM
> To: Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>; David S . Miller
> <davem@davemloft.net>; intel-wired-lan@lists.osuosl.org;
> netdev@vger.kernel.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [Intel-wired-lan] [PATCH] ice: remove redundant assignment to
> variable xmit_done
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> The variable xmit_done is being initialized with a value that is never read and
> it is being updated later with a new value. The initialization is redundant and
> can be removed.
> 
> Addresses-Coverity: ("Unused value")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/intel/ice/ice_xsk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Tested-by: Andrew Bowers <andrewx.bowers@intel.com>
