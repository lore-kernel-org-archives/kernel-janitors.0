From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 19 Oct 2018 23:01:52 +0000
Subject: Re: [PATCH 2/3] scsi: myrs: Fix the processor absent message in processor_show()
Message-Id: <yq11s8lilr3.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181019091819.7q5t2ry67ksoyrgh@kili.mountain>
In-Reply-To: <20181019091819.7q5t2ry67ksoyrgh@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> If both processors are absent then it's supposed to print that, but
> instead we print that just the second processor is absent.

Applied to 4.20/scsi-queue.

-- 
Martin K. Petersen	Oracle Linux Engineering
