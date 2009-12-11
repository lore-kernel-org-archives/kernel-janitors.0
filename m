From: Adam Buchbinder <adam.buchbinder@gmail.com>
Date: Fri, 11 Dec 2009 21:35:34 +0000
Subject: [PATCH 02/10] Fix misspellings of "should" in comments.
Message-Id: <1260567342-8327-3-git-send-email-adam.buchbinder@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Some comments misspell "should"; this fixes them. No code changes.

Signed-off-by: Adam Buchbinder <adam.buchbinder@gmail.com>
---
 arch/x86/kernel/ptrace.c                           |    2 +-
 drivers/ata/libata-core.c                          |    2 +-
 drivers/gpu/drm/radeon/atombios.h                  |    2 +-
 drivers/ieee1394/pcilynx.c                         |    2 +-
 drivers/input/tablet/aiptek.c                      |    2 +-
 drivers/scsi/lpfc/lpfc_scsi.c                      |    4 ++--
 .../comedi/drivers/addi-data/APCI1710_Chrono.c     |    2 +-
 .../comedi/drivers/addi-data/APCI1710_Dig_io.c     |    2 +-
 .../comedi/drivers/addi-data/APCI1710_INCCPT.c     |    2 +-
 .../comedi/drivers/addi-data/APCI1710_Inp_cpt.c    |    2 +-
 .../comedi/drivers/addi-data/APCI1710_Pwm.c        |    2 +-
 .../comedi/drivers/addi-data/APCI1710_Ssi.c        |    2 +-
 .../comedi/drivers/addi-data/APCI1710_Tor.c        |    2 +-
 .../comedi/drivers/addi-data/APCI1710_Ttl.c        |    2 +-
 .../comedi/drivers/addi-data/addi_amcc_S5920.c     |    2 +-
 .../staging/comedi/drivers/addi-data/addi_common.c |    2 +-
 .../staging/comedi/drivers/addi-data/addi_eeprom.c |    2 +-
 .../comedi/drivers/addi-data/hwdrv_APCI1710.c      |    2 +-
 .../comedi/drivers/addi-data/hwdrv_apci035.c       |    2 +-
 .../comedi/drivers/addi-data/hwdrv_apci1032.c      |    2 +-
 .../comedi/drivers/addi-data/hwdrv_apci1500.c      |    2 +-
 .../comedi/drivers/addi-data/hwdrv_apci1516.c      |    2 +-
 .../comedi/drivers/addi-data/hwdrv_apci1564.c      |    2 +-
 .../comedi/drivers/addi-data/hwdrv_apci16xx.c      |    2 +-
 .../comedi/drivers/addi-data/hwdrv_apci2016.c      |    2 +-
 .../comedi/drivers/addi-data/hwdrv_apci2032.c      |    2 +-
 .../comedi/drivers/addi-data/hwdrv_apci2200.c      |    2 +-
 .../comedi/drivers/addi-data/hwdrv_apci3120.c      |    2 +-
 .../comedi/drivers/addi-data/hwdrv_apci3200.c      |    2 +-
 .../comedi/drivers/addi-data/hwdrv_apci3501.c      |    2 +-
 .../comedi/drivers/addi-data/hwdrv_apci3xxx.c      |    2 +-
 .../staging/rtl8192e/ieee80211/rtl819x_HTProc.c    |    2 +-
 drivers/staging/rtl8192e/r8192E_core.c             |    4 ++--
 .../staging/rtl8192su/ieee80211/rtl819x_HTProc.c   |    2 +-
 drivers/staging/rtl8192su/r8192U_core.c            |    2 +-
 drivers/video/sstfb.c                              |    2 +-
 fs/locks.c                                         |    2 +-
 include/linux/input-polldev.h                      |    2 +-
 kernel/audit.c                                     |    2 +-
 mm/slub.c                                          |    2 +-
 40 files changed, 42 insertions(+), 42 deletions(-)

diff --git a/arch/x86/kernel/ptrace.c b/arch/x86/kernel/ptrace.c
index 04d182a..071ec1f 100644
--- a/arch/x86/kernel/ptrace.c
+++ b/arch/x86/kernel/ptrace.c
@@ -602,7 +602,7 @@ ptrace_modify_breakpoint(struct perf_event *bp, int len, int type,
 	DEFINE_BREAKPOINT_ATTR(attr);
 
 	/*
-	 * We shoud have at least an inactive breakpoint at this
+	 * We should have at least an inactive breakpoint at this
 	 * slot. It means the user is writing dr7 without having
 	 * written the address register first
 	 */
diff --git a/drivers/ata/libata-core.c b/drivers/ata/libata-core.c
index dc72690..ba1805a 100644
--- a/drivers/ata/libata-core.c
+++ b/drivers/ata/libata-core.c
@@ -2232,7 +2232,7 @@ retry:
 		 * Some drives were very specific about that exact sequence.
 		 *
 		 * Note that ATA4 says lba is mandatory so the second check
-		 * shoud never trigger.
+		 * should never trigger.
 		 */
 		if (ata_id_major_version(id) < 4 || !ata_id_has_lba(id)) {
 			err_mask = ata_dev_init_params(dev, id[3], id[6]);
diff --git a/drivers/gpu/drm/radeon/atombios.h b/drivers/gpu/drm/radeon/atombios.h
index c11dddd..fb413d3 100644
--- a/drivers/gpu/drm/radeon/atombios.h
+++ b/drivers/gpu/drm/radeon/atombios.h
@@ -2275,7 +2275,7 @@ typedef struct _ATOM_LCD_RTS_RECORD {
 	UCHAR ucRTSValue;
 } ATOM_LCD_RTS_RECORD;
 
-/* !! If the record below exits, it shoud always be the first record for easy use in command table!!! */
+/* !! If the record below exits, it should always be the first record for easy use in command table!!! */
 typedef struct _ATOM_LCD_MODE_CONTROL_CAP {
 	UCHAR ucRecordType;
 	USHORT usLCDCap;
diff --git a/drivers/ieee1394/pcilynx.c b/drivers/ieee1394/pcilynx.c
index 9555fd2..bf47fee 100644
--- a/drivers/ieee1394/pcilynx.c
+++ b/drivers/ieee1394/pcilynx.c
@@ -1452,7 +1452,7 @@ static int __devinit add_card(struct pci_dev *dev,
                                 PRINT(KERN_ERR, lynx->id, "unable to read bus info block from i2c");
                         } else {
                                 PRINT(KERN_INFO, lynx->id, "got bus info block from serial eeprom");
-				/* FIXME: probably we shoud rewrite the max_rec, max_ROM(1394a),
+				/* FIXME: probably we should rewrite the max_rec, max_ROM(1394a),
 				 * generation(1394a) and link_spd(1394a) field and recalculate
 				 * the CRC */
 
diff --git a/drivers/input/tablet/aiptek.c b/drivers/input/tablet/aiptek.c
index 7d005a3..4be039d 100644
--- a/drivers/input/tablet/aiptek.c
+++ b/drivers/input/tablet/aiptek.c
@@ -362,7 +362,7 @@ static const int macroKeyEvents[] = {
 };
 
 /***********************************************************************
- * Map values to strings and back. Every map shoudl have the following
+ * Map values to strings and back. Every map should have the following
  * as its last element: { NULL, AIPTEK_INVALID_VALUE }.
  */
 #define AIPTEK_INVALID_VALUE	-1
diff --git a/drivers/scsi/lpfc/lpfc_scsi.c b/drivers/scsi/lpfc/lpfc_scsi.c
index c88f59f..c4f5707 100644
--- a/drivers/scsi/lpfc/lpfc_scsi.c
+++ b/drivers/scsi/lpfc/lpfc_scsi.c
@@ -1558,7 +1558,7 @@ lpfc_bg_scsi_prep_dma_buf(struct lpfc_hba *phba,
 		case LPFC_PG_TYPE_NO_DIF:
 			num_bde = lpfc_bg_setup_bpl(phba, scsi_cmnd, bpl,
 					datasegcnt);
-			/* we shoud have 2 or more entries in buffer list */
+			/* we should have 2 or more entries in buffer list */
 			if (num_bde < 2)
 				goto err;
 			break;
@@ -1594,7 +1594,7 @@ lpfc_bg_scsi_prep_dma_buf(struct lpfc_hba *phba,
 
 			num_bde = lpfc_bg_setup_bpl_prot(phba, scsi_cmnd, bpl,
 					datasegcnt, protsegcnt);
-			/* we shoud have 3 or more entries in buffer list */
+			/* we should have 3 or more entries in buffer list */
 			if (num_bde < 3)
 				goto err;
 			break;
diff --git a/drivers/staging/comedi/drivers/addi-data/APCI1710_Chrono.c b/drivers/staging/comedi/drivers/addi-data/APCI1710_Chrono.c
index ccb109a..3e690c7 100644
--- a/drivers/staging/comedi/drivers/addi-data/APCI1710_Chrono.c
+++ b/drivers/staging/comedi/drivers/addi-data/APCI1710_Chrono.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/APCI1710_Dig_io.c b/drivers/staging/comedi/drivers/addi-data/APCI1710_Dig_io.c
index f3e47e5..a6898e4 100644
--- a/drivers/staging/comedi/drivers/addi-data/APCI1710_Dig_io.c
+++ b/drivers/staging/comedi/drivers/addi-data/APCI1710_Dig_io.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/APCI1710_INCCPT.c b/drivers/staging/comedi/drivers/addi-data/APCI1710_INCCPT.c
index 6c092ef..943de93 100644
--- a/drivers/staging/comedi/drivers/addi-data/APCI1710_INCCPT.c
+++ b/drivers/staging/comedi/drivers/addi-data/APCI1710_INCCPT.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/APCI1710_Inp_cpt.c b/drivers/staging/comedi/drivers/addi-data/APCI1710_Inp_cpt.c
index 0fc2285..204d798 100644
--- a/drivers/staging/comedi/drivers/addi-data/APCI1710_Inp_cpt.c
+++ b/drivers/staging/comedi/drivers/addi-data/APCI1710_Inp_cpt.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/APCI1710_Pwm.c b/drivers/staging/comedi/drivers/addi-data/APCI1710_Pwm.c
index 138a84f..148ce6f 100644
--- a/drivers/staging/comedi/drivers/addi-data/APCI1710_Pwm.c
+++ b/drivers/staging/comedi/drivers/addi-data/APCI1710_Pwm.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/APCI1710_Ssi.c b/drivers/staging/comedi/drivers/addi-data/APCI1710_Ssi.c
index a445dab..6360de5 100644
--- a/drivers/staging/comedi/drivers/addi-data/APCI1710_Ssi.c
+++ b/drivers/staging/comedi/drivers/addi-data/APCI1710_Ssi.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/APCI1710_Tor.c b/drivers/staging/comedi/drivers/addi-data/APCI1710_Tor.c
index 43198aa..5393bb1 100644
--- a/drivers/staging/comedi/drivers/addi-data/APCI1710_Tor.c
+++ b/drivers/staging/comedi/drivers/addi-data/APCI1710_Tor.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/APCI1710_Ttl.c b/drivers/staging/comedi/drivers/addi-data/APCI1710_Ttl.c
index d3d78d3..de6f772 100644
--- a/drivers/staging/comedi/drivers/addi-data/APCI1710_Ttl.c
+++ b/drivers/staging/comedi/drivers/addi-data/APCI1710_Ttl.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/addi_amcc_S5920.c b/drivers/staging/comedi/drivers/addi-data/addi_amcc_S5920.c
index 6e9e7ed..bd7e461 100644
--- a/drivers/staging/comedi/drivers/addi-data/addi_amcc_S5920.c
+++ b/drivers/staging/comedi/drivers/addi-data/addi_amcc_S5920.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/addi_common.c b/drivers/staging/comedi/drivers/addi-data/addi_common.c
index a56535f..8db5ab6 100644
--- a/drivers/staging/comedi/drivers/addi-data/addi_common.c
+++ b/drivers/staging/comedi/drivers/addi-data/addi_common.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/addi_eeprom.c b/drivers/staging/comedi/drivers/addi-data/addi_eeprom.c
index 69b4273..bea329f 100644
--- a/drivers/staging/comedi/drivers/addi-data/addi_eeprom.c
+++ b/drivers/staging/comedi/drivers/addi-data/addi_eeprom.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_APCI1710.c b/drivers/staging/comedi/drivers/addi-data/hwdrv_APCI1710.c
index 47517a9..d7d768e 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_APCI1710.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_APCI1710.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci035.c b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci035.c
index 016721e..7912972 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci035.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci035.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1032.c b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1032.c
index e9021cd..16ae198 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1032.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1032.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1500.c b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1500.c
index 236b8a3..c03db2c 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1500.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1500.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1516.c b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1516.c
index 3841635..2ed6d93 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1516.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1516.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1564.c b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1564.c
index 3a47c30..bc3c902 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1564.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci1564.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci16xx.c b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci16xx.c
index 988e3fc..8bc88ad 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci16xx.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci16xx.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci2016.c b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci2016.c
index 457917f..4a15afc 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci2016.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci2016.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci2032.c b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci2032.c
index ec81708..2d32516 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci2032.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci2032.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci2200.c b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci2200.c
index a853c62..f730b8f 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci2200.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci2200.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3120.c b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3120.c
index 169cee4..423b43e 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3120.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3120.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3200.c b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3200.c
index 010697f..a900040 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3200.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3200.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3501.c b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3501.c
index ef21f03..cf58d9c 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3501.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3501.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3xxx.c b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3xxx.c
index 3387278..2877cb2 100644
--- a/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3xxx.c
+++ b/drivers/staging/comedi/drivers/addi-data/hwdrv_apci3xxx.c
@@ -17,7 +17,7 @@ This program is distributed in the hope that it will be useful, but WITHOUT ANY
 
 You should have received a copy of the GNU General Public License along with this program; if not, write to the Free Software Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 
-You shoud also find the complete GPL in the COPYING file accompanying this source code.
+You should also find the complete GPL in the COPYING file accompanying this source code.
 
 @endverbatim
 */
diff --git a/drivers/staging/rtl8192e/ieee80211/rtl819x_HTProc.c b/drivers/staging/rtl8192e/ieee80211/rtl819x_HTProc.c
index 1e39214..544a04f 100644
--- a/drivers/staging/rtl8192e/ieee80211/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/ieee80211/rtl819x_HTProc.c
@@ -41,7 +41,7 @@ static u8 AIRLINK_RALINK[3] = {0x00, 0x18, 0x02};
 static u8 DLINK_ATHEROS[3] = {0x00, 0x1c, 0xf0};
 static u8 CISCO_BROADCOM[3] = {0x00, 0x17, 0x94};
 
-// 2008/04/01 MH For Cisco G mode RX TP We need to change FW duration. Shoud we put the
+// 2008/04/01 MH For Cisco G mode RX TP We need to change FW duration. Should we put the
 // code in other place??
 //static u8 WIFI_CISCO_G_AP[3] = {0x00, 0x40, 0x96};
 /********************************************************************************************************************
diff --git a/drivers/staging/rtl8192e/r8192E_core.c b/drivers/staging/rtl8192e/r8192E_core.c
index b0802a7..65f9c50 100644
--- a/drivers/staging/rtl8192e/r8192E_core.c
+++ b/drivers/staging/rtl8192e/r8192E_core.c
@@ -2080,7 +2080,7 @@ static void rtl8192_SetWirelessMode(struct net_device* dev, u8 wireless_mode)
 			wireless_mode = WIRELESS_MODE_B;
 		}
 	}
-#ifdef TO_DO_LIST //// TODO: this function doesn't work well at this time, we shoud wait for FPGA
+#ifdef TO_DO_LIST //// TODO: this function doesn't work well at this time, we should wait for FPGA
 	ActUpdateChannelAccessSetting( pAdapter, pHalData->CurrentWirelessMode, &pAdapter->MgntInfo.Info8185.ChannelAccessSetting );
 #endif
 	priv->ieee80211->mode = wireless_mode;
@@ -6036,7 +6036,7 @@ void rtl8192_cancel_deferred_work(struct r8192_priv* priv)
 	/* call cancel_work_sync instead of cancel_delayed_work if and only if Linux_version_code
          * is  or is newer than 2.6.20 and work structure is defined to be struct work_struct.
          * Otherwise call cancel_delayed_work is enough.
-         * FIXME (2.6.20 shoud 2.6.22, work_struct shoud not cancel)
+         * FIXME (2.6.20 should 2.6.22, work_struct should not cancel)
          * */
 	cancel_delayed_work(&priv->watch_dog_wq);
 	cancel_delayed_work(&priv->update_beacon_wq);
diff --git a/drivers/staging/rtl8192su/ieee80211/rtl819x_HTProc.c b/drivers/staging/rtl8192su/ieee80211/rtl819x_HTProc.c
index 33c7fa7..01114c5 100644
--- a/drivers/staging/rtl8192su/ieee80211/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192su/ieee80211/rtl819x_HTProc.c
@@ -42,7 +42,7 @@ static u8 DLINK_ATHEROS_1[3] = {0x00, 0x1c, 0xf0};
 static u8 DLINK_ATHEROS_2[3] = {0x00, 0x21, 0x91};
 static u8 CISCO_BROADCOM[3] = {0x00, 0x17, 0x94};
 static u8 LINKSYS_MARVELL_4400N[3] = {0x00, 0x14, 0xa4};
-// 2008/04/01 MH For Cisco G mode RX TP We need to change FW duration. Shoud we put the
+// 2008/04/01 MH For Cisco G mode RX TP We need to change FW duration. Should we put the
 // code in other place??
 //static u8 WIFI_CISCO_G_AP[3] = {0x00, 0x40, 0x96};
 /********************************************************************************************************************
diff --git a/drivers/staging/rtl8192su/r8192U_core.c b/drivers/staging/rtl8192su/r8192U_core.c
index 66274d7..28403bf 100644
--- a/drivers/staging/rtl8192su/r8192U_core.c
+++ b/drivers/staging/rtl8192su/r8192U_core.c
@@ -2950,7 +2950,7 @@ void rtl8192_SetWirelessMode(struct net_device* dev, u8 wireless_mode)
 			wireless_mode = WIRELESS_MODE_B;
 		}
 	}
-#ifdef TO_DO_LIST //// TODO: this function doesn't work well at this time, we shoud wait for FPGA
+#ifdef TO_DO_LIST //// TODO: this function doesn't work well at this time, we should wait for FPGA
 	ActUpdateChannelAccessSetting( pAdapter, pHalData->CurrentWirelessMode, &pAdapter->MgntInfo.Info8185.ChannelAccessSetting );
 #endif
 	//LZM 090306 usb crash here, mark it temp
diff --git a/drivers/video/sstfb.c b/drivers/video/sstfb.c
index 609d0a5..79840f1 100644
--- a/drivers/video/sstfb.c
+++ b/drivers/video/sstfb.c
@@ -1102,7 +1102,7 @@ static void sst_set_vidmod_ics(struct fb_info *info, const int bpp)
  * detect dac type
  * prerequisite : write to FbiInitx enabled, video and fbi and pci fifo reset,
  * dram refresh disabled, FbiInit remaped.
- * TODO: mmh.. maybe i shoud put the "prerequisite" in the func ...
+ * TODO: mmh.. maybe i should put the "prerequisite" in the func ...
  */
 
 
diff --git a/fs/locks.c b/fs/locks.c
index a8794f2..cde572d 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -1454,7 +1454,7 @@ EXPORT_SYMBOL(generic_setlease);
  *	leases held by processes on this node.
  *
  *	There is also no break_lease method; filesystems that
- *	handle their own leases shoud break leases themselves from the
+ *	handle their own leases should break leases themselves from the
  *	filesystem's open, create, and (on truncate) setattr methods.
  *
  *	Warning: the only current setlease methods exist only to disable
diff --git a/include/linux/input-polldev.h b/include/linux/input-polldev.h
index 597a007..df28763 100644
--- a/include/linux/input-polldev.h
+++ b/include/linux/input-polldev.h
@@ -19,7 +19,7 @@
  *	opening (optional)
  * @poll: driver-supplied method that polls the device and posts
  *	input events (mandatory).
- * @poll_interval: specifies how often the poll() method shoudl be called.
+ * @poll_interval: specifies how often the poll() method should be called.
  * @input: input device structire associated with the polled device.
  *	Must be properly initialized by the driver (id, name, phys, bits).
  *
diff --git a/kernel/audit.c b/kernel/audit.c
index 5feed23..78f7f86 100644
--- a/kernel/audit.c
+++ b/kernel/audit.c
@@ -398,7 +398,7 @@ static void kauditd_send_skb(struct sk_buff *skb)
 	skb_get(skb);
 	err = netlink_unicast(audit_sock, skb, audit_nlk_pid, 0);
 	if (err < 0) {
-		BUG_ON(err != -ECONNREFUSED); /* Shoudn't happen */
+		BUG_ON(err != -ECONNREFUSED); /* Shouldn't happen */
 		printk(KERN_ERR "audit: *NO* daemon at audit_pid=%d\n", audit_pid);
 		audit_log_lost("auditd dissapeared\n");
 		audit_pid = 0;
diff --git a/mm/slub.c b/mm/slub.c
index 4996fc7..c3d7c77 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -3086,7 +3086,7 @@ static void slab_mem_offline_callback(void *arg)
 			/*
 			 * if n->nr_slabs > 0, slabs still exist on the node
 			 * that is going down. We were unable to free them,
-			 * and offline_pages() function shoudn't call this
+			 * and offline_pages() function shouldn't call this
 			 * callback. So, we must fail.
 			 */
 			BUG_ON(slabs_node(s, offline_node));
-- 
1.6.3.3

