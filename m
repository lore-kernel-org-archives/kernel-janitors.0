From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Thu, 30 Apr 2020 02:18:01 +0000
Subject: Re: [PATCH][next] scsi: qla2xxx: make 1 bit bit-fields unsigned int
Message-Id: <158821297686.28621.17012076745454768383.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200428102013.1040598-1-colin.king@canonical.com>
In-Reply-To: <20200428102013.1040598-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Arun Easi <aeasi@marvell.com>, Nilesh Javali <njavali@marvell.com>, linux-scsi@vger.kernel.org, "James E . J . Bottomley" <jejb@linux.ibm.com>, GR-QLogic-Storage-Upstream@marvell.com, Colin King <colin.king@canonical.com>, Himanshu Madhani <himanshu.madhani@oracle.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, 28 Apr 2020 11:20:13 +0100, Colin King wrote:

> The bitfields mpi_fw_dump_reading and mpi_fw_dumped are currently signed
> which is not recommended as the representation is an implementation defined
> behaviour.  Fix this by making the bit-fields unsigned ints.

Applied to 5.8/scsi-queue, thanks!

[1/1] scsi: qla2xxx: make 1-bit bit-fields unsigned int
      https://git.kernel.org/mkp/scsi/c/78b874b7cbf0

-- 
Martin K. Petersen	Oracle Linux Engineering
