From: Bart Van Assche <bvanassche@acm.org>
Date: Mon, 14 Oct 2019 15:58:03 +0000
Subject: Re: [PATCH] scsi: fix unintended sign extension on left shifts
Message-Id: <0e2a6d4c-b346-cb1b-7941-e247a0d0f8b2@acm.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191014121613.21999-1-colin.king@canonical.com>
In-Reply-To: <20191014121613.21999-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, "James E . J . Bottomley" <jejb@linux.ibm.com>, "Martin K . Petersen" <martin.petersen@oracle.com>, Tomohiro Kusumi <kusumi.tomohiro@jp.fujitsu.com>, Kei Tokunaga <tokunaga.keiich@jp.fujitsu.com>, Xiao Guangrong <xiaoguangrong@cn.fujitsu.com>, linux-scsi@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On 10/14/19 5:16 AM, Colin King wrote:
> diff --git a/drivers/scsi/scsi_trace.c b/drivers/scsi/scsi_trace.c
> index 0f17e7dac1b0..1d3a5a2dc229 100644
> --- a/drivers/scsi/scsi_trace.c
> +++ b/drivers/scsi/scsi_trace.c
> @@ -38,7 +38,7 @@ scsi_trace_rw10(struct trace_seq *p, unsigned char *cdb, int len)
>   	const char *ret = trace_seq_buffer_ptr(p);
>   	sector_t lba = 0, txlen = 0;
>   
> -	lba |= (cdb[2] << 24);
> +	lba |= ((u64)cdb[2] << 24);
>   	lba |= (cdb[3] << 16);
>   	lba |= (cdb[4] << 8);
>   	lba |=  cdb[5];

Have you considered to use get/put_unaligned_be*() instead of making the 
above change?

Thanks,

Bart.
