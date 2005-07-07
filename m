From: Greg KH <greg@kroah.com>
Date: Thu, 07 Jul 2005 19:01:38 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi/qlogicfc.c: It's changes
Message-Id: <20050707190137.GA19438@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============3405154917419726=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050707010526.GA5406@garfield.casa.sp.br>
In-Reply-To: <20050707010526.GA5406@garfield.casa.sp.br>
To: kernel-janitors@vger.kernel.org

--===============3405154917419726==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 06, 2005 at 10:05:26PM -0300, Rodrigo P. do Nascimento wrote:
> Hi All,
> 
> I'm trying again. This time I checked whether the code isn't into the
> #ifdef or #ifndef block. :)
> I hope that it's right. My apologies whether something is wrong. I only
> want to help the project.
> I'm a newbie, so far.   :)

Nice try, but here is why this task is so tough :(

This patch will leak a reference count for the pci device.

> --- /usr/src/linux/drivers/scsi/qlogicfc.c	2005-06-22 16:33:05.000000000 -0300
> +++ /usr/src/linux-kj/drivers/scsi/qlogicfc.c	2005-07-05 19:03:39.000000000 -0300
> @@ -732,7 +732,7 @@ static int isp2x00_detect(Scsi_Host_Temp
> 
>  	for (i=0; i<2; i++){
>  		pdev = NULL;
> -	        while ((pdev = pci_find_device(PCI_VENDOR_ID_QLOGIC, device_ids[i], pdev))) {
> +	        while ((pdev = pci_get_device(PCI_VENDOR_ID_QLOGIC, device_ids[i], pdev))) {

Please read the description of how pci_get_device() works.  In short it
increments the reference count of the pci_dev that is returned.  Later
on in this function, that pointer is saved off into a structure, which
is fine.  Problem happens when that larger structure is freed when the
device or driver is removed.  You need to decrement the usage count of
that structure at that point in time.

Care to redo this?

thanks,

greg k-h

--===============3405154917419726==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============3405154917419726==--
