From: "Martin K. Petersen" <martin.petersen@oracle.com>
Date: Wed, 13 Jan 2021 05:48:53 +0000
Subject: Re: [PATCH -next] scsi: docs: ABI: sysfs-driver-ufs: rectify table formatting
Message-Id: <161051681546.32710.5582070513683033836.b4-ty@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210111102212.19377-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210111102212.19377-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-scsi@vger.kernel.org, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>, kernel-janitors@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, 11 Jan 2021 11:22:12 +0100, Lukas Bulwahn wrote:

> Commit 0b2894cd0fdf ("scsi: docs: ABI: sysfs-driver-ufs: Add DeepSleep
> power mode") adds new entries in tables of sysfs-driver-ufs ABI
> documentation, but formatted the table incorrectly.
> 
> Hence, make htmldocs warns:
> 
>   ./Documentation/ABI/testing/sysfs-driver-ufs:{915,956}:
>   WARNING: Malformed table. Text in column margin in table line 15.
> 
> [...]

Applied to 5.11/scsi-fixes, thanks!

[1/1] scsi: docs: ABI: sysfs-driver-ufs: rectify table formatting
      https://git.kernel.org/mkp/scsi/c/f2cb4b2397ca

-- 
Martin K. Petersen	Oracle Linux Engineering
