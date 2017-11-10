From: "Brown, Aaron F" <aaron.f.brown@intel.com>
Date: Fri, 10 Nov 2017 03:16:03 +0000
Subject: RE: [Intel-wired-lan] [PATCH] i40e: remove redundant initialization of read_size
Message-Id: <309B89C4C689E141A5FF6A0C5FB2118B8C6EB14D@ORSMSX101.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171105130429.6399-1-colin.king@canonical.com>
In-Reply-To: <20171105130429.6399-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "Kirsher, Jeffrey T" <jeffrey.t.kirsher@intel.com>, "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> From: Intel-wired-lan [mailto:intel-wired-lan-bounces@osuosl.org] On Behalf
> Of Colin King
> Sent: Sunday, November 5, 2017 5:04 AM
> To: Kirsher, Jeffrey T <jeffrey.t.kirsher@intel.com>; intel-wired-
> lan@lists.osuosl.org; netdev@vger.kernel.org
> Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [Intel-wired-lan] [PATCH] i40e: remove redundant initialization of
> read_size
> 
> From: Colin Ian King <colin.king@canonical.com>
> 
> Variable read_size is initialized and this value is never read, it is
> instead set inside the do-loop, hence the intialization is redundant
> and can be removed. Cleans up clang warning:
> 
> drivers/net/ethernet/intel/i40e/i40e_nvm.c:390:6: warning: Value stored
> to 'read_size' during its initialization is never read
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

s/intialization/initialization/g
