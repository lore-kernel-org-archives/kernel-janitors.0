From: Christoph Hellwig <hch@infradead.org>
Date: Tue, 15 Feb 2005 10:39:59 +0000
Subject: Re: [KJ] [PATCH][RESUBMIT][11/21] drivers/scsi/* - compile warning
Message-Id: <20050215103959.GB19930@infradead.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============8051795739892349=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42113C2D.5008.52BF1B@localhost>
In-Reply-To: <42113C2D.5008.52BF1B@localhost>
To: kernel-janitors@vger.kernel.org

--===============8051795739892349==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 15, 2005 at 12:02:53AM +0200, Stephen Biggs wrote:
Content-Description: Mail message body
> Description: compile warning cleanup - cast integer arguments to correct 
> pointer type to silence compiler warning, handle error return from 
> scsi_add_host, silence compiler warnings for unused functions that are 
> either actually used as a driver function in a table or are truly unused, 
> add unused attribute to structures that might not be used
> 
> Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>
> 
> diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/scsi/53c700.h linux-2.6.11-rc3-mm2/drivers/scsi/53c700.h
> --- linux-2.6.11-rc3-mm2-original/drivers/scsi/53c700.h	2005-02-12 12:06:25.000000000 +0200
> +++ linux-2.6.11-rc3-mm2/drivers/scsi/53c700.h	2005-02-12 17:35:49.000000000 +0200
> @@ -461,13 +461,13 @@ NCR_700_mem_readb(struct Scsi_Host *host
>  	const struct NCR_700_Host_Parameters *hostdata __attribute__((unused))
>  		= (struct NCR_700_Host_Parameters *)host->hostdata[0];
>  
> -	return readb(host->base + (reg^bE));
> +	return readb((volatile void __iomem *)(host->base + (reg^bE)));

Again, no.  Stop casting to void __iomem pointers, please don't submit
a patch like this one again ever.


--===============8051795739892349==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============8051795739892349==--
