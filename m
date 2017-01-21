From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Jan 2017 18:13:33 +0000
Subject: [PATCH 4/5] s390/pci: Move an assignment for the variable "ret" in s390_pci_mmio_write()
Message-Id: <ba783658-2c08-8e92-7f6a-16696c89b476@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <f2233afd-bc54-0697-0709-9577e96fc6a6@users.sourceforge.net>
In-Reply-To: <f2233afd-bc54-0697-0709-9577e96fc6a6@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-s390@vger.kernel.org, =?UTF-8?Q?Gerald_Sch=c3=a4fer?= <gerald.schaefer@de.ibm.com>, Heiko Carstens <heiko.carstens@de.ibm.com>, Martin Schwidefsky <schwidefsky@de.ibm.com>, Sebastian Ott <sebott@linux.vnet.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 21 Jan 2017 18:35:00 +0100

A local variable was set to an error code before a concrete error situation
was detected. Thus move the corresponding assignment into an if branch
to indicate a software failure there.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/s390/pci/pci_mmio.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/s390/pci/pci_mmio.c b/arch/s390/pci/pci_mmio.c
index b1bb2b72302c..f125858a77e9 100644
--- a/arch/s390/pci/pci_mmio.c
+++ b/arch/s390/pci/pci_mmio.c
@@ -57,12 +57,11 @@ SYSCALL_DEFINE3(s390_pci_mmio_write, unsigned long, mmio_addr,
 		goto out;
 	io_addr = (void __iomem *)((pfn << PAGE_SHIFT) | (mmio_addr & ~PAGE_MASK));
 
-	ret = -EFAULT;
-	if ((unsigned long) io_addr < ZPCI_IOMAP_ADDR_BASE)
-		goto out;
-
-	if (copy_from_user(buf, user_buffer, length))
+	if ((unsigned long)io_addr < ZPCI_IOMAP_ADDR_BASE ||
+	    copy_from_user(buf, user_buffer, length)) {
+		ret = -EFAULT;
 		goto out;
+	}
 
 	ret = zpci_memcpy_toio(io_addr, buf, length);
 out:
-- 
2.11.0

