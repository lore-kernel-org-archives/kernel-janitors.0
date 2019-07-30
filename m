From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Tue, 30 Jul 2019 19:57:22 +0000
Subject: Re: [PATCH v2] scsi: mpt3sas: clean up a couple sizeof() uses
Message-Id: <yq15znjmh25.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190726065205.GA22701@mwanda>
In-Reply-To: <20190726065205.GA22701@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Dan,

> There is a copy and paste bug here.  It uses EVENT_TRIGGERS size instead
> of SCSI_TRIGGERS size but fortunately both size are 84 bytes so it
> doesn't affect runtime.
>
> These days the prefered style is to just say sizeof(object) instead of
> sizeof(type) so I have updated the function to the latest style as well.

Applied to 5.4/scsi-queue. Thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
