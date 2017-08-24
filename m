From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 24 Aug 2017 02:43:29 +0000
Subject: Re: [PATCH] scsi: qedf: Fix a potential NULL pointer dereference
Message-Id: <yq1h8wxadny.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170820170935.14767-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20170820170935.14767-1-christophe.jaillet@wanadoo.fr>
        (Christophe JAILLET's message of "Sun, 20 Aug 2017 19:09:35 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: QLogic-Storage-Upstream@cavium.com, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Christophe,

> At the beginning of 'qedf_srr_compl()' and of 'qedf_rec_compl()', we
> check if 'orig_io_req' is NULL. If this happens, a NULL pointer
> dereference will occur in the error handling path.

Applied to 4.13/scsi-fixes. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
