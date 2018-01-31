From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 31 Jan 2018 02:32:38 +0000
Subject: Re: [PATCH] mptfusion: Add bounds check in mptctl_hp_targetinfo()
Message-Id: <yq1fu6mg3ll.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180125142727.GA23945@mwanda>
In-Reply-To: <20180125142727.GA23945@mwanda> (Dan Carpenter's message of "Thu,
        25 Jan 2018 17:27:27 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>, Chaitra P B <chaitra.basappa@broadcom.com>, Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>, MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org


Dan,

> My static checker complains about an out of bounds read:
>
>     drivers/message/fusion/mptctl.c:2786 mptctl_hp_targetinfo()
>     error: buffer overflow 'hd->sel_timeout' 255 <= u32max.
>
> It's true that we probably should have a bounds check here.

Applied to 4.16/scsi-fixes, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
