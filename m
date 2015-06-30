From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 30 Jun 2015 17:38:34 +0000
Subject: Re: LIBCFS_ALLOC
Message-Id: <20150630173834.GQ28762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
 <1434819550-3193-2-git-send-email-Julia.Lawall@lip6.fr>
 <D1AECA61.F8DE5%andreas.dilger@intel.com>
 <alpine.DEB.2.02.1506280844460.2103@localhost6.localdomain6>
 <20150628215408.GG28762@mwanda>
 <d2c4fda0148a4e579b5636b586d32fbe@EXCHCS32.ornl.gov>
In-Reply-To: <d2c4fda0148a4e579b5636b586d32fbe@EXCHCS32.ornl.gov>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Simmons, James A." <simmonsja@ornl.gov>
Cc: Julia Lawall <julia.lawall@lip6.fr>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "Dilger, Andreas" <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Drokin, Oleg" <oleg.drokin@intel.com>, "lustre-devel@lists.lustre.org" <lustre-devel@lists.lustre.org>

All that you are saying is true and stuff that Julia and I have
discussed before.  For this call site though we are not allocating 32k,
we're allocating 4 pointers so libcfs_kvzalloc() doesn't make sense.

regards,
dan carpenter

