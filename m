From: David Miller <davem@davemloft.net>
Date: Wed, 06 Dec 2017 19:00:46 +0000
Subject: Re: [PATCH] bnxt_en: Uninitialized variable in bnxt_tc_parse_actions()
Message-Id: <20171206.140046.1593939441488896213.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205143752.cymsw7fzlqn6ejeq@mwanda>
In-Reply-To: <20171205143752.cymsw7fzlqn6ejeq@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: michael.chan@broadcom.com, sathya.perla@broadcom.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 5 Dec 2017 17:37:52 +0300

> Smatch warns that:
> 
>     drivers/net/ethernet/broadcom/bnxt/bnxt_tc.c:160 bnxt_tc_parse_actions()
>     error: uninitialized symbol 'rc'.
> 
> "rc" is either uninitialized or set to zero here so we can just remove
> the check.
> 
> Fixes: 8c95f773b4a3 ("bnxt_en: add support for Flower based vxlan encap/decap offload")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Michael, please review.

Thanks.
