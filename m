From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 21 Jul 2016 00:49:41 +0000
Subject: Re: [patch] fnic: pci_dma_mapping_error() doesn't return an error code
Message-Id: <yq1a8hberx6.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160707082359.GD16742@mwanda>
In-Reply-To: <20160707082359.GD16742@mwanda> (Dan Carpenter's message of "Thu,
	7 Jul 2016 11:23:59 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Hiral Patel <hiralpat@cisco.com>, Maurizio Lombardi <mlombard@redhat.com>, Suma Ramars <sramars@cisco.com>, Brian Uchino <buchino@cisco.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> pci_dma_mapping_error() returns true on error and false on success.
Dan> Fixes: fd6ddfa4c1dd ('fnic: check pci_map_single() return value')

Applied to 4.8/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
