From: Julia Lawall <julia@diku.dk>
Date: Wed, 10 Mar 2010 21:16:28 +0000
Subject: [PATCH 3/6] arch/x86/pci: Use kasprintf
Message-Id: <Pine.LNX.4.64.1003102215200.1672@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Julia Lawall <julia@diku.dk>

kasprintf combines kmalloc and sprintf, and takes care of the size
calculation itself.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@@
expression a,flag;
expression list args;
statement S;
@@

  a -  \(kmalloc\|kzalloc\)(...,flag)
+  kasprintf(flag,args)
  <... when != a
  if (a = NULL || ...) S
  ...>
- sprintf(a,args);
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/x86/pci/acpi.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff -u -p a/arch/x86/pci/acpi.c b/arch/x86/pci/acpi.c
--- a/arch/x86/pci/acpi.c
+++ b/arch/x86/pci/acpi.c
@@ -198,10 +198,9 @@ get_current_resources(struct acpi_device
 	if (!info.res)
 		goto res_alloc_fail;
 
-	info.name = kmalloc(16, GFP_KERNEL);
+	info.name = kasprintf(GFP_KERNEL, "PCI Bus %04x:%02x", domain, busnum);
 	if (!info.name)
 		goto name_alloc_fail;
-	sprintf(info.name, "PCI Bus %04x:%02x", domain, busnum);
 
 	info.res_num = 0;
 	acpi_walk_resources(device->handle, METHOD_NAME__CRS, setup_resource,
