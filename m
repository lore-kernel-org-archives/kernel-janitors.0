From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 17 Dec 2015 10:46:24 +0000
Subject: Re: [patch] qla2xxx: fix a timeout loop
Message-Id: <20151217104624.GO5177@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151216110746.GB21018@mwanda>
 <yq1lh8ut3di.fsf@sermon.lab.mkp.net>
In-Reply-To: <yq1lh8ut3di.fsf@sermon.lab.mkp.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: qla2xxx-upstream@qlogic.com, Atul Deshmukh <atul.deshmukh@qlogic.com>, "James E.J. Bottomley" <JBottomley@odin.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, Johannes Thumshirn <jthumshirn@suse.de>

On Wed, Dec 16, 2015 at 05:50:17PM -0500, Martin K. Petersen wrote:
> >>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:
> 
> Dan> After the loop we test for "if (!retries) " as a failure, but
> Dan> actually the post-op here will end with retries set to -1.  I have
> Dan> fixed this by using a pre-op instead.
> 
> Applied to 4.4/scsi-fixes.
> 

The qlogic devs asked me to redo this patch but you have already applied
it.  Should I resend or redo it on top of the earlier patch.  (James's
tree was rebaseable for a day after a patch was "applied".)

regards,
dan carpenter

