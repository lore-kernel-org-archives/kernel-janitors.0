From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 29 Nov 2017 05:12:34 +0000
Subject: Re: [PATCH] scsi: wd719x: make card_types static const, shrinks object size
Message-Id: <yq17eu9hdml.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171128181234.24330-1-colin.king@canonical.com>
In-Reply-To: <20171128181234.24330-1-colin.king@canonical.com> (Colin King's
        message of "Tue, 28 Nov 2017 18:12:34 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Don't populate the read-only array card_types on the stack but instead
> make it static and constify it. Makes the object code smaller by over
> 110 bytes:

Applied to 4.16/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
