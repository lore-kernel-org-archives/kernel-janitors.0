From: "Harsha, Priya" <priya.harsha@intel.com>
Date: Mon, 15 Nov 2010 05:47:03 +0000
Subject: RE: [patch] Staging: intel_sst: fix memory leak
Message-Id: <98769532B4BB14429434178695419EAE05365AD591@bgsmsx501.gar.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101113085826.GM3533@bicker>
In-Reply-To: <20101113085826.GM3533@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> -----Original Message-----
> From: Dan Carpenter [mailto:error27@gmail.com]
> Sent: Saturday, November 13, 2010 2:28 PM
> To: Greg Kroah-Hartman
> Cc: Harsha, Priya; Koul, Vinod; Alan Cox; devel@driverdev.osuosl.org;
> kernel-janitors@vger.kernel.org
> Subject: [patch] Staging: intel_sst: fix memory leak
> 
> The original code set "str_info->decode_ibuf" to NULL so the kfree() is
> no-op.
> 
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---
> This is a static checker thing.  I don't have the hardware to test this
> myself so please check it carefully.
> 
> diff --git a/drivers/staging/intel_sst/intel_sst_stream_encoded.c
> b/drivers/staging/intel_sst/intel_sst_stream_encoded.c
> index d4e94f1..09993d6 100644
> --- a/drivers/staging/intel_sst/intel_sst_stream_encoded.c
> +++ b/drivers/staging/intel_sst/intel_sst_stream_encoded.c
> @@ -1270,7 +1270,7 @@ finish:
>  	dbufs->output_bytes_produced = total_output;
>  	str_info->status = str_info->prev;
>  	str_info->prev = STREAM_DECODE;
> -	str_info->decode_ibuf = NULL;
>  	kfree(str_info->decode_ibuf);
> +	str_info->decode_ibuf = NULL;
>  	return retval;
>  }
Acked-by: Harsha Priya <priya.harsha@intel.com>
