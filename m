From: Hanna Linder <hannal@us.ibm.com>
Date: Wed, 06 Oct 2004 23:10:59 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6][1/12] arch/ppc/kernel/pci.c replace
Message-Id: <54140000.1097104259@w-hlinder.beaverton.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============12640713188034791=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <298570000.1096930681@w-hlinder.beaverton.ibm.com> <20041005104443.A16871@infradead.org>
In-Reply-To: <20041005104443.A16871@infradead.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Hanna Linder <hannal@us.ibm.com>, linux-kernel@vger.kernel.org, kernel-janitors@lists.osdl.org, benh@kernel.crashing.org, paulus@samba.org, greg@kroah.com

--===============12640713188034791==
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--On Tuesday, October 05, 2004 10:44:43 AM +0100 Christoph Hellwig <hch@infradead.org> wrote:

> On Mon, Oct 04, 2004 at 03:58:01PM -0700, Hanna Linder wrote:
>> 
>> As pci_find_device is going away I have replaced this call with pci_get_device.
>> If someone with a PPC system could verify it I would appreciate it. This is the only
>> one in ppc/kernel all the others are under ppc/platform. There will be 12 total.
> 
> what about adding a for_each_pci_dev macro that nicely hides these AND_ID
> iterations?
> 

Here is a re-roll of the original patch now with the new for_each_pci_dev macro instead.

Hanna Linder
IBM Linux Technology Center

Signed-off-by: Hanna Linder <hannal@us.ibm.com>

---

diff -Nrup linux-2.6.9-rc3-mm2cln/arch/ppc/kernel/pci.c linux-2.6.9-rc3-mm2patch/arch/ppc/kernel/pci.c
--- linux-2.6.9-rc3-mm2cln/arch/ppc/kernel/pci.c	2004-10-04 11:38:04.000000000 -0700
+++ linux-2.6.9-rc3-mm2patch/arch/ppc/kernel/pci.c	2004-10-06 16:03:20.302316368 -0700
@@ -503,7 +503,7 @@ pcibios_allocate_resources(int pass)
 	u16 command;
 	struct resource *r;
 
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		pci_read_config_word(dev, PCI_COMMAND, &command);
 		for (idx = 0; idx < 6; idx++) {
 			r = &dev->resource[idx];
@@ -540,7 +540,7 @@ pcibios_assign_resources(void)
 	int idx;
 	struct resource *r;
 
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		int class = dev->class >> 8;
 
 		/* Don't touch classless devices and host bridges */
@@ -866,7 +866,7 @@ pci_device_from_OF_node(struct device_no
 	 */
 	if (!pci_to_OF_bus_map)
 		return 0;
-	while ((dev = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL) {
+	for_each_pci_dev(dev) {
 		if (pci_to_OF_bus_map[dev->bus->number] != *bus)
 			continue;
 		if (dev->devfn != *devfn)



--===============12640713188034791==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============12640713188034791==--
