From: Scott Feldman <sfeldma@pobox.com>
Date: Mon, 04 Oct 2004 06:31:14 +0000
Subject: Re: [Kernel-janitors] Status of pci_find_device fixes
Message-Id: <1096871474.3819.12.camel@sfeldma-mobl2.dsl-verizon.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============24526856953329368=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <415AB420.9050406@nuerscht.ch>
In-Reply-To: <415AB420.9050406@nuerscht.ch>
To: kernel-janitors@vger.kernel.org

--===============24526856953329368==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2004-10-03 at 20:43, Scott Feldman wrote:
> On Wed, 2004-09-29 at 11:15, Hanna Linder wrote:
> 
> > Thanks for your interest. There are a couple of us working in this area already but if we all
> > coordinate it should help get the work done quickly. Scott is doing everything under drivers/net
> > to start with. Greg and I finished everything under arch/i386. Right now I am working on
> > all the drivers that can be converted to the new pci_dev_present function. That leaves over
> > 100 drivers that need to be converted (cscope and grep are your friend).
> 
> driver/net is shaping up.  There are still a couple that need
> probe/remove conversion.
> 
> I'm heading over to drivers/scsi next, FWIW.

No low hanging fruit in SCSI orchards!  Looks like plenty of pci_driver
support missing:

# grep -l scsi_module.c `grep -l -r pci_find_device drivers/scsi/*`
drivers/scsi/3w-xxxx.c
drivers/scsi/advansys.c
drivers/scsi/aic7xxx_old.c
drivers/scsi/cpqfcTSinit.c
drivers/scsi/dmx3191d.c
drivers/scsi/eata_pio.c
drivers/scsi/fdomain.c
drivers/scsi/gdth.c
drivers/scsi/ini9100u.c
drivers/scsi/pci2000.c
drivers/scsi/pci2220i.c
drivers/scsi/qla1280.c
drivers/scsi/qlogicfc.c
drivers/scsi/qlogicisp.c

What's a good driver for reference that uses the "new-style" template?

-scott


--===============24526856953329368==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============24526856953329368==--
