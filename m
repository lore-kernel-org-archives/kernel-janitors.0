From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Mar 2013 15:13:51 +0000
Subject: Re: [patch] vfio-pci: integer overflow in vfio_pci_ioctl()
Message-Id: <20130326151351.GE18466@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130326131358.GA11516@longonot.mountain>
 <1364310182.24132.728.camel@bling.home>
In-Reply-To: <1364310182.24132.728.camel@bling.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Jiang Liu <jiang.liu@huawei.com>, Vijay Mohan Pandarathil <vijaymohan.pandarathil@hp.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 26, 2013 at 09:03:02AM -0600, Alex Williamson wrote:
> Thanks Dan.  Is this more like what you're looking for?
> 

Yes.  That looks nice.  :)

regards,
dan carpenter

