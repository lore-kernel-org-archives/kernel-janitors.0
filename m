From: Benny Halevy <bhalevy@tonian.com>
Date: Wed, 17 Apr 2013 08:32:51 +0000
Subject: Re: [osd-dev] [patch] [SCSI] libosd: remover duplicate __bitwise annotation
Message-Id: <516E5E33.1090506@tonian.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20130417071905.GE7923@elgon.mountain>
In-Reply-To: <20130417071905.GE7923@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Boaz Harrosh <bharrosh@panasas.com>, kernel-janitors@vger.kernel.org, osd-dev@open-osd.org, "James E.J. Bottomley" <JBottomley@parallels.com>, linux-scsi@vger.kernel.org

On 2013-04-17 10:19, Dan Carpenter wrote:
> __be32 is already a __bitwise type so we don't need the second __bitwise
> here.  It causes a Sparse error:
> include/scsi/osd_protocol.h:110:26: error: invalid modifier
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

ACK

> 
> diff --git a/include/scsi/osd_protocol.h b/include/scsi/osd_protocol.h
> index a6026da..25ac628 100644
> --- a/include/scsi/osd_protocol.h
> +++ b/include/scsi/osd_protocol.h
> @@ -107,7 +107,7 @@ enum osd_attributes_mode {
>   *		int exponent: 04;
>   *	}
>   */
> -typedef __be32 __bitwise osd_cdb_offset;
> +typedef __be32 osd_cdb_offset;
>  
>  enum {
>  	OSD_OFFSET_UNUSED = 0xFFFFFFFF,
> _______________________________________________
> osd-dev mailing list
> osd-dev@open-osd.org
> http://mailman.open-osd.org/mailman/listinfo/osd-dev
> 
