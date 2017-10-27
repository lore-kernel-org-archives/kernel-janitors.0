From: Dennis Dalessandro <dennis.dalessandro@intel.com>
Date: Fri, 27 Oct 2017 21:54:04 +0000
Subject: Re: IB/mlx4: Use common error handling code in __mlx4_ib_create_flow()
Message-Id: <7c5a7827-209c-9bb7-5b77-ac62d3d54604@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0bcea3cf-91e3-01d5-8d80-34cd6b611fb1@users.sourceforge.net>
 <20171027193902.GJ16127@mtr-leonro.local>
 <5cc2ecf7-cc6e-76e0-c73b-08ce717fef83@users.sourceforge.net>
In-Reply-To: <5cc2ecf7-cc6e-76e0-c73b-08ce717fef83@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>, Leon Romanovsky <leon@kernel.org>, Doug Ledford <dledford@redhat.com>, linux-rdma@vger.kernel.org
Cc: Hal Rosenstock <hal.rosenstock@gmail.com>, Sean Hefty <sean.hefty@intel.com>, Yishai Hadas <yishaih@mellanox.com>, Yuval Shaia <yuval.shaia@oracle.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

On 10/27/2017 4:53 PM, SF Markus Elfring wrote:
>> This change adds nothing except code churn.
> 
> I guess that the shown change possibility can reduce the object code size
> for the affected function.
> Do you care for such an detail?
> 
> Regards,
> Markus
> 

You guess? Well perhaps you should find out for certain. Is it an 
appreciable impact?

-Denny
