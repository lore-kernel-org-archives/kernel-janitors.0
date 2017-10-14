From: "Brown, Aaron F" <aaron.f.brown@intel.com>
Date: Sat, 14 Oct 2017 01:44:02 +0000
Subject: RE: [Intel-wired-lan] [PATCH][V3] e1000: avoid null pointer dereference    on invalid stat type
Message-Id: <309B89C4C689E141A5FF6A0C5FB2118B8C6C189D@ORSMSX101.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170922171348.17630-1-colin.king@canonical.com>
In-Reply-To: <20170922171348.17630-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>, "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> From: Intel-wired-lan [mailto:intel-wired-lan-bounces@osuosl.org] On Behalf
> Of Colin King
> Sent: Friday, September 22, 2017 10:14 AM
> To: Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>; intel-wired-
> lan@lists.osuosl.org; netdev@vger.kernel.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [Intel-wired-lan] [PATCH][V3] e1000: avoid null pointer dereference
> on invalid stat type
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently if the stat type is invalid then data[i] is being set
> either by dereferencing a null pointer p, or it is reading from
> an incorrect previous location if we had a valid stat type
> previously.  Fix this by skipping over the read of p on an invalid
> stat type.
> 
> Detected by CoverityScan, CID#113385 ("Explicit null dereferenced")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/net/ethernet/intel/e1000/e1000_ethtool.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

Tested-by: Aaron Brown <aaron.f.brown@intel.com>
