From: "Bowers, AndrewX" <andrewx.bowers@intel.com>
Date: Fri, 17 May 2019 22:34:19 +0000
Subject: RE: [Intel-wired-lan] [PATCH] i40e/i40evf: cleanup i40e_update_nvm_checksum()
Message-Id: <26D9FDECA4FBDD4AADA65D8E2FC68A4A1D3DB7A7@ORSMSX104.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> -----Original Message-----
> From: Intel-wired-lan [mailto:intel-wired-lan-bounces@osuosl.org] On
> Behalf Of Dan Carpenter
> Sent: Thursday, May 9, 2019 3:11 AM
> To: Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>
> Cc: kernel-janitors@vger.kernel.org; intel-wired-lan@lists.osuosl.org
> Subject: [Intel-wired-lan] [PATCH] i40e/i40evf: cleanup
> i40e_update_nvm_checksum()
> 
> Smatch complains that we use 'checksum' when it's uninitialized.
> 
>     drivers/net/ethernet/intel/i40e/i40e_nvm.c:581
> i40e_update_nvm_checksum()
>     error: uninitialized symbol 'checksum'.
> 
> This is true, but it harmless because we don't use it again.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/net/ethernet/intel/i40e/i40e_nvm.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)

kernel-janitors@vger.kernel.org; intel-wired-lan@lists.osuosl.org
