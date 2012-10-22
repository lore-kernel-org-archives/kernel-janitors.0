From: Fengguang Wu <fengguang.wu@intel.com>
Date: Mon, 22 Oct 2012 10:14:32 +0000
Subject: Re: a dedicated list for build error reports?
Message-Id: <20121022101432.GA10934@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121018130146.GA11433@localhost>
In-Reply-To: <20121018130146.GA11433@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

> Normally it's in some tree that no one has

That's not a problem if you are to help look at the private reports,
which include some useful debug/reproduce aids comparing to the public
reports.

For example, for the error

+ drivers/net/ethernet/emulex/benet/be_main.c:3116 be_flash() error: __builtin_memcpy() 'req->params.data_buf' too small (4 vs 32768)

The private report will include these ready to run commands:

        git remote update net-next
        git checkout 773a2d7c55a3d63207841c824d21920bd3683460
        vim +3116 drivers/net/ethernet/emulex/benet/be_main.c

After pasting the above 3 lines into shell, we are ready to look into
the problem.

It assumes a local git directory with this setup:

git remote add --no-tags  linus                    git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
git remote add --no-tags  aa                       git://git.kernel.org/pub/scm/linux/kernel/git/andrea/aa.git
git remote add --no-tags  acpi                     git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git
git remote add --no-tags  ak                       git://git.kernel.org/pub/scm/linux/kernel/git/ak/linux-misc.git
git remote add --no-tags  asoc                     git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git
git remote add --no-tags  ath6kl                   git://github.com/kvalo/ath6kl
git remote add --no-tags  audit                    git://git.kernel.org/pub/scm/linux/kernel/git/viro/audit.git
git remote add --no-tags  balbi-usb                git://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git
git remote add --no-tags  batman                   git://git.open-mesh.org/linux-merge
git remote add --no-tags  battery                  git://git.infradead.org/battery-2.6.git
git remote add --no-tags  blackfin                 git://git.kernel.org/pub/scm/linux/kernel/git/lliubbo/blackfin.git
git remote add --no-tags  block                    git://git.kernel.dk/linux-block.git
git remote add --no-tags  bluetooth                git://git.kernel.org/pub/scm/linux/kernel/git/bluetooth/bluetooth-next.git
git remote add --no-tags  bryan-nfs                git://git.linux-nfs.org/projects/bjschuma/linux-nfs.git
git remote add --no-tags  btrfs                    git://git.kernel.org/pub/scm/linux/kernel/git/mason/linux-btrfs.git
git remote add --no-tags  can                      git://gitorious.org/linux-can/linux-can-next
git remote add --no-tags  ceph                     git://git.kernel.org/pub/scm/linux/kernel/git/sage/ceph-client.git
git remote add --no-tags  cgroup                   git://git.kernel.org/pub/scm/linux/kernel/git/tj/cgroup.git
git remote add --no-tags  char-misc                git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git
git remote add --no-tags  cifs                     git://git.samba.org/sfrench/cifs-2.6.git
git remote add --no-tags  calxeda                  git://sources.calxeda.com/kernel/linux.git
git remote add --no-tags  configfs                 git://git.kernel.org/pub/scm/linux/kernel/git/jlbec/configfs.git
git remote add --no-tags  congwang                 git://github.com/congwang/linux.git
git remote add --no-tags  cpufreq                  git://git.kernel.org/pub/scm/linux/kernel/git/davej/cpufreq.git
git remote add --no-tags  cpumask                  git://git.kernel.org/pub/scm/linux/kernel/git/rusty/cpumask.git
git remote add --no-tags  cryptodev                git://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git
git remote add --no-tags  crypto                   git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6.git
git remote add --no-tags  digsig                   git://git.kernel.org/pub/scm/linux/kernel/git/kasatkin/linux-digsig.git
git remote add --no-tags  dlm                      git://git.kernel.org/pub/scm/linux/kernel/git/teigland/linux-dlm.git
git remote add --no-tags  dma-buf                  git://git.linaro.org/people/sumitsemwal/linux-dma-buf.git
git remote add --no-tags  dmaengine                git://git.kernel.org/pub/scm/linux/kernel/git/djbw/dmaengine.git
git remote add --no-tags  dm                       git://git.kernel.org/pub/scm/linux/kernel/git/agk/linux-dm.git
git remote add --no-tags  drdb                     git://git.drbd.org/linux-drbd.git
git remote add --no-tags  driver-core              git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
git remote add --no-tags  drm                      git://people.freedesktop.org/~airlied/linux.git
git remote add --no-tags  drm-intel                git://people.freedesktop.org/~danvet/drm-intel.git
git remote add --no-tags  ecryptfs                 git://git.kernel.org/pub/scm/linux/kernel/git/tyhicks/ecryptfs.git
git remote add --no-tags  edac                     git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-edac.git
git remote add --no-tags  efi                      git://git.kernel.org/pub/scm/linux/kernel/git/mfleming/linux.git
git remote add --no-tags  ext3                     git://git.kernel.org/pub/scm/linux/kernel/git/jack/linux-fs.git
git remote add --no-tags  ext4                     git://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git
git remote add --no-tags  fbdev                    git://github.com/schandinat/linux-2.6.git
git remote add --no-tags  firewire                 git://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git
git remote add --no-tags  floppy                   git://git.kernel.org/pub/scm/linux/kernel/git/jikos/floppy.git
git remote add --no-tags  fuse                     git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git
git remote add --no-tags  galak-powerpc            git://git.kernel.org/pub/scm/linux/kernel/git/galak/powerpc.git
git remote add --no-tags  gfs2                     git://git.kernel.org/pub/scm/linux/kernel/git/steve/gfs2-3.0-nmw.git
git remote add --no-tags  grant                    git://git.secretlab.ca/git/linux-2.6.git
git remote add --no-tags  gpio                     git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
git remote add --no-tags  hid                      git://git.kernel.org/pub/scm/linux/kernel/git/jikos/hid.git
git remote add --no-tags  hwmon                    git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git
git remote add --no-tags  i2c                      git://git.pengutronix.de/git/wsa/linux.git
git remote add --no-tags  ia64                     git://git.kernel.org/pub/scm/linux/kernel/git/aegl/linux.git
git remote add --no-tags  ide                      git://git.kernel.org/pub/scm/linux/kernel/git/davem/ide.git
git remote add --no-tags  infiniband               git://git.kernel.org/pub/scm/linux/kernel/git/roland/infiniband.git
git remote add --no-tags  input                    git://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git
git remote add --no-tags  integrity                git://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git
git remote add --no-tags  iommu                    git://git.kernel.org/pub/scm/linux/kernel/git/joro/iommu.git
git remote add --no-tags  isci                     git://git.kernel.org/pub/scm/linux/kernel/git/djbw/isci.git
git remote add --no-tags  iwlwifi                  git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi.git
git remote add --no-tags  jbarnes-drm-intel        git://git.kernel.org/pub/scm/linux/kernel/git/jbarnes/drm-intel.git
git remote add --no-tags  jbarnes                  git://people.freedesktop.org/~jbarnes/linux
git remote add --no-tags  jbarnes-pci              git://git.kernel.org/pub/scm/linux/kernel/git/jbarnes/pci.git
git remote add --no-tags  jeremy-xen               git://git.kernel.org/pub/scm/linux/kernel/git/jeremy/xen.git
git remote add --no-tags  josef-btrfs              git://git.kernel.org/pub/scm/linux/kernel/git/josef/btrfs-next.git
git remote add --no-tags  kbuild                   git://git.kernel.org/pub/scm/linux/kernel/git/mmarek/kbuild.git
git remote add --no-tags  keithp                   git://people.freedesktop.org/~keithp/linux
git remote add --no-tags  keys                     git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/security-keys.git
git remote add --no-tags  kgdb                     git://git.kernel.org/pub/scm/linux/kernel/git/jwessel/kgdb.git
git remote add --no-tags  konrad-mm                git://git.kernel.org/pub/scm/linux/kernel/git/konrad/mm.git
git remote add --no-tags  ktest                    git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-ktest.git
git remote add --no-tags  kvm                      git://git.kernel.org/pub/scm/virt/kvm/kvm.git
git remote add --no-tags  l2-mtd                   git://git.infradead.org/users/dedekind/l2-mtd.git
git remote add --no-tags  leds                     git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds.git
git remote add --no-tags  libata                   git://git.kernel.org/pub/scm/linux/kernel/git/jgarzik/libata-dev.git
git remote add --no-tags  logfs                    git://github.com/prasad-joshi/logfs_upstream.git
git remote add --no-tags  mac80211                 git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211.git
git remote add --no-tags  mac80211-next            git://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next.git
git remote add --no-tags  md                       git://neil.brown.name/md
git remote add --no-tags  media                    git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
git remote add --no-tags  memcg                    git://git.kernel.org/pub/scm/linux/kernel/git/mhocko/mm.git
git remote add --no-tags  mfd                      git://git.kernel.org/pub/scm/linux/kernel/git/sameo/mfd-2.6.git
git remote add --no-tags  miklos-vfs               git://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/vfs.git
git remote add --no-tags  mips                     git://git.linux-mips.org/pub/scm/ralf/upstream-linus.git
git remote add --no-tags  mlin                     git://git.kernel.org/pub/scm/linux/kernel/git/mlin/linux.git
git remote add --no-tags  mmc                      git://git.kernel.org/pub/scm/linux/kernel/git/cjb/mmc.git
git remote add --no-tags  mmu                      git://git.kernel.org/pub/scm/linux/kernel/git/peterz/mmu.git
git remote add --no-tags  modsign                  git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-modsign.git
git remote add --no-tags  mtd                      git://git.infradead.org/linux-mtd.git
git remote add --no-tags  netdev                   git://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net.git
git remote add --no-tags  netdev-next              git://git.kernel.org/pub/scm/linux/kernel/git/jkirsher/net-next.git
git remote add --no-tags  net                      git://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git
git remote add --no-tags  net-next                 git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git
git remote add --no-tags  next                     git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
git remote add --no-tags  nfc                      git://git.kernel.org/pub/scm/linux/kernel/git/sameo/nfc-3.0.git
git remote add --no-tags  vcgomes-nfc              git://git.infradead.org/users/vcgomes/linux-nfc.git
git remote add --no-tags  nf-next                  git://150.214.188.80/nf-next
git remote add --no-tags  nf                       git://150.214.188.80/nf
git remote add --no-tags  nfsd                     git://linux-nfs.org/~bfields/linux.git
git remote add --no-tags  nfs                      git://git.linux-nfs.org/projects/trondmy/linux-nfs.git
git remote add --no-tags  nouveau                  git://git.freedesktop.org/git/nouveau/linux-2.6
git remote add --no-tags  ocfs2                    git://git.kernel.org/pub/scm/linux/kernel/git/jlbec/ocfs2.git
git remote add --no-tags  omap-dss2                git://gitorious.org/linux-omap-dss2/linux
git remote add --no-tags  omap-dt                  git://git.kernel.org/pub/scm/linux/kernel/git/bcousson/linux-omap-dt.git
git remote add --no-tags  openvswitch              git://git.kernel.org/pub/scm/linux/kernel/git/jesse/openvswitch.git
git remote add --no-tags  oprofile                 git://git.kernel.org/pub/scm/linux/kernel/git/rric/oprofile.git
git remote add --no-tags  paulg                    git://git.kernel.org/pub/scm/linux/kernel/git/paulg/linux.git
git remote add --no-tags  paulus-powerpc           git://git.kernel.org/pub/scm/linux/kernel/git/paulus/powerpc.git
git remote add --no-tags  pci                      git://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git
git remote add --no-tags  pcmcia                   git://git.kernel.org/pub/scm/linux/kernel/git/brodo/pcmcia.git
git remote add --no-tags  percpu                   git://git.kernel.org/pub/scm/linux/kernel/git/tj/percpu.git
git remote add --no-tags  perf                     git://git.kernel.org/pub/scm/linux/kernel/git/acme/linux.git
git remote add --no-tags  pinctrl                  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
git remote add --no-tags  platform-drivers-x86     git://cavan.codon.org.uk/platform-drivers-x86
git remote add --no-tags  pm                       git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
git remote add --no-tags  powerpc-4xx              git://git.kernel.org/pub/scm/linux/kernel/git/jwboyer/powerpc-4xx.git
git remote add --no-tags  powerpc                  git://git.kernel.org/pub/scm/linux/kernel/git/benh/powerpc.git
git remote add --no-tags  random                   git://git.kernel.org/pub/scm/linux/kernel/git/tytso/random.git
git remote add --no-tags  ras                      git://git.kernel.org/pub/scm/linux/kernel/git/ras/ras.git
git remote add --no-tags  rcu                      git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git
git remote add --no-tags  regmap                   git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git
git remote add --no-tags  regulator                git://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git
git remote add --no-tags  remoteproc               git://git.kernel.org/pub/scm/linux/kernel/git/ohad/remoteproc.git
git remote add --no-tags  romieu                   git://violet.fr.zoreil.com/romieu/linux
git remote add --no-tags  rusty                    git://git.kernel.org/pub/scm/linux/kernel/git/rusty/linux.git
git remote add --no-tags  rw                       git://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git
git remote add --no-tags  s390                     git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git
git remote add --no-tags  samsung                  git://git.infradead.org/users/kmpark/linux-samsung
git remote add --no-tags  kgene-samsung            git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
git remote add --no-tags  sched                    git://git.kernel.org/pub/scm/linux/kernel/git/peterz/sched.git
git remote add --no-tags  scsi                     git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi.git
git remote add --no-tags  security                 git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/linux-security.git
git remote add --no-tags  selinux                  git://git.infradead.org/users/eparis/selinux.git
git remote add --no-tags  sfc                      git://git.kernel.org/pub/scm/linux/kernel/git/bwh/sfc-next
git remote add --no-tags  sh                       git://github.com/pmundt/linux-sh.git
git remote add --no-tags  signal                   git://git.kernel.org/pub/scm/linux/kernel/git/viro/signal.git
git remote add --no-tags  slab                     git://git.kernel.org/pub/scm/linux/kernel/git/penberg/linux.git
git remote add --no-tags  slave-dma                git://git.infradead.org/users/vkoul/slave-dma.git
git remote add --no-tags  smack                    git://git.gitorious.org/smack-next/kernel.git
git remote add --no-tags  sound                    git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
git remote add --no-tags  sound-unstable           git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound-unstable.git
git remote add --no-tags  sparc                    git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc.git
git remote add --no-tags  sparc-next               git://git.kernel.org/pub/scm/linux/kernel/git/davem/sparc-next.git
git remote add --no-tags  squashfs                 git://git.kernel.org/pub/scm/linux/kernel/git/pkl/squashfs-next.git
git remote add --no-tags  stable                   git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
git remote add --no-tags  staging                  git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
git remote add --no-tags  sysctl                   git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/sysctl.git
git remote add --no-tags  target                   git://git.kernel.org/pub/scm/linux/kernel/git/nab/target-pending.git
git remote add --no-tags  thermal                  git://git.kernel.org/pub/scm/linux/kernel/git/rzhang/linux.git
git remote add --no-tags  time                     git://git.linaro.org/people/jstultz/linux.git
git remote add --no-tags  tip                      git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
git remote add --no-tags  tj-misc                  git://git.kernel.org/pub/scm/linux/kernel/git/tj/misc.git
git remote add --no-tags  trace                    git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace.git
git remote add --no-tags  tracing                  git://github.com/fweisbec/tracing
git remote add --no-tags  tty                      git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git
git remote add --no-tags  uapi                     git://git.infradead.org/users/dhowells/linux-headers.git
git remote add --no-tags  ubi2                     git://git.kernel.org/pub/scm/linux/kernel/git/rw/ubi2.git
git remote add --no-tags  ubifs                    git://git.infradead.org/linux-ubifs.git
git remote add --no-tags  ubi                      git://git.infradead.org/linux-ubi.git
git remote add --no-tags  uml                      git://git.kernel.org/pub/scm/linux/kernel/git/rw/uml.git
git remote add --no-tags  uprobes                  git://github.com/srikard/linux.git
git remote add --no-tags  usb                      git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
git remote add --no-tags  userns                   git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace.git
git remote add --no-tags  v9fs                     git://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git
git remote add --no-tags  vfs                      git://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git
git remote add --no-tags  vhost                    git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git
git remote add --no-tags  watchdog                 git://www.linux-watchdog.org/linux-watchdog.git
git remote add --no-tags  wireless                 git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless.git
git remote add --no-tags  wireless-next            git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-next.git
git remote add --no-tags  wireless-testing         git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-testing.git
git remote add --no-tags  wl12xx                   git://git.kernel.org/pub/scm/linux/kernel/git/luca/wl12xx.git
git remote add --no-tags  wq                       git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git
git remote add --no-tags  writeback                git://git.kernel.org/pub/scm/linux/kernel/git/wfg/linux.git
git remote add --no-tags  xen                      git://git.kernel.org/pub/scm/linux/kernel/git/konrad/xen.git
git remote add --no-tags  xfs                      git://oss.sgi.com/xfs/xfs
git remote add --no-tags  xhci                     git://git.kernel.org/pub/scm/linux/kernel/git/sarah/xhci.git
git remote add --no-tags  yinghai                  git://git.kernel.org/pub/scm/linux/kernel/git/yinghai/linux-yinghai.git
git remote add --no-tags  arm-integrator           git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
git remote add --no-tags  arm-platforms            git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git
git remote add --no-tags  kvm-arm                  git://git.kernel.org/pub/scm/linux/kernel/git/rusty/linux-kvm-arm.git
git remote add --no-tags  arm-soc                  git://git.kernel.org/pub/scm/linux/kernel/git/arm/arm-soc.git
git remote add --no-tags  arm-tegra                git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-tegra.git
git remote add --no-tags  arm-perf                 git://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git
git remote add --no-tags  m68knommu                git://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git
git remote add --no-tags  m68k                     git://git.kernel.org/pub/scm/linux/kernel/git/geert/linux-m68k.git
git remote add --no-tags  aarch64                  git://git.kernel.org/pub/scm/linux/kernel/git/cmarinas/linux-aarch64.git
git remote add --no-tags  arm                      git://ftp.arm.linux.org.uk/pub/linux/arm/kernel/git-cur/linux-arm.git
git remote add --no-tags  davinci                  git://gitorious.org/linux-davinci/linux-davinci.git
git remote add --no-tags  vfio                     git://github.com/awilliam/linux-vfio.git
git remote add --no-tags  dma-mapping              git://git.linaro.org/people/mszyprowski/linux-dma-mapping.git
git remote add --no-tags  glommer-memcg            git://git.kernel.org/pub/scm/linux/kernel/git/glommer/memcg.git
git remote add --no-tags  ks8695                   git://git.kernel.org/pub/scm/linux/kernel/git/gerg/ks8695.git
git remote add --no-tags  cr                       git://git.kernel.org/pub/scm/linux/kernel/git/gorcunov/linux-cr.git
git remote add --no-tags  renesas                  git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git
git remote add --no-tags  iwlwifi-next             git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git
git remote add --no-tags  jdelvare-staging         git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging.git
git remote add --no-tags  iio                      git://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git
git remote add --no-tags  jikos-block              git://git.kernel.org/pub/scm/linux/kernel/git/jikos/linux-block.git
git remote add --no-tags  kees                     git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git
git remote add --no-tags  hwspinlock               git://git.kernel.org/pub/scm/linux/kernel/git/ohad/hwspinlock.git
git remote add --no-tags  rpmsg                    git://git.kernel.org/pub/scm/linux/kernel/git/ohad/rpmsg.git
git remote add --no-tags  oleg                     git://git.kernel.org/pub/scm/linux/kernel/git/oleg/misc.git
git remote add --no-tags  intel-net-next           git://git.kernel.org/pub/scm/linux/kernel/git/ppwaskie/net-next.git
git remote add --no-tags  intel-net                git://git.kernel.org/pub/scm/linux/kernel/git/ppwaskie/net.git
git remote add --no-tags  gfs2-fixes               git://git.kernel.org/pub/scm/linux/kernel/git/steve/gfs2-3.0-fixes.git
git remote add --no-tags  omap                     git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git
git remote add --no-tags  olpc                     git://dev.laptop.org/users/dilinger/linux-olpc.git
git remote add --no-tags  omap-pm                  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap-pm.git
git remote add --no-tags  pwm                      git://gitorious.org/linux-pwm/linux-pwm.git
git remote add --no-tags  arm-jcooper              git://git.infradead.org/users/jcooper/linux.git
git remote add --no-tags  radeon-alex              git://people.freedesktop.org/~agd5f/linux.git
git remote add --no-tags  rpi                      git://git.kernel.org/pub/scm/linux/kernel/git/swarren/linux-rpi.git
git remote add --no-tags  lpc32xx                  git://git.antcom.de/linux-2.6.git
git remote add --no-tags  ablock84-btrfs           git://github.com/ablock84/linux-btrfs.git
git remote add --no-tags  kvm-ppc                  git://github.com/agraf/linux-2.6.git
git remote add --no-tags  at91                     git://github.com/at91linux/linux-at91.git
git remote add --no-tags  dynticks                 git://github.com/fweisbec/linux-dynticks.git
git remote add --no-tags  hzhuang1                 git://github.com/hzhuang1/linux.git
git remote add --no-tags  lunn                     git://github.com/lunn/linux.git
git remote add --no-tags  jan-o-sch-btrfs          git://git.jan-o-sch.net/btrfs-unstable.git
git remote add --no-tags  broonie-misc             git://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git
git remote add --no-tags  tile                     git://git.kernel.org/pub/scm/linux/kernel/git/cmetcalf/linux-tile.git
git remote add --no-tags  parisc                   git://git.kernel.org/pub/scm/linux/kernel/git/jejb/parisc-2.6.git
git remote add --no-tags  nomadik                  git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-nomadik.git
git remote add --no-tags  stericsson               git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-stericsson.git
git remote add --no-tags  omap-pending             git://git.kernel.org/pub/scm/linux/kernel/git/pjw/omap-pending.git
git remote add --no-tags  rafael-renesas           git://git.kernel.org/pub/scm/linux/kernel/git/rafael/renesas.git
git remote add --no-tags  ux500                    git://git.linaro.org/people/ljones/linux-3.0-ux500.git
git remote add --no-tags  clk                      git://git.linaro.org/people/mturquette/linux.git
git remote add --no-tags  vexpress                 git://git.linaro.org/people/pawelmoll/linux.git
git remote add --no-tags  shawnguo                 git://git.linaro.org/people/shawnguo/linux-2.6.git
git remote add --no-tags  open-osd                 git://git.open-osd.org/linux-open-osd.git
git remote add --no-tags  sirfprima2               git://gitorious.org/sirfprima2-kernel/sirfprima2-kernel.git
git remote add --no-tags  imx                      git://git.pengutronix.de/git/imx/linux-2.6.git
git remote add --no-tags  c6x                      git://linux-c6x.org/git/projects/linux-c6x-upstreaming.git
git remote add --no-tags  pinchartl-fbdev          git://linuxtv.org/pinchartl/fbdev.git
git remote add --no-tags  radeon                   git://people.freedesktop.org/~deathsimple/linux.git
git remote add --no-tags  nvme                     git://git.infradead.org/users/willy/linux-nvme
git remote add --no-tags  rydberg                  git://github.com/rydberg/linux
git remote add --no-tags  rtg                      git://kernel.ubuntu.com/rtg/net-next
git remote add --no-tags  ukl                      git://git.pengutronix.de/git/ukl/linux
git remote add --no-tags  pvhvm                    git://xenbits.xen.org/people/sstabellini/linux-pvhvm
git remote add --no-tags  cris                     git://jni.nu/cris
git remote add --no-tags  shaggy                   git://github.com/kleikamp/linux-shaggy
git remote add --no-tags  bp                       git://git.kernel.org/pub/scm/linux/kernel/git/bp/bp
git remote add --no-tags  msm                      git://git.kernel.org/pub/scm/linux/kernel/git/davidb/linux-msm
git remote add --no-tags  wmt                      git://git.code.sf.net/p/linuxwmt/code
git remote add --no-tags  dtc                      git://git.jdl.com/software/dtc.git
git remote add --no-tags  ac100                    git://gitorious.org/~marvin24/ac100/marvin24s-kernel
git remote add --no-tags  lp0                      git://github.com/lp0/linux
git remote add --no-tags  arm-uclinux              git://git.kernel.org/pub/scm/linux/kernel/git/gerg/uclinux.git
git remote add --no-tags  ipvs-next                git://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs-next.git
git remote add --no-tags  ipvs                     git://git.kernel.org/pub/scm/linux/kernel/git/horms/ipvs.git
git remote add --no-tags  jgarzik                  git://git.kernel.org/pub/scm/linux/kernel/git/jgarzik/linux.git
git remote add --no-tags  luto                     git://git.kernel.org/pub/scm/linux/kernel/git/luto/linux.git
git remote add --no-tags  pjt-sched                git://git.kernel.org/pub/scm/linux/kernel/git/pjt/sched.git
git remote add --no-tags  pstore                   git://git.infradead.org/users/cbou/linux-pstore
git remote add --no-tags  arm-amitdanielk          git://git.linaro.org/people/amitdanielk/linux
git remote add --no-tags  mips-next                git://dev.phrozen.org/mips-next
git remote add --no-tags  arm-lp                   git://linux-arm.org/linux-2.6-lp
git remote add --no-tags  mips-daney               git://git.linux-mips.org/pub/scm/daney/upstream-daney
git remote add --no-tags  mips-sjhill              git://git.linux-mips.org/pub/scm/sjhill/linux-sjhill
git remote add --no-tags  microblaze               git://git.monstr.eu/linux-2.6-microblaze
git remote add --no-tags  tpmdd                    git://github.com/shpedoikal/linux
git remote add --no-tags  asm-generic              git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic
git remote add --no-tags  openrisc-jonas           git://openrisc.net/jonas/linux
git remote add --no-tags  xtensa                   git://github.com/czankel/xtensa-linux
git remote add --no-tags  ido                      git://git.kernel.org/pub/scm/linux/kernel/git/ido/linux.git
git remote add --no-tags  iwlwifi-fixes            git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-fixes.git
git remote add --no-tags  reiserfs                 git://git.kernel.org/pub/scm/linux/kernel/git/jeffm/linux-reiserfs.git
git remote add --no-tags  khilman                  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux.git
git remote add --no-tags  ipsec                    git://git.kernel.org/pub/scm/linux/kernel/git/klassert/ipsec.git

Thanks,
Fengguang
