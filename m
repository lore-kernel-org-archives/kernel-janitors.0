From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 01 Mar 2017 02:56:13 +0000
Subject: Re: [PATCH] scsi: qedi: fix missing return error code check on call to qedi_setup_int
Message-Id: <yq11suhu2lu.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170228110248.19290-1-colin.king@canonical.com>
In-Reply-To: <20170228110248.19290-1-colin.king@canonical.com> (Colin King's
        message of "Tue, 28 Feb 2017 11:02:48 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: QLogic-Storage-Upstream@cavium.com, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

>>>>> "Colin" = Colin King <colin.king@canonical.com> writes:

Colin> The call to qedi_setup_int is not updating the return code rc yet
Colin> rc is being checked for an error. Fix this by assigning rc to the
Colin> return code from the call to qedi_setup_int.

Applied to 4.11/scsi-fixes.

-- 
Martin K. Petersen	Oracle Linux Engineering
