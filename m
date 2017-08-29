From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 29 Aug 2017 02:13:22 +0000
Subject: Re: [PATCH] scsi: qedi: off by one in qedi_get_cmd_from_tid()
Message-Id: <yq1378b2kal.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170825103657.6kwprvwfks7szn3b@mwanda>
In-Reply-To: <20170825103657.6kwprvwfks7szn3b@mwanda> (Dan Carpenter's message
        of "Fri, 25 Aug 2017 13:36:57 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QLogic-Storage-Upstream@cavium.com, Manish Rangankar <manish.rangankar@cavium.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> The > here should be >= or we end up reading one element beyond the
> end of the qedi->itt_map[] array.  The qedi->itt_map[] array is
> allocated in qedi_alloc_itt().

Applied to 4.13/scsi-fixes. Thank you!

-- 
Martin K. Petersen	Oracle Linux Engineering
