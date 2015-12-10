From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 10 Dec 2015 17:54:42 +0000
Subject: Re: [PATCH RESEND] cxlflash: a couple off by one bugs
Message-Id: <yq1h9jq2nq5.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1449098788-21695-1-git-send-email-mrochs@linux.vnet.ibm.com>
In-Reply-To: <1449098788-21695-1-git-send-email-mrochs@linux.vnet.ibm.com>
	(Matthew R. Ochs's message of "Wed, 2 Dec 2015 17:26:28 -0600")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Matthew R. Ochs" <mrochs@linux.vnet.ibm.com>
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>, Dan Carpenter <dan.carpenter@oracle.com>, "Manoj N. Kumar" <manoj@linux.vnet.ibm.com>, Wen Xiong <wenxiong@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>, Uma Krishnan <ukrishn@linux.vnet.ibm.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Matthew" = Matthew R Ochs <mrochs@linux.vnet.ibm.com> writes:

Matthew> The "> MAX_CONTEXT" should be ">= MAX_CONTEXT".  Otherwise we
Matthew> go one step beyond the end of the cfg->ctx_tbl[] array.

Applied to 4.5/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
