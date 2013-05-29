From: Fengguang Wu <fengguang.wu@intel.com>
Date: Wed, 29 May 2013 19:37:12 +0000
Subject: build regressions 2013-05-29
Message-Id: <51a658e8.bLeDPcbGdZkxH6CW%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
fs/btrfs/free-space-cache.c:3014:15: error: 'block_group' undeclared (first use in this function)
av7110.c:(.text+0x111f9f): undefined reference to `ves1x93_attach'
av7110.c:(.text+0x1120af): undefined reference to `l64781_attach'
av7110.c:(.text+0x11210b): undefined reference to `ves1x93_attach'
gdm_usb.c:(.text+0x18ed5c): undefined reference to `usb_autopm_get_interface'
gdm_usb.c:(.text+0x18ed68): undefined reference to `usb_autopm_put_interface'
ERROR: "pci_iomap_range" [drivers/virtio/virtio_pci.ko] undefined!

[warnings]
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
Warning(include/net/cfg80211.h:972): Enum value 'MONITOR_FLAG_ACTIVE' not described in enum 'monitor_flags'
arch/x86/mm/init.c:120:12: warning: 'page_size_mask' defined but not used [-Wunused-variable]
arch/x86/platform/mrst/vrtc.c:131:29: warning: assignment from incompatible pointer type [enabled by default]
arch/x86/platform/mrst/vrtc.c:132:29: warning: assignment from incompatible pointer type [enabled by default]
drivers/ata/sata_rcar.c:183:2: warning: large integer implicitly truncated to unsigned type [-Woverflow]
arch/x86/mm/init.c:344:16: warning: unused variable 'i' [-Wunused-variable]
arch/x86/mm/init.c:344:6: warning: unused variable 'nr_range' [-Wunused-variable]
drivers/virtio/virtio_pci_modern.c:242:5: warning: format '%u' expects argument of type 'unsigned int', but argument 6 has type 'size_t' [-Wformat]

[sparse]
drivers/vhost/vhost.c:590:39: sparse: incorrect type in assignment (different address spaces)
drivers/vhost/vhost.c:591:40: sparse: incorrect type in assignment (different address spaces)
drivers/vhost/vhost.c:592:39: sparse: incorrect type in assignment (different address spaces)
drivers/vhost/vhost.c:875:13: sparse: incorrect type in argument 1 (different address spaces)
drivers/vhost/vhost.c:879:16: sparse: incorrect type in argument 1 (different address spaces)
drivers/virtio/virtio_balloon.c:286:9: sparse: restricted __le32 degrades to integer
drivers/virtio/virtio_balloon.c:286:9: sparse: incorrect type in argument 3 (different base types)
drivers/virtio/virtio_balloon.c:286:9: sparse: incorrect type in argument 3 (different base types)
drivers/virtio/virtio_balloon.c:286:9: sparse: incorrect type in argument 3 (different base types)
drivers/virtio/virtio_balloon.c:286:9: sparse: incorrect type in argument 3 (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_balloon.c:276:9: sparse: incorrect type in assignment (different base types)
drivers/virtio/virtio_pci_modern.c:43:30: sparse: incorrect type in argument 2 (different address spaces)
drivers/virtio/virtio_pci_modern.c:44:45: sparse: incorrect type in argument 2 (different address spaces)
drivers/virtio/virtio_pci_modern.c:50:25: sparse: incorrect type in argument 1 (different address spaces)
drivers/virtio/virtio_pci_modern.c:50:63: sparse: incorrect type in argument 1 (different address spaces)
drivers/virtio/virtio_pci_modern.c:148:48: sparse: incorrect type in argument 1 (different address spaces)
drivers/virtio/virtio_pci_modern.c:155:47: sparse: incorrect type in argument 2 (different address spaces)
drivers/virtio/virtio_pci_modern.c:211:41: sparse: incorrect type in argument 1 (different address spaces)
drivers/virtio/virtio_pci_modern.c:287:34: sparse: incorrect type in argument 2 (different address spaces)
drivers/virtio/virtio_pci_modern.c:289:34: sparse: incorrect type in argument 2 (different address spaces)
drivers/virtio/virtio_pci_modern.c:291:34: sparse: incorrect type in argument 2 (different address spaces)
drivers/virtio/virtio_pci_modern.c:355:37: sparse: incorrect type in argument 2 (different address spaces)
drivers/virtio/virtio_pci_modern.c:356:37: sparse: incorrect type in argument 2 (different address spaces)
drivers/virtio/virtio_pci_modern.c:357:37: sparse: incorrect type in argument 2 (different address spaces)
fs/btrfs/free-space-cache.c:3014:22: sparse: undefined identifier 'block_group'

[coccinelle]
drivers/bcma/sprom.c:610:29-34: ERROR: reference preceded by free on line 599
drivers/bcma/sprom.c:610:29-34: ERROR: reference preceded by free on line 599

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
