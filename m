From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 08 May 2018 05:29:43 +0000
Subject: Re: [PATCH] scsi: megaraid: silence a static checker bug
Message-Id: <yq1vabyww8o.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180503105432.GB5315@mwanda>
In-Reply-To: <20180503105432.GB5315@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> If we had more than 32 megaraid cards then it would cause memory
> corruption.  That's not likely, of course, but it's handy to enforce it
> and make the static checker happy.

Applied to 4.18/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
