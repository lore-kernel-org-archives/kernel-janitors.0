From: Michael Chan <michael.chan@broadcom.com>
Date: Thu, 07 Jul 2016 08:31:46 +0000
Subject: Re: [patch -next] bnxt: fix a condition
Message-Id: <CACKFLi=yLRcJKvRHvh633+-2cqL6KcJsexzP4aMh1MvUPvnF6A@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160707082309.GC16742@mwanda>
In-Reply-To: <20160707082309.GC16742@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "David S. Miller" <davem@davemloft.net>, Jeffrey Huang <huangjw@broadcom.com>, Alexander Duyck <aduyck@mirantis.com>, Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org

On Thu, Jul 7, 2016 at 1:23 AM, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> This code generates as static checker warning because htons(ETH_P_IPV6)
> is always true.  From the context it looks like the && was intended to
> be !=.
>
> Fixes: 94758f8de037 ('bnxt_en: Add GRO logic for BCM5731X chips.')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks.  The fix is correct.

Acked-by: Michael Chan <michael.chan@broadcom.com>
