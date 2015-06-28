From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 28 Jun 2015 21:54:08 +0000
Subject: Re: LIBCFS_ALLOC
Message-Id: <20150628215408.GG28762@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1434819550-3193-1-git-send-email-Julia.Lawall@lip6.fr>
 <1434819550-3193-2-git-send-email-Julia.Lawall@lip6.fr>
 <D1AECA61.F8DE5%andreas.dilger@intel.com>
 <alpine.DEB.2.02.1506280844460.2103@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1506280844460.2103@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: "Dilger, Andreas" <andreas.dilger@intel.com>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Drokin, Oleg" <oleg.drokin@intel.com>, "lustre-devel@lists.lustre.org" <lustre-devel@lists.lustre.org>

Yeah.  You're right.  Doing a vmalloc() when kmalloc() doesn't have even
a tiny sliver of RAM isn't going to work.  It's easier to use
libcfs_kvzalloc() everywhere, but it's probably the wrong thing.

regards,
dan carpenter

