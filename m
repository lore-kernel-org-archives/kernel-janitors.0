From: Amit Gud <amitg@calsoftinc.com>
Date: Mon, 14 Feb 2005 05:58:10 +0000
Subject: [KJ] [PATCH 6/18] drivers/macintosh/ remove pci_find_{device,
Message-Id: <200502141116.12787.amitg@calsoftinc.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============93950126686050117=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============93950126686050117==
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Remove deprecated pci_find_device and pci_find_subsys


AG
--
May the source be with you


Signed-off-by: Amit Gud <gud@eth.net>

diff -uprN orig/drivers/macintosh/via-pmu68k.c linux-2.6.11-rc3/drivers/macintosh/via-pmu68k.c
--- orig/drivers/macintosh/via-pmu68k.c	2004-10-19 03:23:21.000000000 +0530
+++ linux-2.6.11-rc3/drivers/macintosh/via-pmu68k.c	2005-02-14 05:20:34.000000000 +0530
@@ -843,7 +843,7 @@ pbook_pci_save(void)
 	struct pci_save *ps;
 
 	npci = 0;
-	while ((pd = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pd)) != NULL)
+	while ((pd = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pd)) != NULL)
 		++npci;
 	n_pbook_pci_saves = npci;
 	if (npci == 0)
@@ -854,7 +854,7 @@ pbook_pci_save(void)
 		return;
 
 	pd = NULL;
-	while ((pd = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pd)) != NULL) {
+	while ((pd = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pd)) != NULL) {
 		pci_read_config_word(pd, PCI_COMMAND, &ps->command);
 		pci_read_config_word(pd, PCI_CACHE_LINE_SIZE, &ps->cache_lat);
 		pci_read_config_word(pd, PCI_INTERRUPT_LINE, &ps->intr);
@@ -871,7 +871,7 @@ pbook_pci_restore(void)
 	struct pci_dev *pd = NULL;
 	int j;
 
-	while ((pd = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pd)) != NULL) {
+	while ((pd = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pd)) != NULL) {
 		if (ps->command == 0)
 			continue;
 		pci_read_config_word(pd, PCI_COMMAND, &cmd);
diff -uprN orig/drivers/macintosh/via-pmu.c linux-2.6.11-rc3/drivers/macintosh/via-pmu.c
--- orig/drivers/macintosh/via-pmu.c	2005-02-11 15:19:46.000000000 +0530
+++ linux-2.6.11-rc3/drivers/macintosh/via-pmu.c	2005-02-14 05:20:08.000000000 +0530
@@ -2141,7 +2141,7 @@ pbook_alloc_pci_save(void)
 	struct pci_dev *pd = NULL;
 
 	npci = 0;
-	while ((pd = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pd)) != NULL) {
+	while ((pd = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pd)) != NULL) {
 		++npci;
 	}
 	if (npci == 0)
@@ -2171,7 +2171,7 @@ pbook_pci_save(void)
 	if (ps == NULL)
 		return;
 
-	while ((pd = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pd)) != NULL) {
+	while ((pd = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pd)) != NULL) {
 		if (npci-- == 0)
 			return;
 #ifndef HACKED_PCI_SAVE
@@ -2201,7 +2201,7 @@ pbook_pci_restore(void)
 	int npci = pbook_npci_saves;
 	int j;
 
-	while ((pd = pci_find_device(PCI_ANY_ID, PCI_ANY_ID, pd)) != NULL) {
+	while ((pd = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, pd)) != NULL) {
 #ifdef HACKED_PCI_SAVE
 		int i;
 		if (npci-- == 0)


--===============93950126686050117==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============93950126686050117==--
