From: Julia Lawall <julia@diku.dk>
Date: Tue, 22 Apr 2008 21:06:41 +0000
Subject: Re: script to find incorrect tests on unsigneds
Message-Id: <Pine.LNX.4.64.0804222257090.1439@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4808C90A.5040600@tiscali.nl>
In-Reply-To: <4808C90A.5040600@tiscali.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Some functions have return type unsigned int, but return a negative 
integer anyway.  I don't know whether this is a problem in practice, 
because the integer will get its proper value back if stored in a variable 
of type int, but at least it gives the wrong impression.

A list of these functions is below.

A simplified version of the semantic match used to find these functions is 
as follows (http://www.emn.fr/x-info/coccinelle/):

@@
identifier f;
expression E, E1;
constant C;
position p;
@@

unsigned f@p(...) {
  ... when any
(
* return -C;
|
  E = -C;
  ... when != E = E1
* return E;
)
}


julia

----------------------------------------

powernowk8_get:            arch/x86/kernel/cpu/cpufreq/powernow-k8.c::1232
nforce2_detect_chipset:    arch/x86/kernel/cpu/cpufreq/cpufreq-nforce2.c::391
longrun_determine_freqs:   arch/x86/kernel/cpu/cpufreq/longrun.c::168
speedstep_get_freqs:       arch/x86/kernel/cpu/cpufreq/speedstep-lib.c::346
speedstep_get:             arch/x86/kernel/cpu/cpufreq/speedstep-smi.c::320
ia32_poke:                 arch/ia64/ia32/sys_ia32.c::1446
prom_claim:                arch/powerpc/kernel/prom_init.c::361
bfin_gpio_irq_startup:     arch/blackfin/mach-common/ints-priority.c::698
make_rate:                 drivers/atm/firestream.c::446
r3964_poll:                drivers/char/n_r3964.c::1213
FAN_FROM_REG:              drivers/hwmon/adm9240.c::111
amd_ec_wait_read:          drivers/i2c/busses/i2c-amd8111.c::86
amd_ec_read:               drivers/i2c/busses/i2c-amd8111.c::102
amd_ec_wait_write:         drivers/i2c/busses/i2c-amd8111.c::70
amd_ec_write:              drivers/i2c/busses/i2c-amd8111.c::120
pasemi_smb_waitready:      drivers/i2c/busses/i2c-pasemi.c::90
init_chipset_cs5530:       drivers/ide/pci/cs5530.c::135
init_chipset_hpt366:       drivers/ide/pci/hpt366.c::967
init_chipset_pdcnew:       drivers/ide/pci/pdc202xx_new.c::327
pci_init_sgiioc4:          drivers/ide/pci/sgiioc4.c::669
init_chipset_sis5513:      drivers/ide/pci/sis5513.c::362
sl82c105_bridge_revision:  drivers/ide/pci/sl82c105.c::235
init_chipset_via82cxxx:    drivers/ide/pci/via82cxxx.c::269
cinergyt2_poll:            drivers/media/dvb/cinergyT2/cinergyT2.c::555
dvb_demux_poll:            drivers/media/dvb/dvb-core/dmxdev.c::943
radio_poll:                drivers/media/video/bt8xx/bttv-driver.c::3599
saa_geo_setup:             drivers/media/video/planb.c::204
pwc_video_poll:            drivers/media/video/pwc/pwc-if.c::1381
v4l_stk_poll:              drivers/media/video/stk-webcam.c::794
xc2028_get_reg:            drivers/media/video/tuner-xc2028.c::130
scc_set_param:             drivers/net/hamradio/scc.c::1299
tun_chr_poll:              drivers/net/tun.c::262
calc_L1_latency:           drivers/pci/pcie/aspm.c::243
calc_L0S_latency:          drivers/pci/pcie/aspm.c::226
tiqdio_check_chsc_availability:         drivers/s390/cio/qdio.c::2352
tiqdio_set_subchannel_ind:              drivers/s390/cio/qdio.c::2396
tiqdio_set_delay_target:                drivers/s390/cio/qdio.c::2503
jsm_tty_get_mctrl:                      drivers/serial/jsm/jsm_tty.c::74
uio_poll:                               drivers/uio/uio.c::360
nfsacl_encode:                          fs/nfs_common/nfsacl.c::75
nfsacl_decode:                          fs/nfs_common/nfsacl.c::227
tipc_k_signal:                          net/tipc/handler.c::55
p9_fd_poll:                             net/9p/trans_fd.c::1255
snd_pcm_hw_param_value_min:             sound/core/oss/pcm_oss.c::149
snd_pcm_hw_param_value_max:             sound/core/oss/pcm_oss.c::175
azx_rirb_get_response:                  sound/pci/hda/hda_intel.c::556
wm8731_read_reg_cache:                  sound/soc/codecs/wm8731.c::75
wm8750_read_reg_cache:                  sound/soc/codecs/wm8750.c::80
wm8753_read_reg_cache:                  sound/soc/codecs/wm8753.c::117
ac97_read:                              sound/soc/codecs/wm9712.c::471
cs4270_read_reg_cache:                  sound/soc/codecs/cs4270.c::316
aic3x_read_reg_cache:                   sound/soc/codecs/tlv320aic3x.c::98

----------------------------------------

