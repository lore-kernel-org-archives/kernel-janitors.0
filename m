From: Michael Veeck <michael.veeck@gmx.net>
Date: Sun, 15 Aug 2004 11:43:45 +0000
Subject: [Kernel-janitors] [PATCH] minmax-removal
Message-Id: <411F4C71.3070300@gmx.net>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------040401030403010402080003"
List-Id: <kernel-janitors.vger.kernel.org>
References: <411F4C54.4090609@gmx.net>
In-Reply-To: <411F4C54.4090609@gmx.net>
To: kernel-janitors@vger.kernel.org

This is a multi-part message in MIME format.
--------------040401030403010402080003
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Patch (against 2.6.8.1) removes unnecessary min/max macros and changes
calls to use kernel.h macros instead.

Since I dont have the hardware those patches are not tested.

Best regards
Veeck

Signed-off-by: Michael Veeck <michael.veeck@gmx.net>





--------------040401030403010402080003
Content-Type: text/plain;
 name="minmax-arch-ia64-sn.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="minmax-arch-ia64-sn.patch"

--- linux-2.6.8-old/arch/ia64/sn/fakeprom/fw-emu.c	2004-08-14 11:49:01.000000000 +0200
+++ linux-2.6.8-new/arch/ia64/sn/fakeprom/fw-emu.c	2004-08-15 13:01:12.151294760 +0200
@@ -77,8 +77,6 @@
 #define MB	(1024*1024UL)
 #define GB	(MB*1024UL)
 #define BOOT_PARAM_ADDR 0x40000
-#define MAX(i,j)		((i) > (j) ? (i) : (j))
-#define MIN(i,j)		((i) < (j) ? (i) : (j))
 #define ALIGN8(p)		(((long)(p) +7) & ~7)
 
 #define FPROM_BUG()		do {while (1);} while (0)
@@ -497,7 +495,7 @@ sys_fw_init (const char *args, int argle
 	num_nodes = GetNumNodes();
 	num_cpus = GetNumCpus();
 	for (max_nasid=0, cnode=0; cnode<num_nodes; cnode++)
-		max_nasid = MAX(max_nasid, GetNasid(cnode));
+		max_nasid = max(max_nasid, GetNasid(cnode));
 
 
 	memset(fw_mem, 0, sizeof(fw_mem));
@@ -670,7 +668,7 @@ sys_fw_init (const char *args, int argle
 	for (i=0; i<=max_nasid; i++)
 		for (j=0; j<=max_nasid; j++)
 			if (nasid_present(i) && nasid_present(j))
-				*(cp+PROXIMITY_DOMAIN(i)*acpi_slit->localities+PROXIMITY_DOMAIN(j)) = 10 + MIN(254, 5*abs(i-j));
+				*(cp+PROXIMITY_DOMAIN(i)*acpi_slit->localities+PROXIMITY_DOMAIN(j)) = 10 + min(254, 5*abs(i-j));
 
 	cp = acpi_slit->entry + acpi_slit->localities*acpi_slit->localities;
 	acpi_checksum(&acpi_slit->header, cp - (char*)acpi_slit);

--------------040401030403010402080003
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--------------040401030403010402080003--
