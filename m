From: Brian King <brking@us.ibm.com>
Date: Tue, 27 Jul 2004 22:56:10 +0000
Subject: [Kernel-janitors] Re: [PATCH] scsi/ipr: replace schedule_timeout()
Message-Id: <4106DD8A.4050104@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============84798540313575188=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============84798540313575188==
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Looks good. Thanks. James, please apply.

-Brian

Nishanth Aravamudan wrote:
> I would appreciate any comments from the janitors list. 
> 
> Applys-to: 2.6.7
> 
> Description: Use msleep() instead of schedule_timeout() to 
> guarantee the task delays for the desired time.
> 
> Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> 
> 
> --- linux-vanilla/drivers/scsi/ipr.c	2004-06-16 05:20:27.000000000 +0000
> +++ linux-dev/drivers/scsi/ipr.c	2004-07-13 18:06:11.000000000 +0000
> @@ -2007,7 +2007,7 @@ static ssize_t ipr_store_diagnostics(str
>  		wait_event(ioa_cfg->reset_wait_q, !ioa_cfg->in_reset_reload);
>  
>  		/* Wait for a second for any errors to be logged */
> -		schedule_timeout(HZ);
> +		msleep(1000);
>  	} else {
>  		spin_unlock_irqrestore(ioa_cfg->host->host_lock, lock_flags);
>  		return -EIO;
> 

-- 
Brian King
eServer Storage I/O
IBM Linux Technology Center


--===============84798540313575188==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============84798540313575188==--
