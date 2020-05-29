From: Markus Elfring <Markus.Elfring@web.de>
Date: Fri, 29 May 2020 17:54:19 +0000
Subject: Re: [PATCH] net: atm: Replace kmalloc with kzalloc in the error message
Message-Id: <5e2d3852-9b10-e918-c50a-2a11a46472d8@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Liao Pingfang <liao.pingfang@zte.com.cn>, netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Cong Wang <xiyou.wangcong@gmail.com>, "David S. Miller" <davem@davemloft.net>, Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, Shannon Nelson <snelson@pensando.io>, Wang Liang <wang.liang82@zte.com.cn>, Yi Wang <wang.yi59@zte.com.cn>, Xue Zhihong <xue.zhihong@zte.com.cn>

> Looking into the context (atomic!) and error message itself I would rather drop
> message completely.

How do you think about to take another look at a previous update suggestion
like the following?

net/atm: Delete an error message for a failed memory allocation in five functions
https://patchwork.ozlabs.org/project/netdev/patch/5270f15b-5e97-0c3e-3e55-fbded48ae07d@users.sourceforge.net/
https://lore.kernel.org/lkml/5270f15b-5e97-0c3e-3e55-fbded48ae07d@users.sourceforge.net/
https://lore.kernel.org/patchwork/patch/838867/
https://lkml.org/lkml/2017/10/9/1009

Regards,
Markus
