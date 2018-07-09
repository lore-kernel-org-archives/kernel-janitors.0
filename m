From: "Winkler, Tomas" <tomas.winkler@intel.com>
Date: Mon, 09 Jul 2018 11:36:21 +0000
Subject: RE: [PATCH] mei: bus: type promotion bug in mei_nfc_if_version()
Message-Id: <5B8DA87D05A7694D9FA63FD143655C1B9D968DBA@hasmsx108.ger.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180704093449.vryluk7khaudstgp@kili.mountain>
 <20180707153255.GA29925@kroah.com>
In-Reply-To: <20180707153255.GA29925@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Usyskin, Alexander" <alexander.usyskin@intel.com>, Arnd Bergmann <arnd@arndb.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

> 
> On Wed, Jul 04, 2018 at 12:34:49PM +0300, Dan Carpenter wrote:
> > We accidentally removed the check for negative returns without
> > considering the issue of type promotion.  The "if_version_length"
> > variable is type size_t so if __mei_cl_recv() returns a negative then
> > "bytes_recv" is type promoted to a high positive value and treated as
> > success.
> >
> > Fixes: 582ab27a063a ("mei: bus: fix received data size check in NFC
> > fixup")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> Didn't apply to my tree at all :(

I will rework this, anyhow I would prefer if you can wait for my signoff before applying, 
I believe we are reasonably responsive. 
Thanks
Tomas
