From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 29 Jan 2019 06:31:44 +0000
Subject: Re: [PATCH] scsi: bnx2fc: Fix error handling in probe()
Message-Id: <yq1o980c6un.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190124102940.GA25529@kadam>
In-Reply-To: <20190124102940.GA25529@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> There are two issues here.  First if cmgr->hba is not set early enough
> then it leads to a NULL dereference.  Second if we don't completely
> initialize cmgr->io_bdt_pool[] then we end up dereferencing
> uninitialized pointers.

Applied to 5.0/scsi-fixes, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
