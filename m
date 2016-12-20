From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 20 Dec 2016 22:46:55 +0000
Subject: Re: [patch] scsi: dpt_i2o: double free if adpt_i2o_online_hba() fails
Message-Id: <yq11sx22p7k.fsf@sermon.lab.mkp.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20161216093539.GC13942@elgon.mountain>
In-Reply-To: <20161216093539.GC13942@elgon.mountain> (Dan Carpenter's message
        of "Fri, 16 Dec 2016 12:35:39 +0300")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Adaptec OEM Raid Solutions <aacraid@adaptec.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

>>>>> "Dan" = Dan Carpenter <dan.carpenter@oracle.com> writes:

Dan> There are two places where adpt_i2o_online_hba() is called.  Both
Dan> callers call adpt_i2o_delete_hba(pHba) if adpt_i2o_online_hba()
Dan> fails and since we also free it here that causes a double free bug.

Applied to 4.11/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
