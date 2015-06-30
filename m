From: "Simmons, James A." <simmonsja@ornl.gov>
Date: Tue, 30 Jun 2015 14:56:21 +0000
Subject: RE: LIBCFS_ALLOC
Message-Id: <d2c4fda0148a4e579b5636b586d32fbe@EXCHCS32.ornl.gov>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
 <1434819550-3193-2-git-send-email-Julia.Lawall@lip6.fr>
 <D1AECA61.F8DE5%andreas.dilger@intel.com>
 <alpine.DEB.2.02.1506280844460.2103@localhost6.localdomain6>
 <20150628215408.GG28762@mwanda>
In-Reply-To: <20150628215408.GG28762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: 'Dan Carpenter' <dan.carpenter@oracle.com>, Julia Lawall <julia.lawall@lip6.fr>
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "Dilger, Andreas" <andreas.dilger@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Drokin, Oleg" <oleg.drokin@intel.com>, "lustre-devel@lists.lustre.org" <lustre-devel@lists.lustre.org>

>Yeah.  You're right.  Doing a vmalloc() when kmalloc() doesn't have even
>a tiny sliver of RAM isn't going to work.  It's easier to use
>libcfs_kvzalloc() everywhere, but it's probably the wrong thing.

The original  reason we have the vmalloc water mark wasn't so much the
issue of memory exhaustion but to handle the case of memory fragmentation. 
Some sites had after a extended period of time started to see failures of
allocating even 32K using kmalloc.  In our latest development branch we moved
away from using a water mark to always try kmalloc first and if it fails then we
try vmalloc. At ORNL we ran into severe performance issues when we entered
vmalloc territory. It has been discussed before on what might replace vmalloc
handling in the case of kmalloc fails but no solution has been worked out.
