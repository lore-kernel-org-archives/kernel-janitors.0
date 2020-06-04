From: "Bowers, AndrewX" <andrewx.bowers@intel.com>
Date: Thu, 04 Jun 2020 19:16:11 +0000
Subject: RE: [Intel-wired-lan] [PATCH net-next] ice: Fix error return code in ice_add_prof()
Message-Id: <MWHPR11MB1663790302E561B81C8767078C890@MWHPR11MB1663.namprd11.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200427121228.12241-1-weiyongjun1@huawei.com>
In-Reply-To: <20200427121228.12241-1-weiyongjun1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Cc: "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>

> -----Original Message-----
> From: Intel-wired-lan <intel-wired-lan-bounces@osuosl.org> On Behalf Of
> Wei Yongjun
> Sent: Monday, April 27, 2020 5:12 AM
> To: Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>; Nguyen, Anthony L
> <anthony.l.nguyen@intel.com>
> Cc: intel-wired-lan@lists.osuosl.org; kernel-janitors@vger.kernel.org; Wei
> Yongjun <weiyongjun1@huawei.com>; netdev@vger.kernel.org
> Subject: [Intel-wired-lan] [PATCH net-next] ice: Fix error return code in
> ice_add_prof()
> 
> Fix to return a error code from the error handling case instead of 0, as done
> elsewhere in this function.
> 
> Fixes: 31ad4e4ee1e4 ("ice: Allocate flow profile")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> ---
>  drivers/net/ethernet/intel/ice/ice_flex_pipe.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Tested-by: Andrew Bowers <andrewx.bowers@intel.com>
