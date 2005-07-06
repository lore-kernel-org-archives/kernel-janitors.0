From: Domen Puncer <domen@coderock.org>
Date: Wed, 06 Jul 2005 08:50:45 +0000
Subject: Re: [KJ] [PATCH] drivers/scsi/qla1280.c: pci_get_device instead of
Message-Id: <20050706085045.GB2232@homer.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============58713432138882649=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <cbecb30405070514134ebef46@mail.gmail.com>
In-Reply-To: <cbecb30405070514134ebef46@mail.gmail.com>
To: kernel-janitors@vger.kernel.org

--===============58713432138882649==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 05/07/05 15:55 -0700, Greg KH wrote:
> On Wed, Jul 06, 2005 at 12:45:10AM +0200, Domen Puncer wrote:
> > On 05/07/05 14:27 -0700, Greg KH wrote:
> > > On Tue, Jul 05, 2005 at 06:13:10PM -0300, Rodrigo Nascimento wrote:
> > > > This patch changes the pci_find_device to pci_get_device.
> > > > Please correct me, whether it's wrong. It is my first patch. :)
> > > > 
> > > > Signed-off-by: Rodrigo Nascimento <underscore0x5f@gmail.com>
> > > > 
> > > > # diff -urpN /usr/src/linux/drivers/scsi/qla1280.c
> > > > /usr/src/linux-kj/drivers/scsi/qla1280.c
> > > > --- /usr/src/linux/drivers/scsi/qla1280.c       2005-06-22
> > > > 16:33:05.000000000 -0300
> > > 
> > > Content looks good, but the patch is linwrapped and all of the tabs are
> > > converted to spaces, making it impossible to apply.  And it's made at
> > > the wrong patch level :(
> > 
> > Is pci_dev_put() not needed? Why not?
> 
> Where would you place it?

Fail path of qla1280_probe_one(), qla1280_remove_one().

--===============58713432138882649==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============58713432138882649==--
