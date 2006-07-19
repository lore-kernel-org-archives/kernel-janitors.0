From: Tobias Klauser <tklauser@distanz.ch>
Date: Wed, 19 Jul 2006 06:42:35 +0000
Subject: [KJ] [UPDATE PATCH] arch/alpha: Use ARRAY_SIZE macro
Message-Id: <20060719064235.GD20243@neon.tklauser.home>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0]) and remove a duplicate of
the macro. Also remove some trailing whitespaces and needless braces.

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/alpha/kernel/err_ev7.c     |    8 ++----
 arch/alpha/kernel/osf_sys.c     |    4 ++-
 arch/alpha/kernel/setup.c       |   50 +++++++++++++++++++--------------------
 arch/alpha/kernel/sys_ruffian.c |    8 +++---
 arch/alpha/kernel/time.c        |    2 +-
 5 files changed, 34 insertions(+), 38 deletions(-)

diff --git a/arch/alpha/kernel/err_ev7.c b/arch/alpha/kernel/err_ev7.c
index bf52ba6..fed6b3d 100644
--- a/arch/alpha/kernel/err_ev7.c
+++ b/arch/alpha/kernel/err_ev7.c
@@ -274,16 +274,14 @@ ev7_process_pal_subpacket(struct el_subp
 struct el_subpacket_handler ev7_pal_subpacket_handler  	SUBPACKET_HANDLER_INIT(EL_CLASS__PAL, ev7_process_pal_subpacket);
 
-void 
+void
 ev7_register_error_handlers(void)
 {
 	int i;
 
-	for(i = 0;
-	    i<sizeof(el_ev7_pal_annotations)/sizeof(el_ev7_pal_annotations[1]);
-	    i++) {
+	for (i = 0; i < ARRAY_SIZE(el_ev7_pal_annotations); i++)
 		cdl_register_subpacket_annotation(&el_ev7_pal_annotations[i]);
-	}	
+
 	cdl_register_subpacket_handler(&ev7_pal_subpacket_handler);
 }
 
diff --git a/arch/alpha/kernel/osf_sys.c b/arch/alpha/kernel/osf_sys.c
index e15dcf4..73c7622 100644
--- a/arch/alpha/kernel/osf_sys.c
+++ b/arch/alpha/kernel/osf_sys.c
@@ -623,12 +623,12 @@ osf_sysinfo(int command, char __user *bu
 	long len, err = -EINVAL;
 
 	offset = command-1;
-	if (offset >= sizeof(sysinfo_table)/sizeof(char *)) {
+	if (offset >= ARRAY_SIZE(sysinfo_table)) {
 		/* Digital UNIX has a few unpublished interfaces here */
 		printk("sysinfo(%d)", command);
 		goto out;
 	}
-	
+
 	down_read(&uts_sem);
 	res = sysinfo_table[offset];
 	len = strlen(res)+1;
diff --git a/arch/alpha/kernel/setup.c b/arch/alpha/kernel/setup.c
index 2cb9c43..fd4a8fa 100644
--- a/arch/alpha/kernel/setup.c
+++ b/arch/alpha/kernel/setup.c
@@ -114,8 +114,6 @@ struct alpha_machine_vector alpha_mv;
 int alpha_using_srm;
 #endif
 
-#define N(a) (sizeof(a)/sizeof(a[0]))
-
 static struct alpha_machine_vector *get_sysvec(unsigned long, unsigned long,
 					       unsigned long);
 static struct alpha_machine_vector *get_sysvec_byname(const char *);
@@ -240,7 +238,7 @@ reserve_std_resources(void)
 	standard_io_resources[0].start = RTC_PORT(0);
 	standard_io_resources[0].end = RTC_PORT(0) + 0x10;
 
-	for (i = 0; i < N(standard_io_resources); ++i)
+	for (i = 0; i < ARRAY_SIZE(standard_io_resources); ++i)
 		request_resource(io, standard_io_resources+i);
 }
 
@@ -918,13 +916,13 @@ get_sysvec(unsigned long type, unsigned 
 
 	/* Search the system tables first... */
 	vec = NULL;
-	if (type < N(systype_vecs)) {
+	if (type < ARRAY_SIZE(systype_vecs)) {
 		vec = systype_vecs[type];
 	} else if ((type > ST_API_BIAS) &&
-		   (type - ST_API_BIAS) < N(api_vecs)) {
+		   (type - ST_API_BIAS) < ARRAY_SIZE(api_vecs)) {
 		vec = api_vecs[type - ST_API_BIAS];
 	} else if ((type > ST_UNOFFICIAL_BIAS) &&
-		   (type - ST_UNOFFICIAL_BIAS) < N(unofficial_vecs)) {
+		   (type - ST_UNOFFICIAL_BIAS) < ARRAY_SIZE(unofficial_vecs)) {
 		vec = unofficial_vecs[type - ST_UNOFFICIAL_BIAS];
 	}
 
@@ -938,11 +936,11 @@ get_sysvec(unsigned long type, unsigned 
 
 		switch (type) {
 		case ST_DEC_ALCOR:
-			if (member < N(alcor_indices))
+			if (member < ARRAY_SIZE(alcor_indices))
 				vec = alcor_vecs[alcor_indices[member]];
 			break;
 		case ST_DEC_EB164:
-			if (member < N(eb164_indices))
+			if (member < ARRAY_SIZE(eb164_indices))
 				vec = eb164_vecs[eb164_indices[member]];
 			/* PC164 may show as EB164 variation with EV56 CPU,
 			   but, since no true EB164 had anything but EV5... */
@@ -950,24 +948,24 @@ get_sysvec(unsigned long type, unsigned 
 				vec = &pc164_mv;
 			break;
 		case ST_DEC_EB64P:
-			if (member < N(eb64p_indices))
+			if (member < ARRAY_SIZE(eb64p_indices))
 				vec = eb64p_vecs[eb64p_indices[member]];
 			break;
 		case ST_DEC_EB66:
-			if (member < N(eb66_indices))
+			if (member < ARRAY_SIZE(eb66_indices))
 				vec = eb66_vecs[eb66_indices[member]];
 			break;
 		case ST_DEC_MARVEL:
-			if (member < N(marvel_indices))
+			if (member < ARRAY_SIZE(marvel_indices))
 				vec = marvel_vecs[marvel_indices[member]];
 			break;
 		case ST_DEC_TITAN:
 			vec = titan_vecs[0];	/* default */
-			if (member < N(titan_indices))
+			if (member < ARRAY_SIZE(titan_indices))
 				vec = titan_vecs[titan_indices[member]];
 			break;
 		case ST_DEC_TSUNAMI:
-			if (member < N(tsunami_indices))
+			if (member < ARRAY_SIZE(tsunami_indices))
 				vec = tsunami_vecs[tsunami_indices[member]];
 			break;
 		case ST_DEC_1000:
@@ -1039,7 +1037,7 @@ get_sysvec_byname(const char *name)
 
 	size_t i;
 
-	for (i = 0; i < N(all_vecs); ++i) {
+	for (i = 0; i < ARRAY_SIZE(all_vecs); ++i) {
 		struct alpha_machine_vector *mv = all_vecs[i];
 		if (strcasecmp(mv->vector_name, name) = 0)
 			return mv;
@@ -1055,13 +1053,13 @@ get_sysnames(unsigned long type, unsigne
 
 	/* If not in the tables, make it UNKNOWN,
 	   else set type name to family */
-	if (type < N(systype_names)) {
+	if (type < ARRAY_SIZE(systype_names)) {
 		*type_name = systype_names[type];
 	} else if ((type > ST_API_BIAS) &&
-		   (type - ST_API_BIAS) < N(api_names)) {
+		   (type - ST_API_BIAS) < ARRAY_SIZE(api_names)) {
 		*type_name = api_names[type - ST_API_BIAS];
 	} else if ((type > ST_UNOFFICIAL_BIAS) &&
-		   (type - ST_UNOFFICIAL_BIAS) < N(unofficial_names)) {
+		   (type - ST_UNOFFICIAL_BIAS) < ARRAY_SIZE(unofficial_names)) {
 		*type_name = unofficial_names[type - ST_UNOFFICIAL_BIAS];
 	} else {
 		*type_name = sys_unknown;
@@ -1083,7 +1081,7 @@ get_sysnames(unsigned long type, unsigne
 	default: /* default to variation "0" for now */
 		break;
 	case ST_DEC_EB164:
-		if (member < N(eb164_indices))
+		if (member < ARRAY_SIZE(eb164_indices))
 			*variation_name = eb164_names[eb164_indices[member]];
 		/* PC164 may show as EB164 variation, but with EV56 CPU,
 		   so, since no true EB164 had anything but EV5... */
@@ -1091,32 +1089,32 @@ get_sysnames(unsigned long type, unsigne
 			*variation_name = eb164_names[1]; /* make it PC164 */
 		break;
 	case ST_DEC_ALCOR:
-		if (member < N(alcor_indices))
+		if (member < ARRAY_SIZE(alcor_indices))
 			*variation_name = alcor_names[alcor_indices[member]];
 		break;
 	case ST_DEC_EB64P:
-		if (member < N(eb64p_indices))
+		if (member < ARRAY_SIZE(eb64p_indices))
 			*variation_name = eb64p_names[eb64p_indices[member]];
 		break;
 	case ST_DEC_EB66:
-		if (member < N(eb66_indices))
+		if (member < ARRAY_SIZE(eb66_indices))
 			*variation_name = eb66_names[eb66_indices[member]];
 		break;
 	case ST_DEC_MARVEL:
-		if (member < N(marvel_indices))
+		if (member < ARRAY_SIZE(marvel_indices))
 			*variation_name = marvel_names[marvel_indices[member]];
 		break;
 	case ST_DEC_RAWHIDE:
-		if (member < N(rawhide_indices))
+		if (member < ARRAY_SIZE(rawhide_indices))
 			*variation_name = rawhide_names[rawhide_indices[member]];
 		break;
 	case ST_DEC_TITAN:
 		*variation_name = titan_names[0];	/* default */
-		if (member < N(titan_indices))
+		if (member < ARRAY_SIZE(titan_indices))
 			*variation_name = titan_names[titan_indices[member]];
 		break;
 	case ST_DEC_TSUNAMI:
-		if (member < N(tsunami_indices))
+		if (member < ARRAY_SIZE(tsunami_indices))
 			*variation_name = tsunami_names[tsunami_indices[member]];
 		break;
 	}
@@ -1211,7 +1209,7 @@ show_cpuinfo(struct seq_file *f, void *s
 
 	cpu_index = (unsigned) (cpu->type - 1);
 	cpu_name = "Unknown";
-	if (cpu_index < N(cpu_names))
+	if (cpu_index < ARRAY_SIZE(cpu_names))
 		cpu_name = cpu_names[cpu_index];
 
 	get_sysnames(hwrpb->sys_type, hwrpb->sys_variation,
diff --git a/arch/alpha/kernel/sys_ruffian.c b/arch/alpha/kernel/sys_ruffian.c
index 78c30de..5b99cf3 100644
--- a/arch/alpha/kernel/sys_ruffian.c
+++ b/arch/alpha/kernel/sys_ruffian.c
@@ -182,16 +182,16 @@ static unsigned long __init
 ruffian_get_bank_size(unsigned long offset)
 {
 	unsigned long bank_addr, bank, ret = 0;
-  
+
 	/* Valid offsets are: 0x800, 0x840 and 0x880
 	   since Ruffian only uses three banks.  */
 	bank_addr = (unsigned long)PYXIS_MCR + offset;
 	bank = *(vulp)bank_addr;
-    
+
 	/* Check BANK_ENABLE */
 	if (bank & 0x01) {
 		static unsigned long size[] __initdata = {
-			0x40000000UL, /* 0x00,   1G */ 
+			0x40000000UL, /* 0x00,   1G */
 			0x20000000UL, /* 0x02, 512M */
 			0x10000000UL, /* 0x04, 256M */
 			0x08000000UL, /* 0x06, 128M */
@@ -203,7 +203,7 @@ ruffian_get_bank_size(unsigned long offs
 		};
 
 		bank = (bank & 0x1e) >> 1;
-		if (bank < sizeof(size)/sizeof(*size))
+		if (bank < ARRAY_SIZE(size))
 			ret = size[bank];
 	}
 
diff --git a/arch/alpha/kernel/time.c b/arch/alpha/kernel/time.c
index 50eccde..b191cc7 100644
--- a/arch/alpha/kernel/time.c
+++ b/arch/alpha/kernel/time.c
@@ -233,7 +233,7 @@ validate_cc_value(unsigned long cc)
 	index = cpu->type & 0xffffffff;
 
 	/* If index out of bounds, no way to validate.  */
-	if (index >= sizeof(cpu_hz)/sizeof(cpu_hz[0]))
+	if (index >= ARRAY_SIZE(cpu_hz))
 		return cc;
 
 	/* If index contains no data, no way to validate.  */
-- 
1.4.1

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
