From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 28 Aug 2006 17:26:27 +0000
Subject: Re: [KJ] [PATCH] Removed unreachable code and fixed one compiler
Message-Id: <20060828172627.GI5195@us.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1156784251.4195.7.camel@localhost.localdomain>
In-Reply-To: <1156784251.4195.7.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 28.08.2006 [19:57:31 +0300], ville palo wrote:
> 
> 
> There were some unreachable code segments in drivers/cdrom.
> This patch removes them and fixes one compiler warning: 
> "gscd.c:269: warning: unsigned int format, long unsigned int arg"

Should be separate patches then. Please read tpp
(http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt) and
Documentation/SubmittingPatches if you haven't already (reread them, if
you have).

> Patch is made against 2.6.18-rc5

Not necessary in general.

> Signed-off-by Ville Palo <ville.palo@vi64pa.net>

Canonical form requires the colon, please

Signed-off-by: Random J Developer <random@developer.example.org>

> index fa70824..03884df 100644
> --- a/drivers/cdrom/gscd.c
> +++ b/drivers/cdrom/gscd.c
> @@ -266,7 +266,7 @@ repeat:
>  		goto out;
>  
>  	if (req->cmd != READ) {
> -		printk("GSCD: bad cmd %u\n", rq_data_dir(req));
> +		printk("GSCD: bad cmd %lu\n", rq_data_dir(req));
>  		end_request(req, 0);
>  		goto repeat;
>  	}

Just to be clear, this should be a separate patch.

> @@ -578,15 +577,13 @@ static void cmd_out(int cmd_type, char *
>  							    (respo_buf,
>  							     respo_count,
>  							     CD_FRAMESIZE);
> -							return;
>  						}
>  					} else {
>  						/* read the info to the buffer */
>  						cmd_info_in(respo_buf,
>  							    respo_count);
> -						return;
>  					}
> -
> +					

Whitespace insertion?

>  					return;
>  				}
>  			}
> diff --git a/drivers/cdrom/isp16.c b/drivers/cdrom/isp16.c
> index db0fd9a..3c1b493 100644
> --- a/drivers/cdrom/isp16.c
> +++ b/drivers/cdrom/isp16.c
> @@ -318,7 +318,6 @@ isp16_cdi_config(int base, u_char drive_
>  		printk("ISP16: dma 1 cannot be used by cdrom interface,"
>  		       " due to conflict with the sound card.\n");
>  		return -1;
> -		break;
>  	case 3:
>  		dma_code = ISP16_DMA_3;
>  		break;
> diff --git a/drivers/cdrom/mcdx.c b/drivers/cdrom/mcdx.c
> index dcd1ab6..b0ab77b 100644
> --- a/drivers/cdrom/mcdx.c
> +++ b/drivers/cdrom/mcdx.c
> @@ -622,9 +622,6 @@ static void do_mcdx_request(request_queu
>  		}
>  		end_request(req, 1);
>  		goto again;
> -
> -		xtrace(REQUEST, "end_request(1)\n");
> -		end_request(req, 1);

Perhapse move the xtrace (which is presumably useful) to before the
goto?

>  	}
>  
>  	goto again;
> @@ -1710,11 +1707,7 @@ static int mcdx_tray_move(struct cdrom_d
>  	if (!(stuffp->present & DOOR))
>  		return -ENOSYS;
>  
> -	if (position)		/* 1: eject */
> -		return mcdx_talk(stuffp, "\xf6", 1, NULL, 1, 5 * HZ, 3);
> -	else			/* 0: close */
> -		return mcdx_talk(stuffp, "\xf8", 1, NULL, 1, 5 * HZ, 3);
> -	return 1;
> +	return mcdx_talk(stuffp, position ? "\xf6" : "\xf8", 1, NULL, 1, 5 * HZ, 3);

As mentioned elsewhere the comments are useful. This also doesn't seem
to fit into either category of your description and thus should have
been in a different patch (Have you (re)read tpp or SubmittingPatches yet?).

Thanks,
Nish

-- 
Nishanth Aravamudan <nacc@us.ibm.com>
IBM Linux Technology Center
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
