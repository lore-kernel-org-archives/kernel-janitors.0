From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 13 Nov 2015 20:46:24 +0000
Subject: Re: [patch] mvsas: don't allow negative timeouts
Message-Id: <yq1k2plzkyn.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151113142323.GB1445@mwanda>
In-Reply-To: <20151113142323.GB1445@mwanda> (Dan Carpenter's message of "Fri,
	13 Nov 2015 17:23:23 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "James E.J. Bottomley" <JBottomley@odin.com>, Hannes Reinecke <hare@suse.de>, Dan Williams <dan.j.williams@intel.com>, Bart Van Assche <bvanassche@acm.org>, "Martin K. Petersen" <martin.petersen@oracle.com>, Johannes Thumshirn <jthumshirn@suse.de>, Jack Wang <jinpu.wang@profitbricks.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> There is a static checker warning here because "val" is controlled
Dan> by the user and we have a upper bound on it but allow negative
Dan> numbers.  "val" appears to be a timeout in usec so this bug
Dan> probably means we have a longer timeout than we should.  Let's fix
Dan> this by changing "val" to unsigned.

Applied.

-- 
Martin K. Petersen	Oracle Linux Engineering
