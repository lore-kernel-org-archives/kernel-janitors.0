From: Adrian Hunter <adrian.hunter@intel.com>
Date: Mon, 11 Jan 2021 10:28:29 +0000
Subject: Re: [PATCH -next] scsi: docs: ABI: sysfs-driver-ufs: rectify table formatting
Message-Id: <25616ec5-3c90-2548-8516-599a73cc986b@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210111102212.19377-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20210111102212.19377-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: linux-doc@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 11/01/21 12:22 pm, Lukas Bulwahn wrote:
> Commit 0b2894cd0fdf ("scsi: docs: ABI: sysfs-driver-ufs: Add DeepSleep
> power mode") adds new entries in tables of sysfs-driver-ufs ABI
> documentation, but formatted the table incorrectly.
> 
> Hence, make htmldocs warns:
> 
>   ./Documentation/ABI/testing/sysfs-driver-ufs:{915,956}:
>   WARNING: Malformed table. Text in column margin in table line 15.
> 
> Rectify table formatting for DeepSleep power mode.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Thank you!

> ---
> Adrian, please ack.
> 
> Martin, please pick on your scsi-next tree.
> 
>  Documentation/ABI/testing/sysfs-driver-ufs | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-ufs b/Documentation/ABI/testing/sysfs-driver-ufs
> index e77fa784d6d8..75ccc5c62b3c 100644
> --- a/Documentation/ABI/testing/sysfs-driver-ufs
> +++ b/Documentation/ABI/testing/sysfs-driver-ufs
> @@ -932,8 +932,9 @@ Description:	This entry could be used to set or show the UFS device
>  		5   UFS device will be powered off, UIC link will
>  		    be powered off
>  		6   UFS device will be moved to deep sleep, UIC link
> -		will be powered off. Note, deep sleep might not be
> -		supported in which case this value will not be accepted
> +		    will be powered off. Note, deep sleep might not be
> +		    supported in which case this value will not be
> +		    accepted
>  		=  ==========================
>  
>  What:		/sys/bus/platform/drivers/ufshcd/*/rpm_target_dev_state
> @@ -973,8 +974,9 @@ Description:	This entry could be used to set or show the UFS device
>  		5   UFS device will be powered off, UIC link will
>  		    be powered off
>  		6   UFS device will be moved to deep sleep, UIC link
> -		will be powered off. Note, deep sleep might not be
> -		supported in which case this value will not be accepted
> +		    will be powered off. Note, deep sleep might not be
> +		    supported in which case this value will not be
> +		    accepted
>  		=  ==========================
>  
>  What:		/sys/bus/platform/drivers/ufshcd/*/spm_target_dev_state
> 
