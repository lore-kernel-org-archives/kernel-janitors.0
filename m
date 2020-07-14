From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 14 Jul 2020 04:58:39 +0000
Subject: Re: [PATCH][next] scsi: cxgb4i: fix dereference of pointer tdata before it is null checked
Message-Id: <159470266467.11195.3151931908467404359.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200709135217.1408105-1-colin.king@canonical.com>
In-Reply-To: <20200709135217.1408105-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E . J . Bottomley" <jejb@linux.ibm.com>, Varun Prakash <varun@chelsio.com>, linux-scsi@vger.kernel.org, Colin King <colin.king@canonical.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, 9 Jul 2020 14:52:17 +0100, Colin King wrote:

> Currently pointer tdata is being dereferenced on the initialization of
> pointer skb before tdata is null checked. This could lead to a potential
> null pointer dereference.  Fix this by dereferencing tdata after tdata
> has been null pointer sanity checked.

Applied to 5.9/scsi-queue, thanks!

[1/1] scsi: cxgb4i: Fix dereference of pointer tdata before it is null checked
      https://git.kernel.org/mkp/scsi/c/b92a4a9f7be8

-- 
Martin K. Petersen	Oracle Linux Engineering
