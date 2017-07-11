From: John Garry <john.garry@huawei.com>
Date: Tue, 11 Jul 2017 17:10:25 +0000
Subject: Re: [PATCH] scsi: hisi_sas: make several const arrays static
Message-Id: <e889314e-bcca-93c7-e2c1-4c6ab98452bc@huawei.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170711121144.15840-1-colin.king@canonical.com>
In-Reply-To: <20170711121144.15840-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "James E . J . Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Linuxarm <linuxarm@huawei.com>

On 11/07/2017 13:11, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> Don't populate various tables on the stack but make them static const.
> Makes the object code smaller by over 280 bytes:
>
> Before:
>    text	   data	    bss	    dec	    hex	filename
>   39887	   5080	     64	  45031	   afe7	hisi_sas_v2_hw.o
>
> After:
>    text	   data	    bss	    dec	    hex	filename
>   39318	   5368	     64	  44750	   aece	hisi_sas_v2_hw.o
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---

Acked-by: John Garry <john.garry@huawei.com>


