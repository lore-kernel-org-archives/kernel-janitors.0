From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Mar 2013 13:39:45 +0000
Subject: Re: [patch] vfio-pci: integer overflow in vfio_pci_ioctl()
Message-Id: <20130326133945.GK9138@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130326131358.GA11516@longonot.mountain>
In-Reply-To: <20130326131358.GA11516@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Jiang Liu <jiang.liu@huawei.com>, Vijay Mohan Pandarathil <vijaymohan.pandarathil@hp.com>, kvm@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Mar 26, 2013 at 04:13:58PM +0300, Dan Carpenter wrote:
> The worry here is that a large value of hdr.start would cause a
> read before the start of the array and a crash in
> vfio_msi_set_vector_signal().
> 
> The check in vfio_msi_set_block() is not enough:
> 
> 	if (start + count > vdev->num_ctx)
> 		return -EINVAL;
> 
> A large value of "start" would lead to an integer overflow.
> 
> The check in vfio_msi_set_vector_signal() doesn't work either:
> 
> 	if (vector >= vdev->num_ctx)
> 		return -EINVAL;
> 
> Here "vector" is "count" casted to a signed int so it would be negative
                    ^^^^^
I meant "start" not "count".

> and thus smaller than "vdev->num_ctx" which is also a signed int.
> 

Gar...  I hate this patch already.  I really should make
vdev->num_ctx an unsigned int.  I'll send that in a v2 along with
whatever other suggestions people send.

regards,
dan carpenter
