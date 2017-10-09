From: Doug Ledford <dledford@redhat.com>
Date: Mon, 09 Oct 2017 17:12:31 +0000
Subject: Re: [PATCH] IB/core: remove redundant check on prot_sg_cnt
Message-Id: <1507569151.46071.48.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171009161200.4465-1-colin.king@canonical.com>
In-Reply-To: <20171009161200.4465-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, "J . Bruce Fields" <bfields@redhat.com>, Chuck Lever <chuck.lever@oracle.com>, linux-rdma@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 2017-10-09 at 17:12 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> prot_sg_cnt cannot be zero as a previous check on ret (from which
> prot_sg_cnt is assigned) returns -ENOMEM if is it zero.  Since
> it cannot be zero we can simplify the code by removing the non
> -zero check on prot_sg_cnt and redundant else statement.
> 
> Detected by CoverityScan, COD#1357188 ("Logically dead code")
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied.

-- 
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD

