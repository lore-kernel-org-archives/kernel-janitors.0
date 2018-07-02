From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Mon, 02 Jul 2018 20:17:45 +0000
Subject: Re: [PATCH] scsi: qedi: tidy up a size caculation
Message-Id: <yq1efglz91y.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180628092310.ta2qzatghjtgnzx7@kili.mountain>
In-Reply-To: <20180628092310.ta2qzatghjtgnzx7@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> The id_tbl->table pointer points to unsigned long so static checkers
> complain that instead of 4 we should be allocating sizeof(long) bytes.
>
> We're trying to allocate enough bits for the bitmap.  The size variable
> is always 1024.  (1024 / 32 * 4) is the same as (1024 / 64 * 8) so this
> doesn't change runtime, but this is the more idiomatic way to do it and
> makes the static checker happy.

Applied to 4.19/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
