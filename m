From: Hanna Linder <hannal@us.ibm.com>
Date: Thu, 14 Oct 2004 20:59:36 +0000
Subject: [KJ] [Patch 2.6] resend of macro to go through all pci devices
Message-Id: <250830000.1097787576@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45243419530994755=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============45243419530994755==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

> On Thu, 07 Oct 2004, Christoph Hellwig wrote:
> 
>> On Wed, Oct 06, 2004 at 01:23:21PM -0700, Hanna Linder wrote:
>> > --On Tuesday, October 05, 2004 10:44:43 AM +0100 Christoph Hellwig <hch@infradead.org> wrote:
>> > 
>> > > what about adding a for_each_pci_dev macro that nicely hides these AND_ID
>> > > iterations?
>> > > 
>> > 
>> > OK. How about this? Following are two patches that I used to test this
>> > new macro on my T23. I found roughly 54 other places this macro can
>> > be used.
>> 
>> Looks good to me

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



--===============45243419530994755==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45243419530994755==--
