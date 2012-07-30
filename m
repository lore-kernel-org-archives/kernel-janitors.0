From: Brian King <brking@linux.vnet.ibm.com>
Date: Mon, 30 Jul 2012 12:34:05 +0000
Subject: Re: [patch 2/2] [SCSI] ipr: remove an unneeded check
Message-Id: <50167F3D.801@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120730081822.GF15702@elgon.mountain>
In-Reply-To: <20120730081822.GF15702@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Brian King <brking@us.ibm.com>, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 07/30/2012 03:18 AM, Dan Carpenter wrote:
> "rc" is always zero here, so there is no need to check.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks!

Acked-by: Brian King <brking@linux.vnet.ibm.com>


-- 
Brian King
Power Linux I/O
IBM Linux Technology Center




