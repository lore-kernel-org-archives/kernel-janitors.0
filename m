From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 21 Mar 2018 22:37:01 +0000
Subject: Re: [PATCH 1/2] scsi: dpt_i2o: use after free in adpt_release()
Message-Id: <yq1fu4trr76.fsf@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180319103303.GA8543@mwanda>
In-Reply-To: <20180319103303.GA8543@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


Christoph,

> This fix is broken!  adpt_i2o_delete_hba references pHba->host as well.
>
> Instead we need a local variable for the host.

Thanks for spotting this! Fixed it up.

-- 
Martin K. Petersen	Oracle Linux Engineering
