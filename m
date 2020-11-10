From: Logan Gunthorpe <logang@deltatee.com>
Date: Tue, 10 Nov 2020 23:55:41 +0000
Subject: Re: [PATCH][V2] PCI: Fix a potential uninitentional integer overflow issue
Message-Id: <aaa8ae87-170b-ada0-0465-9727967594cb@deltatee.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201110221048.3411288-1-colin.king@canonical.com>
In-Reply-To: <20201110221048.3411288-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Bjorn Helgaas <bhelgaas@google.com>, Stephen Bates <sbates@raithlin.com>, Alex Williamson <alex.williamson@redhat.com>, =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>, linux-pci@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On 2020-11-10 3:10 p.m., Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The shift of 1 by align_order is evaluated using 32 bit arithmetic
> and the result is assigned to a resource_size_t type variable that
> is a 64 bit unsigned integer on 64 bit platforms. Fix an overflow
> before widening issue by making the 1 a ULL.
> 
> Addresses-Coverity: ("Unintentional integer overflow")
> Fixes: 07d8d7e57c28 ("PCI: Make specifying PCI devices in kernel parameters reusable")

I think this should probably be

Fixes: 32a9a682bef2 ("PCI: allow assignment of memory resources with a
specified alignment")

That is the commit where the original bug was introduced. 644a544fd9bcd
then extends the code a little bit and 07d8d7e57c28 only refactors it
into a reusable function. If we want this in older stable kernels then
we will probably need to make different patches for the other two vintages.

> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Besides that, the change makes sense to me.

Reviewed-by: Logan Gunthorpe <logang@deltatee.com>

Thanks,

Logan
