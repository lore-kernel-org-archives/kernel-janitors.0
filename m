From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 16 Jan 2020 03:20:28 +0000
Subject: Re: [PATCH] scsi: BusLogic: use %lX for unsigned long rather than %X
Message-Id: <yq17e1soznn.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200108193800.96706-1-colin.king@canonical.com>
In-Reply-To: <20200108193800.96706-1-colin.king@canonical.com> (Colin King's
        message of "Wed, 8 Jan 2020 19:38:00 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Khalid Aziz <khalid@gonehiking.org>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Currently the incorrect %X print format specifier is being used for
> several unsigned longs.  Fix these by using %lX instead. Also join up
> some literal strings that are split.

Applied to 5.6/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
