From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 27 Sep 2012 17:56:00 +0000
Subject: [nouveau:master 89/96] drivers/gpu/drm/nouveau/core/subdev/therm/fan.c:190:1: sparse: symbol
Message-Id: <20120927175600.GF5517@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="vEao7xgI/oilGqZ+"
List-Id: <kernel-janitors.vger.kernel.org>
To: kernel-janitors@vger.kernel.org


--vEao7xgI/oilGqZ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

FYI, there are new sparse warnings show up in

tree:   git://git.freedesktop.org/git/nouveau/linux-2.6 master
head:   301e77f5b7968ff10eac8f3938c30963d8fc0ac3
commit: eb062d72ae89ead7bf29279ee6130c94197bf5f3 [89/96] drm/nouveau/therm: add support for fan-control modes

  drivers/gpu/drm/nouveau/core/subdev/therm/fan.c:137:29: sparse: constant 60000000000 is so big it is long long
+ drivers/gpu/drm/nouveau/core/subdev/therm/fan.c:190:1: sparse: symbol 'nouveau_therm_fan_set_defaults' was not declared. Should it be static?
+ drivers/gpu/drm/nouveau/core/subdev/therm/fan.c:214:5: sparse: symbol 'nouveau_fan_pwm_clock_dummy' was not declared. Should it be static?
--
+ drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c:163:2: sparse: no newline at end of file
+ drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c:79:1: sparse: symbol 'nv40_fan_pwm_get' was not declared. Should it be static?
+ drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c:105:1: sparse: symbol 'nv40_fan_pwm_set' was not declared. Should it be static?
--
+ drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c:54:1: sparse: symbol 'nv50_fan_pwm_get' was not declared. Should it be static?
+ drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c:70:1: sparse: symbol 'nv50_fan_pwm_set' was not declared. Should it be static?
+ drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c:83:1: sparse: symbol 'nv50_fan_pwm_clock' was not declared. Should it be static?
+ drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c:109:1: sparse: symbol 'nv50_temp_get' was not declared. Should it be static?
? drivers/gpu/drm/nouveau/core/engine/graph/fuc/hubnvc0.fuc.h:1:10: sparse: symbol 'nvc0_grhub_data' was not declared. Should it be static?
? drivers/gpu/drm/nouveau/core/engine/graph/fuc/hubnvc0.fuc.h:213:10: sparse: symbol 'nvc0_grhub_code' was not declared. Should it be static?
? drivers/gpu/drm/nouveau/core/engine/graph/fuc/gpcnvc0.fuc.h:1:10: sparse: symbol 'nvc0_grgpc_data' was not declared. Should it be static?
? drivers/gpu/drm/nouveau/core/engine/graph/fuc/gpcnvc0.fuc.h:173:10: sparse: symbol 'nvc0_grgpc_code' was not declared. Should it be static?
? drivers/gpu/drm/nouveau/core/engine/graph/fuc/hubnve0.fuc.h:1:10: sparse: symbol 'nve0_grhub_data' was not declared. Should it be static?
? drivers/gpu/drm/nouveau/core/engine/graph/fuc/hubnve0.fuc.h:210:10: sparse: symbol 'nve0_grhub_code' was not declared. Should it be static?
? drivers/gpu/drm/nouveau/core/engine/graph/fuc/gpcnve0.fuc.h:1:10: sparse: symbol 'nve0_grgpc_data' was not declared. Should it be static?
? drivers/gpu/drm/nouveau/core/engine/graph/fuc/gpcnve0.fuc.h:99:10: sparse: symbol 'nve0_grgpc_code' was not declared. Should it be static?
? drivers/gpu/drm/nouveau/nouveau_bios.c:80:30: sparse: cast to restricted __le16
? drivers/gpu/drm/nouveau/nouveau_bios.c:740:58: sparse: cast to restricted __le32
? drivers/gpu/drm/nouveau/nouveau_bios.c:2214:49: sparse: too many warnings
? drivers/gpu/drm/nouveau/nouveau_connector.c:955:29: sparse: cast to restricted __le16
? drivers/gpu/drm/nouveau/nouveau_dp.c:54:17: sparse: cast to restricted __le16
? drivers/gpu/drm/nouveau/nouveau_dp.c:73:55: sparse: cast to restricted __le32
? drivers/gpu/drm/nouveau/nvd0_display.c:1285:52: sparse: cast to restricted __le16
? drivers/gpu/drm/nouveau/nv50_sor.c:107:17: sparse: cast to restricted __le16
? drivers/gpu/drm/nouveau/nv50_evo.c:39:53: sparse: incorrect type in initializer (different address spaces)
? drivers/gpu/drm/nouveau/nv50_evo.c:63:44: sparse: incorrect type in argument 1 (different address spaces)
? drivers/gpu/drm/nouveau/nv50_evo.c:157:43: sparse: incorrect type in assignment (different address spaces)
? drivers/gpu/drm/nouveau/nouveau_volt.c:123:32: sparse: cast to restricted __le16
? drivers/gpu/drm/nouveau/nouveau_volt.c:224:31: sparse: cast to restricted __le32
? drivers/gpu/drm/nouveau/nouveau_perf.c:39:28: sparse: cast to restricted __le16
? drivers/gpu/drm/nouveau/nouveau_perf.c:175:37: sparse: cast to restricted __le32
? drivers/gpu/drm/nouveau/nv40_pm.c:335:50: sparse: cast to restricted __le16
? drivers/gpu/drm/nouveau/nv50_pm.c:835:33: sparse: cast to restricted __le16
? drivers/gpu/drm/nouveau/nva3_pm.c:431:39: sparse: cast to restricted __le16
? drivers/staging/panel/panel.c:188:1: sparse: symbol 'logical_inputs' was not declared. Should it be static?
? drivers/staging/panel/panel.c:569:6: sparse: symbol 'old_keypad_profile' was not declared. Should it be static?
? drivers/staging/panel/panel.c:580:6: sparse: symbol 'new_keypad_profile' was not declared. Should it be static?
? drivers/staging/panel/panel.c:593:6: sparse: symbol 'nexcom_keypad_profile' was not declared. Should it be static?
? drivers/staging/panel/panel.c:672:6: sparse: symbol 'pin_to_bits' was not declared. Should it be static?
? drivers/staging/panel/panel.c:1244:26: sparse: incorrect type in argument 1 (different address spaces)
? drivers/staging/panel/panel.c:1362:20: sparse: incorrect type in initializer (incompatible argument 2 (different address spaces))
? drivers/staging/panel/panel.c:1375:6: sparse: symbol 'panel_lcd_print' was not declared. Should it be static?
? drivers/staging/panel/panel.c:1382:6: sparse: symbol 'lcd_init' was not declared. Should it be static?
? drivers/staging/panel/panel.c:2181:5: sparse: symbol 'panel_init' was not declared. Should it be static?
? drivers/staging/rts5139/rts51x_transport.c:649:4: sparse: symbol 'media_not_present' was not declared. Should it be static?
? drivers/staging/rts5139/rts51x_transport.c:651:4: sparse: symbol 'invalid_cmd_field' was not declared. Should it be static?
? drivers/staging/rts5139/rts51x_scsi.c:444:15: sparse: symbol 'formatter_inquiry_str' was not declared. Should it be static?
? drivers/staging/rts5139/rts51x_scsi.c:2007:5: sparse: symbol 'queuecommand_lck' was not declared. Should it be static?
? drivers/staging/rts5139/rts51x_fop.c:96:35: sparse: incorrect type in argument 1 (different address spaces)
? drivers/staging/rts5139/rts51x.c:219:5: sparse: symbol 'rts51x_pre_reset' was not declared. Should it be static?
? drivers/staging/rts5139/rts51x.c:230:5: sparse: symbol 'rts51x_post_reset' was not declared. Should it be static?
? drivers/staging/rts5139/rts51x.c:836:22: sparse: symbol 'rts5139_usb_ids' was not declared. Should it be static?
? drivers/staging/rts5139/rts51x_chip.c:496:39: sparse: incorrect type in argument 5 (different base types)
? drivers/staging/rts5139/sd_cprm.c:272:5: sparse: symbol 'ext_sd_execute_no_data' was not declared. Should it be static?
? drivers/staging/rts5139/sd_cprm.c:340:5: sparse: symbol 'ext_sd_execute_read_data' was not declared. Should it be static?
? drivers/staging/rts5139/sd_cprm.c:545:5: sparse: symbol 'ext_sd_execute_write_data' was not declared. Should it be static?
? drivers/staging/rts5139/sd_cprm.c:781:5: sparse: symbol 'sd_pass_thru_mode' was not declared. Should it be static?
? drivers/staging/rts5139/sd_cprm.c:853:5: sparse: symbol 'sd_execute_no_data' was not declared. Should it be static?
? drivers/staging/rts5139/sd_cprm.c:885:5: sparse: symbol 'sd_execute_read_data' was not declared. Should it be static?
? drivers/staging/rts5139/sd_cprm.c:923:5: sparse: symbol 'sd_execute_write_data' was not declared. Should it be static?
? drivers/staging/rts5139/sd_cprm.c:961:5: sparse: symbol 'sd_get_cmd_rsp' was not declared. Should it be static?
? drivers/staging/rts5139/sd_cprm.c:1000:5: sparse: symbol 'sd_hw_rst' was not declared. Should it be static?
? drivers/staging/rts5139/ms_mg.c:81:5: sparse: symbol 'mg_set_tpc_para_sub' was not declared. Should it be static?
? drivers/staging/rts5139/ms_mg.c:122:5: sparse: symbol 'mg_set_leaf_id' was not declared. Should it be static?
? drivers/staging/rts5139/ms_mg.c:173:5: sparse: symbol 'mg_get_local_EKB' was not declared. Should it be static?
? drivers/staging/rts5139/ms_mg.c:232:5: sparse: symbol 'mg_chg' was not declared. Should it be static?
? drivers/staging/rts5139/ms_mg.c:323:5: sparse: symbol 'mg_get_rsp_chg' was not declared. Should it be static?
? drivers/staging/rts5139/ms_mg.c:392:5: sparse: symbol 'mg_rsp' was not declared. Should it be static?
? drivers/staging/rts5139/ms_mg.c:450:5: sparse: symbol 'mg_get_ICV' was not declared. Should it be static?
? drivers/staging/rts5139/ms_mg.c:514:5: sparse: symbol 'mg_set_ICV' was not declared. Should it be static?
? drivers/scsi/bnx2i/bnx2i_hwi.c:218:16: sparse: incorrect type in argument 1 (different base types)
? drivers/scsi/bnx2i/bnx2i_hwi.c:350:25: sparse: incorrect type in assignment (different base types)
? drivers/scsi/bnx2i/bnx2i_hwi.c:432:54: sparse: restricted itt_t degrades to integer
? drivers/scsi/bnx2i/bnx2i_hwi.c:438:32: sparse: cast to restricted __be32
? drivers/scsi/bnx2i/bnx2i_hwi.c:1723:29: sparse: cast from restricted itt_t
? drivers/scsi/bnx2i/bnx2i_hwi.c:1732:27: sparse: cast to restricted itt_t
? drivers/scsi/mpt2sas/mpt2sas_base.c:995:43: sparse: incorrect type in argument 2 (different address spaces)
? drivers/scsi/mpt2sas/mpt2sas_base.c:1784:26: sparse: incorrect type in initializer (different base types)
? drivers/scsi/mpt2sas/mpt2sas_base.c:3061:24: sparse: incorrect type in argument 1 (different base types)
? drivers/scsi/mpt2sas/mpt2sas_base.c:3080:20: sparse: cast to restricted __le16
? drivers/scsi/mpt2sas/mpt2sas_base.c:4265:22: sparse: cast removes address space of expression
? kernel/trace/trace.c:163:8: sparse: symbol 'global_trace_cpu' was not declared. Should it be static?
? kernel/trace/trace.c:199:8: sparse: symbol 'max_tr_data' was not declared. Should it be static?
? kernel/trace/trace.c:1515:18: sparse: incorrect type in initializer (different address spaces)
? kernel/trace/trace.c:1527:17: sparse: incorrect type in assignment (different address spaces)
? kernel/trace/trace.c:1551:21: sparse: incorrect type in argument 1 (different address spaces)
? kernel/trace/trace.c:4465:15: sparse: symbol 'tracing_dentry_percpu' was not declared. Should it be static?
? kernel/trace/trace_selftest.c:305:5: sparse: symbol 'trace_selftest_startup_dynamic_tracing' was not declared. Should it be static?
? drivers/scsi/qla2xxx/tcm_qla2xxx.c:56:25: sparse: symbol 'tcm_qla2xxx_free_wq' was not declared. Should it be static?
? drivers/scsi/qla2xxx/tcm_qla2xxx.c:57:25: sparse: symbol 'tcm_qla2xxx_cmd_wq' was not declared. Should it be static?
? drivers/scsi/qla2xxx/tcm_qla2xxx.c:750:31: sparse: symbol 'tcm_qla2xxx_fabric_configfs' was not declared. Should it be static?
? drivers/scsi/qla2xxx/tcm_qla2xxx.c:751:31: sparse: symbol 'tcm_qla2xxx_npiv_fabric_configfs' was not declared. Should it be static?
? drivers/target/tcm_fc/tfc_conf.c:270:20: sparse: symbol 'ft_tpg_alloc_fabric_acl' was not declared. Should it be static?
? drivers/target/tcm_fc/tfc_conf.c:563:5: sparse: symbol 'ft_register_configfs' was not declared. Should it be static?
? drivers/target/tcm_fc/tfc_conf.c:610:6: sparse: symbol 'ft_deregister_configfs' was not declared. Should it be static?
? drivers/target/tcm_fc/tfc_sess.c:61:17: sparse: incompatible types in comparison expression (different address spaces)
? arch/x86/boot/version.c:19:12: sparse: symbol 'kernel_version' was not declared. Should it be static?
? arch/x86/boot/compressed/eboot.c:467:6: sparse: symbol 'setup_graphics' was not declared. Should it be static?
? arch/x86/boot/compressed/eboot.c:732:20: sparse: symbol 'make_boot_params' was not declared. Should it be static?
? arch/x86/boot/compressed/eboot.c:1006:20: sparse: symbol 'efi_main' was not declared. Should it be static?
? kernel/sys.c:1048:38: sparse: incorrect type in argument 2 (different modifiers)
? kernel/sys.c:1048:38: sparse: implicit cast to nocast type
? kernel/sys.c:1112:32: sparse: incorrect type in argument 1 (different address spaces)
? include/trace/events/module.h:104:1: sparse: expression using sizeof bool
? kernel/module.c:102:18: sparse: symbol 'kdb_modules' was not declared. Should it be static?
? kernel/module.c:166:6: sparse: symbol '__module_put_and_exit' redeclared with different type (originally declared at include/linux/module.h:441) - different modifiers

vim +190 drivers/gpu/drm/nouveau/core/subdev/therm/fan.c

eb062d72 (Martin Peres 2012-09-04  174) {
eb062d72 (Martin Peres 2012-09-04  175) 	return nouveau_therm_fan_get(therm);
eb062d72 (Martin Peres 2012-09-04  176) }
eb062d72 (Martin Peres 2012-09-04  177) 
eb062d72 (Martin Peres 2012-09-04  178) int
eb062d72 (Martin Peres 2012-09-04  179) nouveau_therm_fan_user_set(struct nouveau_therm *therm, int percent)
eb062d72 (Martin Peres 2012-09-04  180) {
eb062d72 (Martin Peres 2012-09-04  181) 	struct nouveau_therm_priv *priv = (void *)therm;
eb062d72 (Martin Peres 2012-09-04  182) 
eb062d72 (Martin Peres 2012-09-04  183) 	if (priv->fan.mode != FAN_CONTROL_MANUAL)
eb062d72 (Martin Peres 2012-09-04  184) 		return -EINVAL;
eb062d72 (Martin Peres 2012-09-04  185) 
eb062d72 (Martin Peres 2012-09-04  186) 	return nouveau_therm_fan_set(therm, percent);
eb062d72 (Martin Peres 2012-09-04  187) }
eb062d72 (Martin Peres 2012-09-04  188) 
eb062d72 (Martin Peres 2012-09-04  189) void
c4f52f28 (Martin Peres 2012-09-02 @190) nouveau_therm_fan_set_defaults(struct nouveau_therm *therm)
c4f52f28 (Martin Peres 2012-09-02  191) {
c4f52f28 (Martin Peres 2012-09-02  192) 	struct nouveau_therm_priv *priv = (void *)therm;
c4f52f28 (Martin Peres 2012-09-02  193) 
c4f52f28 (Martin Peres 2012-09-02  194) 	priv->bios_fan.pwm_freq = 0;
c4f52f28 (Martin Peres 2012-09-02  195) 	priv->bios_fan.min_duty = 0;
c4f52f28 (Martin Peres 2012-09-02  196) 	priv->bios_fan.max_duty = 100;
c4f52f28 (Martin Peres 2012-09-02  197) }
c4f52f28 (Martin Peres 2012-09-02  198) 

c4f52f2: drm/nouveau/therm: move thermal-related functions to the therm subdev

Please consider folding the attached diff :-)

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu, Yuanhan Liu                              Intel Corporation

--vEao7xgI/oilGqZ+
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="make-it-static-eb062d7.diff"

diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c b/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
index b292379..e452769 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/fan.c
@@ -186,7 +186,7 @@ nouveau_therm_fan_user_set(struct nouveau_therm *therm, int percent)
 	return nouveau_therm_fan_set(therm, percent);
 }
 
-void
+static void
 nouveau_therm_fan_set_defaults(struct nouveau_therm *therm)
 {
 	struct nouveau_therm_priv *priv = (void *)therm;
@@ -211,7 +211,7 @@ nouveau_therm_fan_safety_checks(struct nouveau_therm *therm)
 		priv->bios_fan.min_duty = priv->bios_fan.max_duty;
 }
 
-int nouveau_fan_pwm_clock_dummy(struct nouveau_therm *therm)
+static int nouveau_fan_pwm_clock_dummy(struct nouveau_therm *therm)
 {
 	return 1;
 }
diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c b/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c
index fcf2cfe..1fc3b26 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c
@@ -75,7 +75,7 @@ nv40_temp_get(struct nouveau_therm *therm)
 	return core_temp;
 }
 
-int
+static int
 nv40_fan_pwm_get(struct nouveau_therm *therm, int line, u32 *divs, u32 *duty)
 {
 	if (line == 2) {
@@ -101,7 +101,7 @@ nv40_fan_pwm_get(struct nouveau_therm *therm, int line, u32 *divs, u32 *duty)
 	return -EINVAL;
 }
 
-int
+static int
 nv40_fan_pwm_set(struct nouveau_therm *therm, int line, u32 divs, u32 duty)
 {
 	if (line == 2) {
diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c b/drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c
index 6f97de2..ad6cde0 100644
--- a/drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c
+++ b/drivers/gpu/drm/nouveau/core/subdev/therm/nv50.c
@@ -50,7 +50,7 @@ pwm_info(struct nouveau_therm *therm, int *line, int *ctrl, int *indx)
 	return 0;
 }
 
-int
+static int
 nv50_fan_pwm_get(struct nouveau_therm *therm, int line, u32 *divs, u32 *duty)
 {
 	int ctrl, id, ret = pwm_info(therm, &line, &ctrl, &id);
@@ -66,7 +66,7 @@ nv50_fan_pwm_get(struct nouveau_therm *therm, int line, u32 *divs, u32 *duty)
 	return -EINVAL;
 }
 
-int
+static int
 nv50_fan_pwm_set(struct nouveau_therm *therm, int line, u32 divs, u32 duty)
 {
 	int ctrl, id, ret = pwm_info(therm, &line, &ctrl, &id);
@@ -79,7 +79,7 @@ nv50_fan_pwm_set(struct nouveau_therm *therm, int line, u32 divs, u32 duty)
 	return 0;
 }
 
-int
+static int
 nv50_fan_pwm_clock(struct nouveau_therm *therm)
 {
 	int chipset = nv_device(therm)->chipset;
@@ -105,7 +105,7 @@ nv50_fan_pwm_clock(struct nouveau_therm *therm)
 	return pwm_clock;
 }
 
-int
+static int
 nv50_temp_get(struct nouveau_therm *therm)
 {
 	return nv_rd32(therm, 0x20400);

--vEao7xgI/oilGqZ+--
