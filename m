From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 27 Oct 2017 20:53:18 +0000
Subject: Re: IB/mlx4: Use common error handling code in __mlx4_ib_create_flow()
Message-Id: <5cc2ecf7-cc6e-76e0-c73b-08ce717fef83@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0bcea3cf-91e3-01d5-8d80-34cd6b611fb1@users.sourceforge.net>
 <20171027193902.GJ16127@mtr-leonro.local>
In-Reply-To: <20171027193902.GJ16127@mtr-leonro.local>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org
Cc: Dennis Dalessandro <dennis.dalessandro@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, Sean Hefty <sean.hefty@intel.com>, Yishai Hadas <yishaih@mellanox.com>, Yuval Shaia <yuval.shaia@oracle.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> This change adds nothing except code churn.

I guess that the shown change possibility can reduce the object code size
for the affected function.
Do you care for such an detail?

Regards,
Markus
