From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 09 Aug 2018 01:16:42 +0000
Subject: Re: [PATCH] st: remove redundant pointer STbuffer
Message-Id: <yq136vos5j9.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180803104752.17081-1-colin.king@canonical.com>
In-Reply-To: <20180803104752.17081-1-colin.king@canonical.com> (Colin King's
        message of "Fri, 3 Aug 2018 11:47:52 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>
Cc: Kai =?utf-8?Q?M=C3=A4kisara?= <Kai.Makisara@kolumbus.fi>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Colin,

> Pointer STbuffer is being assigned but is never used hence it is
> redundant and can be removed.
>
> Cleans up clang warning:
> warning: variable 'STbuffer' set but not used [-Wunused-but-set-variable]

Applied to 4.19/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
