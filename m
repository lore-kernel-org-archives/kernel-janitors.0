From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 24 Jul 2019 02:16:24 +0000
Subject: Re: [PATCH] scsi: fcoe: fix a typo
Message-Id: <yq1o91kqirr.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190721125039.13268-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20190721125039.13268-1-christophe.jaillet@wanadoo.fr>
        (Christophe JAILLET's message of "Sun, 21 Jul 2019 14:50:39 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: hare@suse.de, jejb@linux.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


Christophe,

> #define relative to FCOE CTLR start with FCOE_CTLR, except
> FCOE_CTRL_SOL_TOV.
>
> This is likely a typo and CTRL should be CTLR here as well.

Applied to 5.3/scsi-fixes, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
