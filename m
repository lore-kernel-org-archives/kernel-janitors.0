From: James Bottomley <James.Bottomley@SteelEye.com>
Date: Mon, 27 Sep 2004 18:21:31 +0000
Subject: [Kernel-janitors] Re: [PATCH 2.6.9-rc2 1/16] scsi/53c700: replace
Message-Id: <1096309297.2034.62.camel@mulgrave>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============043855626122005109=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.58.0409161253580.14212@server.home>
In-Reply-To: <Pine.LNX.4.58.0409161253580.14212@server.home>
To: kernel-janitors@vger.kernel.org

--===============043855626122005109==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2004-09-27 at 14:11, Nishanth Aravamudan wrote:
> --- 2.6.9-rc2-vanilla/drivers/scsi/53c700.c	2004-09-13 17:15:58.000000000 -0700
> +++ 2.6.9-rc2/drivers/scsi/53c700.c	2004-09-14 09:10:24.000000000 -0700
> @@ -1961,7 +1961,7 @@ NCR_700_bus_reset(struct scsi_cmnd * SCp
>  	 * reset via sg or something */
>  	while(hostdata->eh_complete != NULL) {
>  		spin_unlock_irq(SCp->device->host->host_lock);
> -		schedule_timeout(HZ/10);
> +		msleep_interruptible(100);
>  		spin_lock_irq(SCp->device->host->host_lock);
>  	}
>  	hostdata->eh_complete = &complete;

Firstly, could you copy linux-scsi@vger.kernel.org on these, and
secondly there isn't really much point in replacing this, is there?  The
only thing msleep_interruptible() would add is making sure that we slept
for the full time.  However, the code really doesn't care.  All it's
doing is relinquishing the processor for a short period while it waits
for the host eh_complete semaphore to become available.

James



--===============043855626122005109==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============043855626122005109==--
