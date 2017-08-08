From: Colin Ian King <colin.king@canonical.com>
Date: Tue, 08 Aug 2017 10:28:16 +0000
Subject: Re: [PATCH] IB/core: fix memory leak on ah on error return path
Message-Id: <866a49ab-6f7b-4b46-062b-6230e48da725@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170808101054.13800-1-colin.king@canonical.com>
 <20170808102026.GG3926@linux-x5ow.site>
In-Reply-To: <20170808102026.GG3926@linux-x5ow.site>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Johannes Thumshirn <jthumshirn@suse.de>
Cc: Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 08/08/17 11:20, Johannes Thumshirn wrote:
> Shouldn't the subject start with "IB/hns:" given it's touching
> drivers/infiniband/hw/hns/hns_roce_ah.c?

I was using the same subject start as the patch that introduced the
memory leak and touched the same portion of code. I can resend if necessary.

> 
> Byte,
> 	Johannes
> 

