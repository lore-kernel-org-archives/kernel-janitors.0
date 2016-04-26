From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 26 Apr 2016 02:02:07 +0000
Subject: Re: [patch] hpsa: set the enclosure identifier to zero
Message-Id: <yq1eg9ti0v4.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160414093744.GJ16549@mwanda>
In-Reply-To: <20160414093744.GJ16549@mwanda> (Dan Carpenter's message of "Thu,
	14 Apr 2016 12:37:44 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Don Brace <don.brace@microsemi.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, iss_storagedev@hp.com, esc.storagedev@microsemi.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> This has only called from show_sas_rphy_enclosure_identifier().
Dan> The caller expects that we set an identifier, otherwise it uses an
Dan> unintialized variable.

Applied to 4.7/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
