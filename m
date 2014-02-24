From: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Date: Mon, 24 Feb 2014 18:54:13 +0000
Subject: RE: [patch] IB/qib: cleanup qib_register_observer()
Message-Id: <32E1700B9017364D9B60AED9960492BC211F7822@FMSMSX107.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140130121231.GA17753@elgon.mountain>
In-Reply-To: <20140130121231.GA17753@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Roland Dreier <roland@kernel.org>, "Hefty, Sean" <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> Subject: [patch] IB/qib: cleanup qib_register_observer()
> 
> Returning directly is easier to read than do-nothing gotos.  Remove the
> duplicative check on "olp" and pulled the code in one indent level.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for the patch!

Acked-by: Mike Marciniszyn <mike.marciniszyn@intel.com>
