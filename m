From: Greg KH <greg@kroah.com>
Date: Tue, 05 Jul 2005 21:27:39 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi/qla1280.c: pci_get_device instead of
Message-Id: <20050705212739.GB16537@kroah.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============14315175926856405=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <cbecb30405070514134ebef46@mail.gmail.com>
In-Reply-To: <cbecb30405070514134ebef46@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============14315175926856405==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 05, 2005 at 06:13:10PM -0300, Rodrigo Nascimento wrote:
> This patch changes the pci_find_device to pci_get_device.
> Please correct me, whether it's wrong. It is my first patch. :)
> 
> Signed-off-by: Rodrigo Nascimento <underscore0x5f@gmail.com>
> 
> # diff -urpN /usr/src/linux/drivers/scsi/qla1280.c
> /usr/src/linux-kj/drivers/scsi/qla1280.c
> --- /usr/src/linux/drivers/scsi/qla1280.c       2005-06-22
> 16:33:05.000000000 -0300

Content looks good, but the patch is linwrapped and all of the tabs are
converted to spaces, making it impossible to apply.  And it's made at
the wrong patch level :(

Good luck,

greg k-h

--===============14315175926856405==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============14315175926856405==--
