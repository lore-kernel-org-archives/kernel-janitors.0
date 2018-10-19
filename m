From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 19 Oct 2018 23:01:35 +0000
Subject: Re: [PATCH 1/3] scsi: myrs: Fix a logical vs bitwise bug
Message-Id: <yq15zxxilrk.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181019091628.4pvqvib3nlz2pznb@kili.mountain>
In-Reply-To: <20181019091628.4pvqvib3nlz2pznb@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> The || was supposed to be |.  The original code just sets ->result to 1.

Applied to 4.20/scsi-queue, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
