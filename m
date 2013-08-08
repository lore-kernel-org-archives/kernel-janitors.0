From: Shaun Laing <shaun@XResource.ca>
Date: Thu, 08 Aug 2013 23:32:27 +0000
Subject: Thoughts on removing this declaration
Message-Id: <201308082332.r78NWRBq272176@rivendell.pollux.laing>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello -- what are your thoughts on this patch?  SBE_INCLUDE_SYMBOLS came out
easily... too easily really.  Was it there on purpose?


Removed the unused SBE_INCLUDE_SYMBOLS #define, and the associated STATIC
#define, and replaced all occurances of STATIC with 'static'.  This was in
response to sparse warnings of the form "symbol 'XYZ' was not declared. Should
it be static?". 

Also had to add #ifdef around a function prototype as the 'static' declaration
produced a new gcc warning, as the actual function was not defined.

Signed-off-by: Shaun Laing <shaun@xresource.ca>

---
diff --git a/drivers/staging/cxt1e1/Makefile b/drivers/staging/cxt1e1/Makefile
index b9ccb76..2f217e9 100644
--- a/drivers/staging/cxt1e1/Makefile
+++ b/drivers/staging/cxt1e1/Makefile
@@ -2,7 +2,6 @@ obj-$(CONFIG_CXT1E1)	+= cxt1e1.o
 
 ccflags-y := -DSBE_PMCC4_ENABLE
 ccflags-y += -DSBE_ISR_TASKLET
-ccflags-y += -DSBE_INCLUDE_SYMBOLS
 
 cxt1e1-y := 	\
   ossiRelease.o 	\
diff --git a/drivers/staging/cxt1e1/comet.c b/drivers/staging/cxt1e1/comet.c
index fabfd77..d71aea5 100644
--- a/drivers/staging/cxt1e1/comet.c
+++ b/drivers/staging/cxt1e1/comet.c
@@ -22,22 +22,15 @@
 #include "comet.h"
 #include "comet_tables.h"
 
-#ifdef SBE_INCLUDE_SYMBOLS
-#define STATIC
-#else
-#define STATIC  static
-#endif
-
-
 extern int  cxt1e1_log_level;
 
 #define COMET_NUM_SAMPLES   24  /* Number of entries in the waveform table */
 #define COMET_NUM_UNITS     5   /* Number of points per entry in table */
 
 /* forward references */
-STATIC void SetPwrLevel(comet_t *comet);
-STATIC void WrtRcvEqualizerTbl(ci_t *ci, comet_t *comet, u_int32_t *table);
-STATIC void WrtXmtWaveformTbl(ci_t *ci, comet_t *comet, u_int8_t table[COMET_NUM_SAMPLES][COMET_NUM_UNITS]);
+static void SetPwrLevel(comet_t *comet);
+static void WrtRcvEqualizerTbl(ci_t *ci, comet_t *comet, u_int32_t *table);
+static void WrtXmtWaveformTbl(ci_t *ci, comet_t *comet, u_int8_t table[COMET_NUM_SAMPLES][COMET_NUM_UNITS]);
 
 
 void       *TWV_table[12] = {
@@ -407,7 +400,7 @@ void init_comet(void *ci, comet_t *comet, u_int32_t port_mode, int clockmaster,
 **                Write the data to the Pulse Waveform Storage Data register.
 ** Returns:     Nothing
 */
-STATIC void
+static void
 WrtXmtWaveform(ci_t *ci, comet_t *comet, u_int32_t sample, u_int32_t unit, u_int8_t data)
 {
 	u_int8_t    WaveformAddr;
@@ -425,7 +418,7 @@ WrtXmtWaveform(ci_t *ci, comet_t *comet, u_int32_t sample, u_int32_t unit, u_int
 **                for driving the transmitter DAC.
 ** Returns:     Nothing
 */
-STATIC void
+static void
 WrtXmtWaveformTbl(ci_t *ci, comet_t *comet,
 		  u_int8_t table[COMET_NUM_SAMPLES][COMET_NUM_UNITS])
 {
@@ -452,7 +445,7 @@ WrtXmtWaveformTbl(ci_t *ci, comet_t *comet,
 **           is coded with early setup of indirect address.
 */
 
-STATIC void
+static void
 WrtRcvEqualizerTbl(ci_t *ci, comet_t *comet, u_int32_t *table)
 {
 	u_int32_t   ramaddr;
@@ -516,7 +509,7 @@ WrtRcvEqualizerTbl(ci_t *ci, comet_t *comet, u_int32_t *table)
 ** Returns:     Nothing
 */
 
-STATIC void
+static void
 SetPwrLevel(comet_t *comet)
 {
 	volatile u_int32_t temp;
@@ -558,7 +551,7 @@ SetPwrLevel(comet_t *comet)
 ** Returns:     Nothing
 */
 #if 0
-STATIC void
+static void
 SetCometOps(comet_t *comet)
 {
 	volatile u_int8_t rd_value;
diff --git a/drivers/staging/cxt1e1/functions.c b/drivers/staging/cxt1e1/functions.c
index 6167dc5..d021b31 100644
--- a/drivers/staging/cxt1e1/functions.c
+++ b/drivers/staging/cxt1e1/functions.c
@@ -24,13 +24,6 @@
 #include "libsbew.h"
 #include "pmcc4.h"
 
-
-#ifdef SBE_INCLUDE_SYMBOLS
-#define STATIC
-#else
-#define STATIC  static
-#endif
-
 #if defined(CONFIG_SBE_HDLC_V7) || defined(CONFIG_SBE_WAN256T3_HDLC_V7) || \
     defined(CONFIG_SBE_HDLC_V7_MODULE) || defined(CONFIG_SBE_WAN256T3_HDLC_V7_MODULE)
 #define _v7_hdlc_  1
@@ -111,7 +104,7 @@ pci_flush_write (ci_t *ci)
 }
 
 
-STATIC void
+static void
 watchdog_func (unsigned long arg)
 {
     struct watchdog *wd = (void *) arg;
diff --git a/drivers/staging/cxt1e1/hwprobe.c b/drivers/staging/cxt1e1/hwprobe.c
index 110c252..53e9237 100644
--- a/drivers/staging/cxt1e1/hwprobe.c
+++ b/drivers/staging/cxt1e1/hwprobe.c
@@ -31,12 +31,6 @@
 #include "sbeproc.h"
 #endif
 
-#ifdef SBE_INCLUDE_SYMBOLS
-#define STATIC
-#else
-#define STATIC  static
-#endif
-
 extern int  cxt1e1_log_level;
 extern int  error_flag;
 extern int  drvr_state;
@@ -221,7 +215,7 @@ cleanup_devs (void)
 }
 
 
-STATIC int  __init
+static int  __init
 c4_hdw_init (struct pci_dev *pdev, int found)
 {
     hdw_info_t *hi;
diff --git a/drivers/staging/cxt1e1/linux.c b/drivers/staging/cxt1e1/linux.c
index e5889ef..142691c 100644
--- a/drivers/staging/cxt1e1/linux.c
+++ b/drivers/staging/cxt1e1/linux.c
@@ -52,12 +52,6 @@
 
 /*****************************************************************************************/
 
-#ifdef SBE_INCLUDE_SYMBOLS
-#define STATIC
-#else
-#define STATIC  static
-#endif
-
 #define CHANNAME "hdlc"
 
 /*******************************************************************/
@@ -285,7 +279,7 @@ void_open (struct net_device *ndev)
 }
 
 
-STATIC int
+static int
 chan_open (struct net_device *ndev)
 {
     hdlc_device *hdlc = dev_to_hdlc (ndev);
@@ -305,7 +299,7 @@ chan_open (struct net_device *ndev)
 }
 
 
-STATIC int
+static int
 chan_close (struct net_device *ndev)
 {
     hdlc_device *hdlc = dev_to_hdlc (ndev);
@@ -319,14 +313,14 @@ chan_close (struct net_device *ndev)
 }
 
 
-STATIC int
+static int
 chan_dev_ioctl (struct net_device *dev, struct ifreq *ifr, int cmd)
 {
     return hdlc_ioctl (dev, ifr, cmd);
 }
 
 
-STATIC int
+static int
 chan_attach_noop (struct net_device *ndev, unsigned short foo_1, unsigned short foo_2)
 {
     return 0;                   /* our driver has nothing to do here, show's
@@ -334,7 +328,7 @@ chan_attach_noop (struct net_device *ndev, unsigned short foo_1, unsigned short
 }
 
 
-STATIC struct net_device_stats *
+static struct net_device_stats *
 chan_get_stats (struct net_device *ndev)
 {
     mch_t      *ch;
@@ -394,7 +388,7 @@ get_ci_by_dev (struct net_device *ndev)
 }
 
 
-STATIC int
+static int
 c4_linux_xmit (struct sk_buff *skb, struct net_device *ndev)
 {
     const struct c4_priv *priv;
@@ -416,7 +410,7 @@ static const struct net_device_ops chan_ops = {
        .ndo_get_stats  = chan_get_stats,
 };
 
-STATIC struct net_device *
+static struct net_device *
 create_chan (struct net_device *ndev, ci_t *ci,
              struct sbecom_chan_param *cp)
 {
@@ -509,7 +503,7 @@ create_chan (struct net_device *ndev, ci_t *ci,
 
 
 /* the idea here is to get port information and pass it back (using pointer) */
-STATIC      status_t
+static      status_t
 do_get_port (struct net_device *ndev, void *data)
 {
     int         ret;
@@ -534,7 +528,7 @@ do_get_port (struct net_device *ndev, void *data)
 }
 
 /* this function copys the user data and then calls the real action function */
-STATIC      status_t
+static      status_t
 do_set_port (struct net_device *ndev, void *data)
 {
     ci_t       *ci;             /* ci stands for card information */
@@ -556,7 +550,7 @@ do_set_port (struct net_device *ndev, void *data)
 }
 
 /* work the port loopback mode as per directed */
-STATIC      status_t
+static      status_t
 do_port_loop (struct net_device *ndev, void *data)
 {
     struct sbecom_port_param pp;
@@ -571,7 +565,7 @@ do_port_loop (struct net_device *ndev, void *data)
 }
 
 /* set the specified register with the given value / or just read it */
-STATIC      status_t
+static      status_t
 do_framer_rw (struct net_device *ndev, void *data)
 {
     struct sbecom_port_param pp;
@@ -592,7 +586,7 @@ do_framer_rw (struct net_device *ndev, void *data)
 }
 
 /* set the specified register with the given value / or just read it */
-STATIC      status_t
+static      status_t
 do_pld_rw (struct net_device *ndev, void *data)
 {
     struct sbecom_port_param pp;
@@ -613,7 +607,7 @@ do_pld_rw (struct net_device *ndev, void *data)
 }
 
 /* set the specified register with the given value / or just read it */
-STATIC      status_t
+static      status_t
 do_musycc_rw (struct net_device *ndev, void *data)
 {
     struct c4_musycc_param mp;
@@ -633,7 +627,7 @@ do_musycc_rw (struct net_device *ndev, void *data)
     return 0;
 }
 
-STATIC      status_t
+static      status_t
 do_get_chan (struct net_device *ndev, void *data)
 {
     struct sbecom_chan_param cp;
@@ -651,7 +645,7 @@ do_get_chan (struct net_device *ndev, void *data)
     return 0;
 }
 
-STATIC      status_t
+static      status_t
 do_set_chan (struct net_device *ndev, void *data)
 {
     struct sbecom_chan_param cp;
@@ -672,7 +666,7 @@ do_set_chan (struct net_device *ndev, void *data)
     }
 }
 
-STATIC      status_t
+static      status_t
 do_create_chan (struct net_device *ndev, void *data)
 {
     ci_t       *ci;
@@ -699,7 +693,7 @@ do_create_chan (struct net_device *ndev, void *data)
     return ret;
 }
 
-STATIC      status_t
+static      status_t
 do_get_chan_stats (struct net_device *ndev, void *data)
 {
     struct c4_chan_stats_wrap ccs;
@@ -720,7 +714,7 @@ do_get_chan_stats (struct net_device *ndev, void *data)
         return -EFAULT;
     return 0;
 }
-STATIC      status_t
+static      status_t
 do_set_loglevel (struct net_device *ndev, void *data)
 {
     unsigned int cxt1e1_log_level;
@@ -731,7 +725,7 @@ do_set_loglevel (struct net_device *ndev, void *data)
     return 0;
 }
 
-STATIC      status_t
+static      status_t
 do_deluser (struct net_device *ndev, int lockit)
 {
     if (ndev->flags & IFF_UP)
@@ -826,7 +820,7 @@ do_reset_chan_stats (struct net_device *musycc_dev, void *data)
     return mkret (c4_del_chan_stats (cp.channum));
 }
 
-STATIC      status_t
+static      status_t
 c4_ioctl (struct net_device *ndev, struct ifreq *ifr, int cmd)
 {
     ci_t       *ci;
@@ -1102,7 +1096,7 @@ c4_add_dev (hdw_info_t *hi, int brdno, unsigned long f0, unsigned long f1,
     return ndev;
 }
 
-STATIC int  __init
+static int  __init
 c4_mod_init (void)
 {
     int         rtn;
@@ -1144,7 +1138,7 @@ c4_mod_init (void)
   * do_deluser()
   */
 
-STATIC void __exit
+static void __exit
 cleanup_hdlc (void)
 {
     hdw_info_t *hi;
@@ -1168,7 +1162,7 @@ cleanup_hdlc (void)
 }
 
 
-STATIC void __exit
+static void __exit
 c4_mod_remove (void)
 {
 	cleanup_hdlc();            /* delete any missed channels */
diff --git a/drivers/staging/cxt1e1/musycc.c b/drivers/staging/cxt1e1/musycc.c
index 1037086..7790f89 100644
--- a/drivers/staging/cxt1e1/musycc.c
+++ b/drivers/staging/cxt1e1/musycc.c
@@ -35,12 +35,6 @@ unsigned int max_bh = 0;
 #include "pmcc4.h"
 #include "musycc.h"
 
-#ifdef SBE_INCLUDE_SYMBOLS
-#define STATIC
-#else
-#define STATIC  static
-#endif
-
 #define sd_find_chan(ci,ch)   c4_find_chan(ch)
 
 
@@ -65,7 +59,9 @@ void        c4_wk_chan_restart(mch_t *);
 void        musycc_bh_tx_eom(mpi_t *, int);
 int         musycc_chan_up(ci_t *, int);
 status_t __init musycc_init(ci_t *);
-STATIC void __init musycc_init_port(mpi_t *);
+#ifdef SBE_WAN256T3_ENABLE
+static void __init musycc_init_port(mpi_t *);
+#endif
 void        musycc_intr_bh_tasklet(ci_t *);
 void        musycc_serv_req(mpi_t *, u_int32_t);
 void        musycc_update_timeslots(mpi_t *);
@@ -73,7 +69,7 @@ void        musycc_update_timeslots(mpi_t *);
 /*******************************************************************/
 
 #if 1
-STATIC int
+static int
 musycc_dump_rxbuffer_ring(mch_t *ch, int lockit)
 {
     struct mdesc *m;
@@ -139,7 +135,7 @@ musycc_dump_rxbuffer_ring(mch_t *ch, int lockit)
 #endif
 
 #if 1
-STATIC int
+static int
 musycc_dump_txbuffer_ring(mch_t *ch, int lockit)
 {
     struct mdesc *m;
@@ -702,7 +698,7 @@ musycc_chan_proto(int proto)
 }
 
 #ifdef SBE_WAN256T3_ENABLE
-STATIC void __init
+static void __init
 musycc_init_port(mpi_t *pi)
 {
     pci_write_32((u_int32_t *) &pi->reg->gbp, OS_vtophys(pi->regram));
@@ -1009,7 +1005,7 @@ musycc_bh_tx_eom(mpi_t *pi, int gchan)
 }
 
 
-STATIC void
+static void
 musycc_bh_rx_eom(mpi_t *pi, int gchan)
 {
     mch_t      *ch;
diff --git a/drivers/staging/cxt1e1/pmc93x6_eeprom.c b/drivers/staging/cxt1e1/pmc93x6_eeprom.c
index 62b12fb..137b63c 100644
--- a/drivers/staging/cxt1e1/pmc93x6_eeprom.c
+++ b/drivers/staging/cxt1e1/pmc93x6_eeprom.c
@@ -34,13 +34,6 @@
 #define FALSE  0
 #endif
 
-#ifdef SBE_INCLUDE_SYMBOLS
-#define STATIC
-#else
-#define STATIC  static
-#endif
-
-
 /*------------------------------------------------------------------------
  *      EEPROM address definitions
  *------------------------------------------------------------------------
@@ -120,7 +113,7 @@ short       mfg_template[sizeof (FLD_TYPE2)]   *      (the MSB becomes the LSB etc.).
  */
 
-STATIC void
+static void
 BuildByteReverse (void)
 {
     long        half;           /* Used to build by powers to 2 */
@@ -141,7 +134,7 @@ BuildByteReverse (void)
  *------------------------------------------------------------------------
  */
 
-STATIC void
+static void
 eeprom_delay (void)
 {
     int         timeout;
@@ -224,7 +217,7 @@ eeprom_get_byte (long addr)
  *      Issue the EEPROM command to disable writes.
  */
 
-STATIC void
+static void
 disable_pmc_eeprom (long addr)
 {
     eeprom_put_byte (addr, EPROM_EWDS, SIZE_ADDR_OP);
@@ -241,7 +234,7 @@ disable_pmc_eeprom (long addr)
  *      Issue the EEPROM command to enable writes.
  */
 
-STATIC void
+static void
 enable_pmc_eeprom (long addr)
 {
     eeprom_put_byte (addr, EPROM_EWEN, SIZE_ADDR_OP);
diff --git a/drivers/staging/cxt1e1/pmcc4_drv.c b/drivers/staging/cxt1e1/pmcc4_drv.c
index 32d7a21..2383c60 100644
--- a/drivers/staging/cxt1e1/pmcc4_drv.c
+++ b/drivers/staging/cxt1e1/pmcc4_drv.c
@@ -39,13 +39,6 @@
 #include "comet.h"
 #include "sbe_bid.h"
 
-#ifdef SBE_INCLUDE_SYMBOLS
-#define STATIC
-#else
-#define STATIC  static
-#endif
-
-
 #define KERN_WARN KERN_WARNING
 
 /* forward references */
@@ -458,7 +451,7 @@ checkPorts (ci_t *ci)
 }
 
 
-STATIC void
+static void
 c4_watchdog (ci_t *ci)
 {
     if (drvr_state != SBE_DRVR_AVAILABLE)
@@ -1184,7 +1177,7 @@ c4_get_chan_stats (int channum, struct sbecom_chan_stats *p)
     return 0;
 }
 
-STATIC int
+static int
 c4_fifo_alloc (mpi_t *pi, int chan, int *len)
 {
     int         i, l = 0, start = 0, max = 0, maxstart = 0;
diff --git a/drivers/staging/cxt1e1/sbeid.c b/drivers/staging/cxt1e1/sbeid.c
index 0f9bd5f..791993f 100644
--- a/drivers/staging/cxt1e1/sbeid.c
+++ b/drivers/staging/cxt1e1/sbeid.c
@@ -19,13 +19,6 @@
 #include "pmcc4.h"
 #include "sbe_bid.h"
 
-#ifdef SBE_INCLUDE_SYMBOLS
-#define STATIC
-#else
-#define STATIC  static
-#endif
-
-
 char       *
 sbeid_get_bdname (ci_t *ci)
 {
