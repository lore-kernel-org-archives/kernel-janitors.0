From: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Date: Mon, 04 Jan 2016 15:48:54 +0000
Subject: RE: [PATCH] staging: rdma: hfi1: diag: constify hfi1_filter_array structure
Message-Id: <32E1700B9017364D9B60AED9960492BC259E41B4@fmsmsx120.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1450903377-27803-1-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1450903377-27803-1-git-send-email-Julia.Lawall@lip6.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <Julia.Lawall@lip6.fr>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Doug Ledford <dledford@redhat.com>, "Hefty, Sean" <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>

> From: devel [mailto:driverdev-devel-bounces@linuxdriverproject.org] On
> Behalf Of Julia Lawall
> Subject: [PATCH] staging: rdma: hfi1: diag: constify hfi1_filter_array
> structure
> 
> The hfi1_filter_array structure is never modified, so declare it as const.
> 
> Done with the help of Coccinelle.
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
> 

Thanks for the patch!

Acked-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
