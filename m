From: Dave Jones <davej@redhat.com>
Date: Mon, 14 Feb 2005 22:08:02 +0000
Subject: Re: [KJ] [PATCH][RESUBMIT][2/21] drivers/block/* - compile warning
Message-Id: <20050214220802.GB30288@redhat.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============71648044288497981=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42113C2B.3809.52B9FA@localhost>
In-Reply-To: <42113C2B.3809.52B9FA@localhost>
To: kernel-janitors@vger.kernel.org

--===============71648044288497981==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 15, 2005 at 12:02:51AM +0200, Stephen Biggs wrote:
Content-Description: Mail message body
 > Description: compile warning cleanups - handle error return from 
 > scsi_add_host
 > 
 > Signed-off-by: Stephen Biggs <yrgrknmxpzlk@gawab.com>
 > 
 > diff -Nurdp -X dontdiff-osdl linux-2.6.11-rc3-mm2-original/drivers/block/cciss_scsi.c linux-2.6.11-rc3-mm2/drivers/block/cciss_scsi.c
 > --- linux-2.6.11-rc3-mm2-original/drivers/block/cciss_scsi.c	2005-02-12 12:06:24.000000000 +0200
 > +++ linux-2.6.11-rc3-mm2/drivers/block/cciss_scsi.c	2005-02-12 14:08:33.000000000 +0200
 > @@ -706,7 +706,8 @@ cciss_scsi_detect(int ctlr)
 >  	sh->hostdata[0] = (unsigned long) hba[ctlr];
 >  	sh->irq = hba[ctlr]->intr;
 >  	sh->unique_id = sh->irq;
 > -	scsi_add_host(sh, &hba[ctlr]->pdev->dev); /* XXX handle failure */
 > +	if (scsi_add_host(sh, &hba[ctlr]->pdev->dev))
 > +		return 0;
 >  	scsi_scan_host(sh);
 >  
 >  	return 1;
 > 

This has already been fixed properly in Linus' tree.
You missed the undoing of the scsi_host_alloc in the failure path.

		Dave

--===============71648044288497981==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============71648044288497981==--
