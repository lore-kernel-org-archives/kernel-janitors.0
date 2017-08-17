From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 17 Aug 2017 00:32:26 +0000
Subject: Re: [PATCH] scsi: osst: silence underflow warning in osst_verify_frame()
Message-Id: <yq1pobvowyt.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170804081733.ujuulvyh4nwgdl6n@mwanda>
In-Reply-To: <20170804081733.ujuulvyh4nwgdl6n@mwanda> (Dan Carpenter's message
        of "Fri, 4 Aug 2017 11:17:33 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Willem Riede <osst@riede.org>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, osst-users@lists.sourceforge.net, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> If i is negative then it's less than OS_FM_TAB_MAX so we read before
> the start of the STp->header_cache->dat_fm_tab.fm_tab_ent[] array.

Applied to 4.14/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
