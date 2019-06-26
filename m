From: "Bowers, AndrewX" <andrewx.bowers@intel.com>
Date: Wed, 26 Jun 2019 22:26:11 +0000
Subject: RE: [Intel-wired-lan] [PATCH][net-next] iavf: fix dereference of null rx_buffer pointer
Message-Id: <26D9FDECA4FBDD4AADA65D8E2FC68A4A1D3FB501@ORSMSX104.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190619143044.10259-1-colin.king@canonical.com>
In-Reply-To: <20190619143044.10259-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> -----Original Message-----
> From: Intel-wired-lan [mailto:intel-wired-lan-bounces@osuosl.org] On
> Behalf Of Colin King
> Sent: Wednesday, June 19, 2019 7:31 AM
> To: Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>; David S . Miller
> <davem@davemloft.net>; intel-wired-lan@lists.osuosl.org;
> netdev@vger.kernel.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [Intel-wired-lan] [PATCH][net-next] iavf: fix dereference of null
> rx_buffer pointer
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> A recent commit efa14c3985828d ("iavf: allow null RX descriptors") added a
> null pointer sanity check on rx_buffer, however, rx_buffer is being
> dereferenced before that check, which implies a null pointer dereference
> bug can potentially occur.  Fix this by only dereferencing rx_buffer until after
> the null pointer check.
> 
> Addresses-Coverity: ("Dereference before null check")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/intel/iavf/iavf_txrx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Tested-by: Andrew Bowers <andrewx.bowers@intel.com>
