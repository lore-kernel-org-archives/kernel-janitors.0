From: Sudeep Holla <sudeep.holla@arm.com>
Date: Wed, 23 May 2018 16:59:31 +0000
Subject: Re: [PATCH] firmware: arm_scmi: remove some unnecessary checks
Message-Id: <a71e8503-0da0-6d5d-83e1-667d7768bfd4@arm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180519063715.GB4991@mwanda>
In-Reply-To: <20180519063715.GB4991@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org



On 19/05/18 07:37, Dan Carpenter wrote:
> The "pi->dom_info" buffer is allocated in init() and it can't be NULL
> here.  These tests are sort of weird as well because if "pi->dom_info"
> was NULL but "domain" was non-zero then it would lead to an Oops.
>

Indeed. Thanks for the patch.

> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.

-- 
Regards,
Sudeep
