From: Michael Veeck <michael.veeck@gmx.net>
Date: Fri, 23 Apr 2004 08:00:22 +0000
Subject: Re: [Kernel-janitors] [PATCH] drivers/scsi/53c* MIN/MAX removal
Message-Id: <4088CD16.3050503@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15468625343019804=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <4088443F.7000002@gmx.net>
In-Reply-To: <4088443F.7000002@gmx.net>
To: kernel-janitors@vger.kernel.org

--===============15468625343019804==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Oops, those patches were against RC-2, not RC-1 of course.

Michael Veeck wrote:

> Patch (against 2.6.6-rc1) removes unnecessary min/max macros and changes
> calls to use kernel.h macros instead.
> 
> Feedback is always welcome
> Michael
> 
> 
> 
> ------------------------------------------------------------------------
> 
> diff -Naur -X dontdiff-osdl linux-2.6.5.org/drivers/scsi/ncr53c8xx.c linux-2.6.5.new/drivers/scsi/ncr53c8xx.c
> --- linux-2.6.5.org/drivers/scsi/ncr53c8xx.c	2004-04-04 05:36:54.000000000 +0200
> +++ linux-2.6.5.new/drivers/scsi/ncr53c8xx.c	2004-04-22 21:04:48.361876800 +0200
> @@ -307,7 +307,7 @@
>  **    The maximum number of segments a transfer is split into.
>  **    We support up to 127 segments for both read and write.
>  **    The data scripts are broken into 2 sub-scripts.
> -**    80 (MAX_SCATTERL) segments are moved from a sub-script 
> +**    80 (MAX_SCATTERL) segments are moved from a sub-script
>  **    in on-chip RAM. This makes data transfers shorter than 
>  **    80k (assuming 1k fs) as fast as possible.
>  */
> @@ -4542,7 +4542,7 @@
>  	/*
>  	**	command
>  	*/
> -	memcpy(cp->cdb_buf, cmd->cmnd, MIN(cmd->cmd_len, sizeof(cp->cdb_buf)));
> +	memcpy(cp->cdb_buf, cmd->cmnd, min_t(int, cmd->cmd_len, sizeof(cp->cdb_buf)));
>  	cp->phys.cmd.addr		= cpu_to_scr(CCB_PHYS (cp, cdb_buf[0]));
>  	cp->phys.cmd.size		= cpu_to_scr(cmd->cmd_len);
>  
> @@ -5172,7 +5172,7 @@
>  		**	Copy back sense data to caller's buffer.
>  		*/
>  		memcpy(cmd->sense_buffer, cp->sense_buf,
> -		       MIN(sizeof(cmd->sense_buffer), sizeof(cp->sense_buf)));
> +		       min(sizeof(cmd->sense_buffer), sizeof(cp->sense_buf)));
>  
>  		if (DEBUG_FLAGS & (DEBUG_RESULT|DEBUG_TINY)) {
>  			u_char * p = (u_char*) & cmd->sense_buffer;
> diff -Naur -X dontdiff-osdl linux-2.6.5.org/drivers/scsi/sym53c8xx_comm.h linux-2.6.5.new/drivers/scsi/sym53c8xx_comm.h
> --- linux-2.6.5.org/drivers/scsi/sym53c8xx_comm.h	2004-04-04 05:37:23.000000000 +0200
> +++ linux-2.6.5.new/drivers/scsi/sym53c8xx_comm.h	2004-04-22 20:59:23.180311912 +0200
> @@ -59,12 +59,9 @@
>  **	sym53c8xx and ncr53c8xx drivers should share.
>  **	The sharing will be achieved in a further version  
>  **	of the driver bundle. For now, only the ncr53c8xx 
> -**	driver includes	this file.
> +**	driver includes this file.
>  */
>  
> -#define MIN(a,b)        (((a) < (b)) ? (a) : (b))
> -#define MAX(a,b)        (((a) > (b)) ? (a) : (b))
> -
>  /*==========================================================
>  **
>  **	Hmmm... What complex some PCI-HOST bridges actually 
> 
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> Kernel-janitors mailing list
> Kernel-janitors@lists.osdl.org
> http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15468625343019804==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15468625343019804==--
