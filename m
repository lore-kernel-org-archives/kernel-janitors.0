From: Leonardo Potenza <lpotenza@inwind.it>
Date: Sun, 16 Aug 2009 16:55:48 +0000
Subject: [PATCH] x86: fix section mismatch warnings in kernel/apic/x2apic_uv_x.c
Message-Id: <200908161855.48302.lpotenza@inwind.it>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org
Cc: mingo@redhat.com, linux-kernel@vger.kernel.org

From: Leonardo Potenza <lpotenza@inwind.it>

The function uv_acpi_madt_oem_check() has been marked __init, the struct apic_x2apic_uv_x has been marked __refdata.
The aim is to remove the following section mismatch messages:

WARNING: arch/x86/kernel/apic/built-in.o(.data+0x1368): Section mismatch in reference from the variable apic_x2apic_uv_x to the function .cpuinit.text:uv_wakeup_secondary()
The variable apic_x2apic_uv_x references
the function __cpuinit uv_wakeup_secondary()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console, 

WARNING: arch/x86/kernel/built-in.o(.data+0x68e8): Section mismatch in reference from the variable apic_x2apic_uv_x to the function .cpuinit.text:uv_wakeup_secondary()
The variable apic_x2apic_uv_x references
the function __cpuinit uv_wakeup_secondary()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console,

WARNING: arch/x86/built-in.o(.text+0x7b36f): Section mismatch in reference from the function uv_acpi_madt_oem_check() to the function .init.text:early_ioremap()
The function uv_acpi_madt_oem_check() references
the function __init early_ioremap().
This is often because uv_acpi_madt_oem_check lacks a __init 
annotation or the annotation of early_ioremap is wrong.

WARNING: arch/x86/built-in.o(.text+0x7b38d): Section mismatch in reference from the function uv_acpi_madt_oem_check() to the function .init.text:early_iounmap()
The function uv_acpi_madt_oem_check() references
the function __init early_iounmap().
This is often because uv_acpi_madt_oem_check lacks a __init 
annotation or the annotation of early_iounmap is wrong.

WARNING: arch/x86/built-in.o(.data+0x8668): Section mismatch in reference from the variable apic_x2apic_uv_x to the function .cpuinit.text:uv_wakeup_secondary()
The variable apic_x2apic_uv_x references
the function __cpuinit uv_wakeup_secondary()
If the reference is valid then annotate the
variable with __init* or __refdata (see linux/init.h) or name the variable:
*driver, *_template, *_timer, *_sht, *_ops, *_probe, *_probe_one, *_console,

Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
---
Index: linux-2.6/arch/x86/kernel/apic/x2apic_uv_x.c
=================================--- linux-2.6.orig/arch/x86/kernel/apic/x2apic_uv_x.c	2009-08-16 17:48:15.000000000 +0200
+++ linux-2.6/arch/x86/kernel/apic/x2apic_uv_x.c	2009-08-16 17:52:05.000000000 +0200
@@ -46,7 +46,7 @@ static int early_get_nodeid(void)
 	return node_id.s.node_id;
 }
 
-static int uv_acpi_madt_oem_check(char *oem_id, char *oem_table_id)
+static int __init uv_acpi_madt_oem_check(char *oem_id, char *oem_table_id)
 {
 	if (!strcmp(oem_id, "SGI")) {
 		if (!strcmp(oem_table_id, "UVL"))
@@ -253,7 +253,7 @@ static void uv_send_IPI_self(int vector)
 	apic_write(APIC_SELF_IPI, vector);
 }
 
-struct apic apic_x2apic_uv_x = {
+struct apic __refdata apic_x2apic_uv_x = {
 
 	.name				= "UV large system",
 	.probe				= NULL,
