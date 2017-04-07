From: Santosh Shilimkar <santosh.shilimkar@oracle.com>
Date: Fri, 07 Apr 2017 15:59:46 +0000
Subject: Re: [PATCH] RDS: IB: ensure an initialized ret is printed in pr_warn message
Message-Id: <f3de73cb-f56a-9e6e-a39b-7cee16030b22@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170407075723.9669-1-colin.king@canonical.com>
 <20170407142412.GA4471@mwanda>
In-Reply-To: <20170407142412.GA4471@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Colin King <colin.king@canonical.com>
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, rds-devel@oss.oracle.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 4/7/2017 7:24 AM, Dan Carpenter wrote:
> Setting it to zero doesn't seem like the right thing, it should be an
> error code.  Oh, heh...  Smatch parses this one correctly.  "ret" is
> always initialized but the code is probably buggy in a different way:
>

[...]

>    561                  ibmr = rds_ib_reg_fmr(rds_ibdev, sg, nents, key_ret);
>    562          if (ibmr)
>                     ^^^^
> This condition is always true because those functions return ERR_PTRs
> not NULLs.
>
Thanks Dan. I will fix that up.

Regards,
Santosh
