From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Mon, 25 Oct 2004 17:10:50 +0000
Subject: Re: [KJ] Re: [PATCH 2.6] hw_random.c: replace pci_find_device
Message-Id: <20041025171050.GB2209@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============34716688325044132=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <268450000.1098383924@w-hlinder.beaverton.ibm.com> <41783CDA.8010901@pobox.com> <9e473391041025094812aa9923@mail.gmail.com>
In-Reply-To: <9e473391041025094812aa9923@mail.gmail.com>
To: Jon Smirl <jonsmirl@gmail.com>
Cc: Jeff Garzik <jgarzik@pobox.com>, kernel-janitors <kernel-janitors@lists.osdl.org>, lkml <linux-kernel@vger.kernel.org>, Hanna Linder <hannal@us.ibm.com>, greg@kroah.com

--===============34716688325044132==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Oct 25, 2004 at 12:48:43PM -0400, Jon Smirl wrote:
> On Thu, 21 Oct 2004 18:48:58 -0400, Jeff Garzik <jgarzik@pobox.com> wrote:
> > applied
> 
> I just pulled from Linus bk, for_each_pci_dev isn't defined anywhere.
> I get compile errors in hw_random.c.
> 
> [jonsmirl@smirl linux-2.5]$ grep -rI for_each_pci_dev *
> drivers/char/hw_random.c:       for_each_pci_dev(pdev) {
> SCCS/s.ChangeSet:c for_each_pci_dev is a macro wrapper around pci_get_device.
> [jonsmirl@smirl linux-2.5]$

I believe some people missed Hanna's first patch which defined
for_each_pci_dev so she sent it again a few days after. Here is her
message again...

-Nish

-------

I wrote this macro last week and was recently asked to resend it in case people
missed the original submission. I have been using it during my conversion to
pci_get_device and it seems to be fine.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---

diff -Nrup linux-2.6.9-rc3-mm2cln/include/linux/pci.h linux-2.6.9-rc3-mm2patch/include/linux/pci.h
--- linux-2.6.9-rc3-mm2cln/include/linux/pci.h	2004-10-04 11:38:51.000000000 -0700
+++ linux-2.6.9-rc3-mm2patch/include/linux/pci.h	2004-10-05 15:56:26.000000000 -0700
@@ -548,6 +548,7 @@ struct pci_dev {
 #define pci_dev_g(n) list_entry(n, struct pci_dev, global_list)
 #define pci_dev_b(n) list_entry(n, struct pci_dev, bus_list)
 #define	to_pci_dev(n) container_of(n, struct pci_dev, dev)
+#define for_each_pci_dev(d) while ((d = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
 
 /*
  *  For PCI devices, the region numbers are assigned this way:


--===============34716688325044132==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============34716688325044132==--
