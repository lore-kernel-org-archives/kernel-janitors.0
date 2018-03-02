From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 02 Mar 2018 02:11:02 +0000
Subject: Re: [patch RESEND] atp870u: 64 bit bug in atp885_init()
Message-Id: <yq1606fxm4p.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151209102453.GE3173@mwanda>
In-Reply-To: <20151209102453.GE3173@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> On 64 bit CPUs there is a memory corruption bug on probe().  It should
> be a u32 pointer instead of an unsigned long pointer or we write past
> the end of the setupdata[] array.

Applied to 4.17/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
