From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Thu, 14 Dec 2017 10:34:01 +0000
Subject: Re: [PATCH 0/3] S390-DASD: Fine-tuning for some function implementations
Message-Id: <d7e6649b-cdb4-e686-df0e-472958c94202@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4af00744-1c8a-6b33-22c8-d26d569f6c5f@users.sourceforge.net>
In-Reply-To: <4af00744-1c8a-6b33-22c8-d26d569f6c5f@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-s390@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>, =?UTF-8?Q?Jan_H=c3=b6ppner?= <hoeppner@linux.vnet.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Stefan Haberland <sth@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

> Date: Wed, 10 May 2017 19:43:21 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (3):
>   Adjust buffer output in dasd_hosts_print()
>   Fix typos in two comment lines
>   Adjust six checks for null pointers
> 
>  drivers/s390/block/dasd_eckd.c | 24 +++++++++++-------------
>  1 file changed, 11 insertions(+), 13 deletions(-)


Are there any chances that such change possibilities (and further adjustments)
will be integrated in this software area?

Regards,
Markus
