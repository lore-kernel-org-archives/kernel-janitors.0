From: "Brown, Aaron F" <aaron.f.brown@intel.com>
Date: Thu, 04 Jan 2018 03:41:42 +0000
Subject: RE: [Intel-wired-lan] [PATCH] igb: Delete an error message for a failed memory allocation in igb_ena
Message-Id: <309B89C4C689E141A5FF6A0C5FB2118B8C72FE85@ORSMSX101.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d6fe0ffd-4439-1f2b-1f78-2a3552f5dd09@users.sourceforge.net>
In-Reply-To: <d6fe0ffd-4439-1f2b-1f78-2a3552f5dd09@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

> From: Intel-wired-lan [mailto:intel-wired-lan-bounces@osuosl.org] On
> Behalf Of SF Markus Elfring
> Sent: Monday, January 1, 2018 11:57 AM
> To: netdev@vger.kernel.org; intel-wired-lan@lists.osuosl.org; Kirsher,
> Jeffrey T <jeffrey.t.kirsher@intel.com>
> Cc: kernel-janitors@vger.kernel.org; LKML <linux-kernel@vger.kernel.org>
> Subject: [Intel-wired-lan] [PATCH] igb: Delete an error message for a failed
> memory allocation in igb_enable_sriov()
> 
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 1 Jan 2018 20:53:10 +0100
> 
> Omit an extra message for a memory allocation failure in this function.
> 
> This issue was detected by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/net/ethernet/intel/igb/igb_main.c | 2 --
>  1 file changed, 2 deletions(-)
> 

Tested-by: Aaron Brown <aaron.f.brown@intel.com>
