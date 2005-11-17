From: Tobias Klauser <tklauser@nuerscht.ch>
Date: Thu, 17 Nov 2005 08:15:09 +0000
Subject: [KJ] [PATCH] drivers/char: Use ARRAY_SIZE macro
Message-Id: <20051117081508.GA1158@neon.tklauser.home>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19359406358721643=="
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org

--===============19359406358721643==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Use ARRAY_SIZE macro instead of sizeof(x)/sizeof(x[0]) and remove
duplicates of ARRAY_SIZE

Signed-off-by: Tobias Klauser <tklauser@nuerscht.ch>

---

 amiserial.c          |    2 +-
 cyclades.c           |    2 +-
 hvsi.c               |    2 +-
 istallion.c          |   19 ++++++-------------
 moxa.c               |    2 +-
 mxser.c              |    2 +-
 nvram.c              |   12 +++++-------
 pcmcia/synclink_cs.c |    4 ++--
 rio/rio_linux.c      |    2 +-
 riscom8.c            |    8 ++++----
 serial167.c          |    2 +-
 stallion.c           |   15 +++++----------
 sx.c                 |    6 +++---
 synclink.c           |    8 ++++----
 synclinkmp.c         |    4 ++--
 vme_scc.c            |    4 ++--
 vr41xx_rtc.c         |    2 +-
 17 files changed, 41 insertions(+), 55 deletions(-)

diff -urpN linux-2.6.15-rc1/drivers/char/amiserial.c linux-2.6.15-rc1~array_size/drivers/char/amiserial.c
--- linux-2.6.15-rc1/drivers/char/amiserial.c	2005-10-28 08:56:26.000000000 +0200
+++ linux-2.6.15-rc1~array_size/drivers/char/amiserial.c	2005-11-16 08:02:39.000000000 +0100
@@ -116,7 +116,7 @@ static void rs_wait_until_sent(struct tt
 
 static struct serial_state rs_table[1];
 
-#define NR_PORTS	(sizeof(rs_table)/sizeof(struct serial_state))
+#define NR_PORTS ARRAY_SIZE(rs_table)
 
 /*
  * tmp_buf is used as a temporary buffer by serial_write.  We need to
diff -urpN linux-2.6.15-rc1/drivers/char/cyclades.c linux-2.6.15-rc1~array_size/drivers/char/cyclades.c
--- linux-2.6.15-rc1/drivers/char/cyclades.c	2005-11-15 23:31:48.000000000 +0100
+++ linux-2.6.15-rc1~array_size/drivers/char/cyclades.c	2005-11-16 08:02:40.000000000 +0100
@@ -723,7 +723,7 @@ static unsigned int cy_isa_addresses[] =
         0xDE000,
         0,0,0,0,0,0,0,0
 };
-#define NR_ISA_ADDRS (sizeof(cy_isa_addresses)/sizeof(unsigned char*))
+#define NR_ISA_ADDRS ARRAY_SIZE(cy_isa_addresses)
 
 #ifdef MODULE
 static long maddr[NR_CARDS] = { 0, };
diff -urpN linux-2.6.15-rc1/drivers/char/hvsi.c linux-2.6.15-rc1~array_size/drivers/char/hvsi.c
--- linux-2.6.15-rc1/drivers/char/hvsi.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.15-rc1~array_size/drivers/char/hvsi.c	2005-11-16 08:02:40.000000000 +0100
@@ -197,7 +197,7 @@ static inline void print_state(struct hv
 	};
 	const char *name = state_names[hp->state];
 
-	if (hp->state > (sizeof(state_names)/sizeof(char*)))
+	if (hp->state > ARRAY_SIZE(state_names))
 		name = "UNKNOWN";
 
 	pr_debug("hvsi%i: state = %s\n", hp->index, name);
diff -urpN linux-2.6.15-rc1/drivers/char/istallion.c linux-2.6.15-rc1~array_size/drivers/char/istallion.c
--- linux-2.6.15-rc1/drivers/char/istallion.c	2005-11-15 23:31:48.000000000 +0100
+++ linux-2.6.15-rc1~array_size/drivers/char/istallion.c	2005-11-17 08:56:39.000000000 +0100
@@ -135,7 +135,7 @@ static stlconf_t	stli_brdconf[] = {
 	/*{ BRD_ECP, 0x2a0, 0, 0xcc000, 0, 0 },*/
 };
 
-static int	stli_nrbrds = sizeof(stli_brdconf) / sizeof(stlconf_t);
+static int	stli_nrbrds = ARRAY_SIZE(stli_brdconf);
 
 /*
  *	There is some experimental EISA board detection code in this driver.
@@ -406,7 +406,7 @@ static unsigned long	stli_eisamemprobead
 	0xff000000, 0xff010000, 0xff020000, 0xff030000,
 };
 
-static int	stli_eisamempsize = sizeof(stli_eisamemprobeaddrs) / sizeof(unsigned long);
+static int	stli_eisamempsize = ARRAY_SIZE(stli_eisamemprobeaddrs);
 
 /*
  *	Define the Stallion PCI vendor and device IDs.
@@ -899,15 +899,13 @@ static void stli_argbrds(void)
 {
 	stlconf_t	conf;
 	stlibrd_t	*brdp;
-	int		nrargs, i;
+	int		i;
 
 #ifdef DEBUG
 	printk("stli_argbrds()\n");
 #endif
 
-	nrargs = sizeof(stli_brdsp) / sizeof(char **);
-
-	for (i = stli_nrbrds; (i < nrargs); i++) {
+	for (i = stli_nrbrds; i < ARRAY_SIZE(stli_brdsp); i++) {
 		memset(&conf, 0, sizeof(conf));
 		if (stli_parsebrd(&conf, stli_brdsp[i]) == 0)
 			continue;
@@ -967,7 +965,7 @@ static unsigned long stli_atol(char *str
 static int stli_parsebrd(stlconf_t *confp, char **argp)
 {
 	char	*sp;
-	int	nrbrdnames, i;
+	int	i;
 
 #ifdef DEBUG
 	printk("stli_parsebrd(confp=%x,argp=%x)\n", (int) confp, (int) argp);
@@ -979,15 +977,10 @@ static int stli_parsebrd(stlconf_t *conf
 	for (sp = argp[0], i = 0; ((*sp != 0) && (i < 25)); sp++, i++)
 		*sp = TOLOWER(*sp);
 
-	nrbrdnames = sizeof(stli_brdstr) / sizeof(stlibrdtype_t);
-	for (i = 0; (i < nrbrdnames); i++) {
+	for (i = 0; i < ARRAY_SIZE(stli_brdstr); i++) {
 		if (strcmp(stli_brdstr[i].name, argp[0]) == 0)
 			break;
 	}
-	if (i >= nrbrdnames) {
-		printk("STALLION: unknown board name, %s?\n", argp[0]);
-		return(0);
-	}
 
 	confp->brdtype = stli_brdstr[i].type;
 	if ((argp[1] != (char *) NULL) && (*argp[1] != 0))
diff -urpN linux-2.6.15-rc1/drivers/char/moxa.c linux-2.6.15-rc1~array_size/drivers/char/moxa.c
--- linux-2.6.15-rc1/drivers/char/moxa.c	2005-10-28 08:56:26.000000000 +0200
+++ linux-2.6.15-rc1~array_size/drivers/char/moxa.c	2005-11-16 08:02:40.000000000 +0100
@@ -448,7 +448,7 @@ static int __init moxa_init(void)
 #ifdef CONFIG_PCI
 	{
 		struct pci_dev *p = NULL;
-		int n = (sizeof(moxa_pcibrds) / sizeof(moxa_pcibrds[0])) - 1;
+		int n = ARRAY_SIZE(moxa_pcibrds) - 1;
 		i = 0;
 		while (i < n) {
 			while ((p = pci_get_device(moxa_pcibrds[i].vendor, moxa_pcibrds[i].device, p))!=NULL)
diff -urpN linux-2.6.15-rc1/drivers/char/mxser.c linux-2.6.15-rc1~array_size/drivers/char/mxser.c
--- linux-2.6.15-rc1/drivers/char/mxser.c	2005-11-15 23:31:48.000000000 +0100
+++ linux-2.6.15-rc1~array_size/drivers/char/mxser.c	2005-11-16 08:02:40.000000000 +0100
@@ -813,7 +813,7 @@ static int mxser_init(void)
 
 	/* start finding PCI board here */
 #ifdef CONFIG_PCI
-	n = (sizeof(mxser_pcibrds) / sizeof(mxser_pcibrds[0])) - 1;
+	n = ARRAY_SIZE(mxser_pcibrds) - 1;
 	index = 0;
 	b = 0;
 	while (b < n) {
diff -urpN linux-2.6.15-rc1/drivers/char/nvram.c linux-2.6.15-rc1~array_size/drivers/char/nvram.c
--- linux-2.6.15-rc1/drivers/char/nvram.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.15-rc1~array_size/drivers/char/nvram.c	2005-11-16 08:02:40.000000000 +0100
@@ -557,13 +557,13 @@ pc_proc_infos(unsigned char *nvram, char
 	    (nvram[6] & 1) ? (nvram[6] >> 6) + 1 : 0);
 	PRINT_PROC("Floppy 0 type  : ");
 	type = nvram[2] >> 4;
-	if (type < sizeof (floppy_types) / sizeof (*floppy_types))
+	if (type < ARRAY_SIZE(floppy_types))
 		PRINT_PROC("%s\n", floppy_types[type]);
 	else
 		PRINT_PROC("%d (unknown)\n", type);
 	PRINT_PROC("Floppy 1 type  : ");
 	type = nvram[2] & 0x0f;
-	if (type < sizeof (floppy_types) / sizeof (*floppy_types))
+	if (type < ARRAY_SIZE(floppy_types))
 		PRINT_PROC("%s\n", floppy_types[type]);
 	else
 		PRINT_PROC("%d (unknown)\n", type);
@@ -843,8 +843,6 @@ static char *colors[] = {
 	"2", "4", "16", "256", "65536", "??", "??", "??"
 };
 
-#define fieldsize(a)	(sizeof(a)/sizeof(*a))
-
 static int
 atari_proc_infos(unsigned char *nvram, char *buffer, int *len,
     off_t *begin, off_t offset, int size)
@@ -856,7 +854,7 @@ atari_proc_infos(unsigned char *nvram, c
 	PRINT_PROC("Checksum status  : %svalid\n", checksum ? "" : "not ");
 
 	PRINT_PROC("Boot preference  : ");
-	for (i = fieldsize(boot_prefs) - 1; i >= 0; --i) {
+	for (i = ARRAY_SIZE(boot_prefs) - 1; i >= 0; --i) {
 		if (nvram[1] == boot_prefs[i].val) {
 			PRINT_PROC("%s\n", boot_prefs[i].name);
 			break;
@@ -878,12 +876,12 @@ atari_proc_infos(unsigned char *nvram, c
 		return 1;
 
 	PRINT_PROC("OS language      : ");
-	if (nvram[6] < fieldsize(languages))
+	if (nvram[6] < ARRAY_SIZE(languages))
 		PRINT_PROC("%s\n", languages[nvram[6]]);
 	else
 		PRINT_PROC("%u (undefined)\n", nvram[6]);
 	PRINT_PROC("Keyboard language: ");
-	if (nvram[7] < fieldsize(languages))
+	if (nvram[7] < ARRAY_SIZE(languages))
 		PRINT_PROC("%s\n", languages[nvram[7]]);
 	else
 		PRINT_PROC("%u (undefined)\n", nvram[7]);
diff -urpN linux-2.6.15-rc1/drivers/char/pcmcia/synclink_cs.c linux-2.6.15-rc1~array_size/drivers/char/pcmcia/synclink_cs.c
--- linux-2.6.15-rc1/drivers/char/pcmcia/synclink_cs.c	2005-11-15 23:31:48.000000000 +0100
+++ linux-2.6.15-rc1~array_size/drivers/char/pcmcia/synclink_cs.c	2005-11-16 08:02:40.000000000 +0100
@@ -4057,7 +4057,7 @@ BOOLEAN register_test(MGSLPC_INFO *info)
 {
 	static unsigned char patterns[] = 
 	    { 0x00, 0xff, 0xaa, 0x55, 0x69, 0x96, 0x0f };
-	static unsigned int count = sizeof(patterns) / sizeof(patterns[0]);
+	static unsigned int count = ARRAY_SIZE(patterns);
 	unsigned int i;
 	BOOLEAN rc = TRUE;
 	unsigned long flags;
@@ -4068,7 +4068,7 @@ BOOLEAN register_test(MGSLPC_INFO *info)
 	for (i = 0; i < count; i++) {
 		write_reg(info, XAD1, patterns[i]);
 		write_reg(info, XAD2, patterns[(i + 1) % count]);
-		if ((read_reg(info, XAD1) != patterns[i]) || 
+		if ((read_reg(info, XAD1) != patterns[i]) ||
 		    (read_reg(info, XAD2) != patterns[(i + 1) % count])) {
 			rc = FALSE;
 			break;
diff -urpN linux-2.6.15-rc1/drivers/char/rio/rio_linux.c linux-2.6.15-rc1~array_size/drivers/char/rio/rio_linux.c
--- linux-2.6.15-rc1/drivers/char/rio/rio_linux.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.15-rc1~array_size/drivers/char/rio/rio_linux.c	2005-11-16 08:02:40.000000000 +0100
@@ -215,7 +215,7 @@ static int rio_poll = 1;
    or less.... */
 static int rio_probe_addrs[]= {0xc0000, 0xd0000, 0xe0000};
 
-#define NR_RIO_ADDRS (sizeof(rio_probe_addrs)/sizeof (int))
+#define NR_RIO_ADDRS ARRAY_SIZE(rio_probe_addrs)
 
 
 /* Set the mask to all-ones. This alas, only supports 32 interrupts. 
diff -urpN linux-2.6.15-rc1/drivers/char/riscom8.c linux-2.6.15-rc1~array_size/drivers/char/riscom8.c
--- linux-2.6.15-rc1/drivers/char/riscom8.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.15-rc1~array_size/drivers/char/riscom8.c	2005-11-16 08:02:40.000000000 +0100
@@ -107,15 +107,15 @@ static struct riscom_port rc_port[RC_NBO
 
 /* RISCom/8 I/O ports addresses (without address translation) */
 static unsigned short rc_ioport[] =  {
-#if 1	
+#if 1
 	0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x09, 0x0a, 0x0b, 0x0c,
-#else	
+#else
 	0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x09, 0x0a, 0x0b, 0x0c, 0x10,
 	0x11, 0x12, 0x18, 0x28, 0x31, 0x32, 0x39, 0x3a, 0x40, 0x41, 0x61, 0x62,
 	0x63, 0x64, 0x6b, 0x70, 0x71, 0x78, 0x7a, 0x7b, 0x7f, 0x100, 0x101
-#endif	
+#endif
 };
-#define RC_NIOPORT	(sizeof(rc_ioport) / sizeof(rc_ioport[0]))
+#define RC_NIOPORT	ARRAY_SIZE(rc_ioport)
 
 
 static inline int rc_paranoia_check(struct riscom_port const * port,
diff -urpN linux-2.6.15-rc1/drivers/char/serial167.c linux-2.6.15-rc1~array_size/drivers/char/serial167.c
--- linux-2.6.15-rc1/drivers/char/serial167.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.15-rc1~array_size/drivers/char/serial167.c	2005-11-16 08:02:40.000000000 +0100
@@ -117,7 +117,7 @@ struct cyclades_port cy_port[] = {
         {-1 },      /* ttyS2 */
         {-1 },      /* ttyS3 */
 };
-#define NR_PORTS        (sizeof(cy_port)/sizeof(struct cyclades_port))
+#define NR_PORTS        ARRAY_SIZE(cy_port)
 
 /*
  * tmp_buf is used as a temporary buffer by serial_write.  We need to
diff -urpN linux-2.6.15-rc1/drivers/char/stallion.c linux-2.6.15-rc1~array_size/drivers/char/stallion.c
--- linux-2.6.15-rc1/drivers/char/stallion.c	2005-11-15 23:31:48.000000000 +0100
+++ linux-2.6.15-rc1~array_size/drivers/char/stallion.c	2005-11-16 08:02:40.000000000 +0100
@@ -103,7 +103,7 @@ static stlconf_t	stl_brdconf[] = {
 	/*{ BRD_EASYIO, 0x2a0, 0, 0, 10, 0 },*/
 };
 
-static int	stl_nrbrds = sizeof(stl_brdconf) / sizeof(stlconf_t);
+static int	stl_nrbrds = ARRAY_SIZE(stl_brdconf);
 
 /*****************************************************************************/
 
@@ -424,7 +424,7 @@ static stlpcibrd_t	stl_pcibrds[] = {
 	{ PCI_VENDOR_ID_NS, PCI_DEVICE_ID_NS_87410, BRD_ECHPCI },
 };
 
-static int	stl_nrpcibrds = sizeof(stl_pcibrds) / sizeof(stlpcibrd_t);
+static int	stl_nrpcibrds = ARRAY_SIZE(stl_pcibrds);
 
 #endif
 
@@ -704,7 +704,7 @@ static unsigned int	sc26198_baudtable[] 
 	230400, 460800, 921600
 };
 
-#define	SC26198_NRBAUDS		(sizeof(sc26198_baudtable) / sizeof(unsigned int))
+#define	SC26198_NRBAUDS		ARRAY_SIZE(sc26198_baudtable)
 
 /*****************************************************************************/
 
@@ -901,7 +901,7 @@ static unsigned long stl_atol(char *str)
 static int stl_parsebrd(stlconf_t *confp, char **argp)
 {
 	char	*sp;
-	int	nrbrdnames, i;
+	int	i;
 
 #ifdef DEBUG
 	printk("stl_parsebrd(confp=%x,argp=%x)\n", (int) confp, (int) argp);
@@ -913,15 +913,10 @@ static int stl_parsebrd(stlconf_t *confp
 	for (sp = argp[0], i = 0; ((*sp != 0) && (i < 25)); sp++, i++)
 		*sp = TOLOWER(*sp);
 
-	nrbrdnames = sizeof(stl_brdstr) / sizeof(stlbrdtype_t);
-	for (i = 0; (i < nrbrdnames); i++) {
+	for (i = 0; i < ARRAY_SIZE(stl_brdstr); i++) {
 		if (strcmp(stl_brdstr[i].name, argp[0]) == 0)
 			break;
 	}
-	if (i >= nrbrdnames) {
-		printk("STALLION: unknown board name, %s?\n", argp[0]);
-		return(0);
-	}
 
 	confp->brdtype = stl_brdstr[i].type;
 
diff -urpN linux-2.6.15-rc1/drivers/char/sx.c linux-2.6.15-rc1~array_size/drivers/char/sx.c
--- linux-2.6.15-rc1/drivers/char/sx.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.15-rc1~array_size/drivers/char/sx.c	2005-11-16 08:02:40.000000000 +0100
@@ -345,9 +345,9 @@ static int si_probe_addrs[]= {0xc0000, 0
                               0xc8000, 0xd8000, 0xe8000, 0xa0000};
 static int si1_probe_addrs[]= { 0xd0000};
 
-#define NR_SX_ADDRS (sizeof(sx_probe_addrs)/sizeof (int))
-#define NR_SI_ADDRS (sizeof(si_probe_addrs)/sizeof (int))
-#define NR_SI1_ADDRS (sizeof(si1_probe_addrs)/sizeof (int))
+#define NR_SX_ADDRS ARRAY_SIZE(sx_probe_addrs)
+#define NR_SI_ADDRS ARRAY_SIZE(si_probe_addrs)
+#define NR_SI1_ADDRS ARRAY_SIZE(si1_probe_addrs)
 
 
 /* Set the mask to all-ones. This alas, only supports 32 interrupts. 
diff -urpN linux-2.6.15-rc1/drivers/char/synclink.c linux-2.6.15-rc1~array_size/drivers/char/synclink.c
--- linux-2.6.15-rc1/drivers/char/synclink.c	2005-11-15 23:31:48.000000000 +0100
+++ linux-2.6.15-rc1~array_size/drivers/char/synclink.c	2005-11-16 08:02:40.000000000 +0100
@@ -7057,7 +7057,7 @@ static BOOLEAN mgsl_register_test( struc
 {
 	static unsigned short BitPatterns[] =
 		{ 0x0000, 0xffff, 0xaaaa, 0x5555, 0x1234, 0x6969, 0x9696, 0x0f0f };
-	static unsigned int Patterncount = sizeof(BitPatterns)/sizeof(unsigned short);
+	static unsigned int Patterncount = ARRAY_SIZE(BitPatterns);
 	unsigned int i;
 	BOOLEAN rc = TRUE;
 	unsigned long flags;
@@ -7500,9 +7500,9 @@ static int mgsl_adapter_test( struct mgs
  */
 static BOOLEAN mgsl_memory_test( struct mgsl_struct *info )
 {
-	static unsigned long BitPatterns[] = { 0x0, 0x55555555, 0xaaaaaaaa,
-											0x66666666, 0x99999999, 0xffffffff, 0x12345678 };
-	unsigned long Patterncount = sizeof(BitPatterns)/sizeof(unsigned long);
+	static unsigned long BitPatterns[] =
+		{ 0x0, 0x55555555, 0xaaaaaaaa, 0x66666666, 0x99999999, 0xffffffff, 0x12345678 };
+	unsigned long Patterncount = ARRAY_SIZE(BitPatterns);
 	unsigned long i;
 	unsigned long TestLimit = SHARED_MEM_ADDRESS_SIZE/sizeof(unsigned long);
 	unsigned long * TestAddr;
diff -urpN linux-2.6.15-rc1/drivers/char/synclinkmp.c linux-2.6.15-rc1~array_size/drivers/char/synclinkmp.c
--- linux-2.6.15-rc1/drivers/char/synclinkmp.c	2005-11-15 23:31:48.000000000 +0100
+++ linux-2.6.15-rc1~array_size/drivers/char/synclinkmp.c	2005-11-17 08:49:16.000000000 +0100
@@ -5104,7 +5104,7 @@ void tx_load_dma_buffer(SLMP_INFO *info,
 int register_test(SLMP_INFO *info)
 {
 	static unsigned char testval[] = {0x00, 0xff, 0xaa, 0x55, 0x69, 0x96};
-	static unsigned int count = sizeof(testval)/sizeof(unsigned char);
+	static unsigned int count = ARRAY_SIZE(testval);
 	unsigned int i;
 	int rc = TRUE;
 	unsigned long flags;
@@ -5422,7 +5422,7 @@ int memory_test(SLMP_INFO *info)
 {
 	static unsigned long testval[] = { 0x0, 0x55555555, 0xaaaaaaaa,
 		0x66666666, 0x99999999, 0xffffffff, 0x12345678 };
-	unsigned long count = sizeof(testval)/sizeof(unsigned long);
+	unsigned long count = ARRAY_SIZE(testval);
 	unsigned long i;
 	unsigned long limit = SCA_MEM_SIZE/sizeof(unsigned long);
 	unsigned long * addr = (unsigned long *)info->memory_base;
diff -urpN linux-2.6.15-rc1/drivers/char/vme_scc.c linux-2.6.15-rc1~array_size/drivers/char/vme_scc.c
--- linux-2.6.15-rc1/drivers/char/vme_scc.c	2005-08-29 01:41:01.000000000 +0200
+++ linux-2.6.15-rc1~array_size/drivers/char/vme_scc.c	2005-11-16 08:02:40.000000000 +0100
@@ -875,13 +875,13 @@ static int scc_open (struct tty_struct *
 		local_irq_save(flags);
 #if defined(CONFIG_MVME147_SCC) || defined(CONFIG_MVME162_SCC)
 		if (MACH_IS_MVME147 || MACH_IS_MVME16x) {
-			for (i=0; i<sizeof(mvme_init_tab)/sizeof(*mvme_init_tab); ++i)
+			for (i = 0; i < ARRAY_SIZE(mvme_init_tab); ++i)
 				SCCwrite(mvme_init_tab[i].reg, mvme_init_tab[i].val);
 		}
 #endif
 #if defined(CONFIG_BVME6000_SCC)
 		if (MACH_IS_BVME6000) {
-			for (i=0; i<sizeof(bvme_init_tab)/sizeof(*bvme_init_tab); ++i)
+			for (i = 0; i < ARRAY_SIZE(bvme_init_tab); ++i)
 				SCCwrite(bvme_init_tab[i].reg, bvme_init_tab[i].val);
 		}
 #endif
diff -urpN linux-2.6.15-rc1/drivers/char/vr41xx_rtc.c linux-2.6.15-rc1~array_size/drivers/char/vr41xx_rtc.c
--- linux-2.6.15-rc1/drivers/char/vr41xx_rtc.c	2005-11-15 23:31:48.000000000 +0100
+++ linux-2.6.15-rc1~array_size/drivers/char/vr41xx_rtc.c	2005-11-16 08:02:40.000000000 +0100
@@ -127,7 +127,7 @@ struct resource rtc_resource[2] = {
 		.flags	= IORESOURCE_MEM,	},
 };
 
-#define RTC_NUM_RESOURCES	sizeof(rtc_resource) / sizeof(struct resource)
+#define RTC_NUM_RESOURCES	ARRAY_SIZE(rtc_resource)
 
 static inline unsigned long read_elapsed_second(void)
 {

--===============19359406358721643==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19359406358721643==--
