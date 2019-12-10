From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 10 Dec 2019 00:02:15 +0000
Subject: Re: [PATCH] iscsi: qla4xxx: fix double free in probe
Message-Id: <yq1o8whoxo8.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191203094421.hw7ex7qr3j2rbsmx@kili.mountain>
In-Reply-To: <20191203094421.hw7ex7qr3j2rbsmx@kili.mountain> (Dan Carpenter's
        message of "Tue, 3 Dec 2019 12:45:09 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QLogic-Storage-Upstream@qlogic.com, David Somayajulu <david.somayajulu@qlogic.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> On this error path we call qla4xxx_mem_free() and then the caller also
> calls qla4xxx_free_adapter() which calls qla4xxx_mem_free().  It leads
> to a couple double frees:

Applied to 5.5/scsi-fixes, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
