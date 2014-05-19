From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 19 May 2014 20:12:02 +0000
Subject: Re: [PATCH 2/13 v2] [SCSI] qla2xxx: make return of 0 explicit
Message-Id: <20140519201202.GA15585@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1400474832-22422-1-git-send-email-Julia.Lawall@lip6.fr>
 <F5D084D6342F9B479C34599BB0A03E4D01284E742E@AVMB1.qlogic.org>
In-Reply-To: <F5D084D6342F9B479C34599BB0A03E4D01284E742E@AVMB1.qlogic.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Saurav Kashyap <saurav.kashyap@qlogic.com>
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Dept-Eng QLA2xxx Upstream <qla2xxx-upstream@qlogic.com>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi <linux-scsi@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

On Mon, May 19, 2014 at 04:07:52PM +0000, Saurav Kashyap wrote:
> Hi Julia,
> 
> Status is already set to 0 at the beginning of the function, I think
> we should just "return status" here to be consistent with the rest of
> the function.

"return 0;" is more clear than "return status;".

Consistency is great so long as it makes the code easier to read.  Don't
lose track of the real goal.

regards,
dan carpenter

