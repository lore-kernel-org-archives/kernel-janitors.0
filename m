From: Markus Elfring <Markus.Elfring@web.de>
Date: Sat, 12 Oct 2019 16:40:50 +0000
Subject: IB/hfi1: Checking a kmemdup() call in get_platform_config()
Message-Id: <f566cf8a-96df-f145-296f-8f6d72d8fbad@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-rdma@vger.kernel.org, Dennis Dalessandro <dennis.dalessandro@intel.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mike Marciniszyn <mike.marciniszyn@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Aditya Pakki <pakki001@umn.edu>, Kangjie Lu <kjlu@umn.edu>, Navid Emamdoost <emamd001@umn.edu>, Stephen McCamant <smccaman@umn.edu>

Hello,

I tried another script for the semantic patch language out.
This source code analysis approach points out that the implementation
of the function “get_platform_config” contains still an unchecked call
of the function “kmemdup”.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/infiniband/hw/hfi1/platform.c?id=1c0cc5f1ae5ee5a6913704c0d75a6e99604ee30a#n187
https://elixir.bootlin.com/linux/v5.4-rc2/source/drivers/infiniband/hw/hfi1/platform.c#L187

How do you think about to improve it?

Regards,
Markus
