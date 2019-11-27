From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 27 Nov 2019 02:30:35 +0000
Subject: Re: [PATCH][next] scsi: pm80xx: fix logic to break out of loop when register value is 2 or 3
Message-Id: <yq136ea9hkk.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191120135031.270708-1-colin.king@canonical.com>
In-Reply-To: <20191120135031.270708-1-colin.king@canonical.com> (Colin King's
        message of "Wed, 20 Nov 2019 13:50:31 +0000")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Jack Wang <jinpu.wang@cloud.ionos.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Deepak Ukey <Deepak.Ukey@microchip.com>, Viswas G <Viswas.G@microchip.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> The condition (reg_val != 2) || (reg_val != 3) will always be true
> because reg_val cannot be equal to two different values at the same
> time. Fix this by replacing the || operator with && so that the loop
> will loop if reg_val is not a 2 and not a 3 as was originally
> intended.

Applied to 5.5/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
