From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Fri, 29 Jan 2021 18:55:39 +0000
Subject: Re: [PATCH] MAINTAINERS: adjust to gdth scsi driver removal
Message-Id: <yq1czxnzi6y.fsf@ca-mkp.ca.oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210129052829.13642-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210129052829.13642-1-lukas.bulwahn@gmail.com> (Lukas Bulwahn's
        message of "Fri, 29 Jan 2021 06:28:29 +0100")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Hannes Reinecke <hare@suse.de>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, Joe Perches <joe@perches.com>, Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Pia Eichinger <pia.eichinger@st.oth-regensburg.de>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org


Lukas,

> Commit 0653c358d2dc ("scsi: Drop gdth driver") misses to adjust MAINTAINERS.
>
> Hence, ./scripts/get_maintainer.pl --self-test=patterns complains:
>
>   warning: no file matches F:    drivers/scsi/gdt*

Applied to 5.12/scsi-staging, thanks!

-- 
Martin K. Petersen	Oracle Linux Engineering
