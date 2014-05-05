From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 05 May 2014 09:45:06 +0000
Subject: Re: [patch] [SCSI] qla2xxx: fix incorrect debug printk
Message-Id: <20140505094506.GM4963@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20140503202135.GD32753@mwanda>
In-Reply-To: <20140503202135.GD32753@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: qla2xxx-upstream@qlogic.com
Cc: "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, May 03, 2014 at 11:21:35PM +0300, Dan Carpenter wrote:
> There are missing curly braces here so it prints that the recovery
> failed even when it succeeded.
> 

That's strange.  This patch got corrupted somehow.  I will resend.

regards,
dan carpenter


