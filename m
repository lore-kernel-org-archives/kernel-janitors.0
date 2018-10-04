From: Colin Ian King <colin.king@canonical.com>
Date: Thu, 04 Oct 2018 08:28:19 +0000
Subject: Re: [SCSI] pmcraid: PMC-Sierra MaxRAID driver to support 6Gb/s SAS RAID controller
Message-Id: <f512d8fa-e782-0679-8140-0a27dd3b9062@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>

Hi,

Static analysis from CoverityScan (CID#114178 "Operands don't affect
result") detected an issue in drivers/scsi/pmcraid.c, function
pmcraid_init_res_table with the following check:

        if (pinstance->cfg_table->flags & MICROCODE_UPDATE_REQUIRED)
                pmcraid_err("IOA requires microcode download\n");


pinstance->cfg_table->flags is a u8, MICROCODE_UPDATE_REQUIRED is  1 <<
31, so the & operation always results in false and the error message is
never displayed.  From my understanding, flags should be a u8, so there
is something wrong here with the check.  Any ideas?

Colin
