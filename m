From: Leon Romanovsky <leon@kernel.org>
Date: Tue, 12 May 2020 06:22:38 +0000
Subject: Re: [PATCH] RDMA/rxe: Return -EFAULT if copy_from_user() fails
Message-Id: <20200512062238.GD4814@unreal>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200511183742.GB225608@mwanda>
 <AM6PR05MB6263ECA5663A63A9CC825145D8BE0@AM6PR05MB6263.eurprd05.prod.outlook.com>
In-Reply-To: <AM6PR05MB6263ECA5663A63A9CC825145D8BE0@AM6PR05MB6263.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yanjun Zhu <yanjunz@mellanox.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Doug Ledford <dledford@redhat.com>, Jason Gunthorpe <jgg@ziepe.ca>, "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

On Tue, May 12, 2020 at 01:12:38AM +0000, Yanjun Zhu wrote:
> Does this "err = -EFAULT;" make any sense in your commit?

Yanjun, please stop top-posting, it is annoying.

Thanks
