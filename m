From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 09 Sep 2016 11:06:51 +0000
Subject: Re: [PATCH] bnx2fc: Simplify code
Message-Id: <yq1h99pgwms.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1472886348-29813-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1472886348-29813-1-git-send-email-christophe.jaillet@wanadoo.fr>
        (Christophe JAILLET's message of "Sat, 3 Sep 2016 09:05:48 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: QLogic-Storage-Upstream@qlogic.com, jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Christophe" = Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

Christophe> Calling 'list_splice' followed by 'INIT_LIST_HEAD' is
Christophe> equivalent to 'list_splice_init'.

Applied to 4.9/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
