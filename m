From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 26 Aug 2016 03:24:19 +0000
Subject: Re: [PATCH] aic94xx: Add missing error code assignment before test
Message-Id: <yq1r39c9pr0.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1470742202-11100-1-git-send-email-christophe.jaillet@wanadoo.fr>
In-Reply-To: <1470742202-11100-1-git-send-email-christophe.jaillet@wanadoo.fr>
        (Christophe JAILLET's message of "Tue, 9 Aug 2016 13:30:02 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: jejb@linux.vnet.ibm.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Christophe" = Christophe JAILLET <christophe.jaillet@wanadoo.fr> writes:

Christophe> It is likely that checking the result of
Christophe> 'pci_write_config_dword' is expected here.

Applied to 4.9/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
