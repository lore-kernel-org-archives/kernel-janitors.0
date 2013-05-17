From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 17 May 2013 16:08:42 +0000
Subject: build regressions 2013-05-17
Message-Id: <5196560a.0o9ErO4PTv/CsYky%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/dma/dmatest.c:942: error: dereferencing pointer to incomplete type
drivers/vhost/net.c:174:12: error: 'struct vhost_net_virtqueue' has no member named 'ubufs'
drivers/vhost/net.c:263:150: error: 'struct vhost_net_virtqueue' has no member named 'ubufs'
drivers/vhost/net.c:264:23: error: 'struct vhost_net_virtqueue' has no member named 'ubufs'
drivers/vhost/net.c:265:29: error: 'struct vhost_net_virtqueue' has no member named 'ubufs'
drivers/vhost/net.c:273:25: error: 'struct vhost_net_virtqueue' has no member named 'ubufs'
drivers/vhost/net.c:343:13: error: 'struct vhost_net_virtqueue' has no member named 'ubufs'
drivers/vhost/net.c:364:11: error: 'struct vhost_net_virtqueue' has no member named 'ubufs'
drivers/vhost/net.c:365:33: error: 'struct vhost_net_virtqueue' has no member named 'ubufs'
drivers/vhost/net.c:402:22: error: 'struct vhost_net_virtqueue' has no member named 'ubufs'
drivers/vhost/net.c:407:17: error: 'struct vhost_net_virtqueue' has no member named 'ubufs'
drivers/vhost/net.c:418:27: error: 'struct vhost_net_virtqueue' has no member named 'ubufs'
drivers/vhost/net.c:685:12: error: 'struct vhost_net_virtqueue' has no member named 'ubufs'
drivers/vhost/net.c:762:29: error: 'struct vhost_net_virtqueue' has no member named 'ubufs'
drivers/vhost/net.c:767:54: error: 'struct vhost_net_virtqueue' has no member named 'ubufs'
drivers/vhost/net.c:770:37: error: 'struct vhost_net_virtqueue' has no member named 'ubufs'
drivers/vhost/net.c:916:15: error: 'struct vhost_virtqueue' has no member named 'ubuf_kref'
drivers/vhost/net.c:917:28: error: 'struct vhost_virtqueue' has no member named 'ubuf_kref'
drivers/vhost/net.c:917:245: error: 'struct vhost_virtqueue' has no member named 'ubuf_wait'
drivers/vhost/net.c:917:291: error: 'struct vhost_virtqueue' has no member named 'ubuf_kref'
drivers/vhost/net.c:917:352: error: 'struct vhost_virtqueue' has no member named 'ubuf_wait'
drivers/vhost/net.c:137:17: error: dereferencing pointer to incomplete type
drivers/vhost/net.c:138:30: error: dereferencing pointer to incomplete type
drivers/vhost/net.c:138:243: error: dereferencing pointer to incomplete type
drivers/vhost/net.c:138:287: error: dereferencing pointer to incomplete type
drivers/vhost/net.c:138:344: error: dereferencing pointer to incomplete type
drivers/vhost/net.c:260:15: error: 'struct vhost_ubuf_info' has no member named 'ubufs'
drivers/vhost/net.c:261:13: error: dereferencing pointer to incomplete type
drivers/vhost/net.c:262:26: error: dereferencing pointer to incomplete type
drivers/vhost/net.c:267:152: error: dereferencing pointer to incomplete type
drivers/vhost/net.c:268:22: error: dereferencing pointer to incomplete type
drivers/vhost/net.c:269:31: error: dereferencing pointer to incomplete type
drivers/vhost/net.c:373:9: error: 'struct vhost_ubuf_info' has no member named 'ubufs'
drivers/vhost/net.c:870:3: error: implicit declaration of function 'vhost_net_ubuf_alloc' [-Werror=implicit-function-declaration]
drivers/net/ethernet/cadence/macb.c:1566:2: error: implicit declaration of function 'of_get_mac_address' [-Werror=implicit-function-declaration]
drivers/net/ethernet/cadence/macb.c:1572:2: error: implicit declaration of function 'of_get_phy_mode' [-Werror=implicit-function-declaration]
drivers/net/wireless/ath/wil6210/main.c:66:14: error: 'struct wireless_dev' has no member named 'sme_state'
drivers/net/wireless/ath/wil6210/main.c:67:7: error: 'CFG80211_SME_CONNECTED' undeclared (first use in this function)
drivers/net/wireless/ath/wil6210/main.c:71:7: error: 'CFG80211_SME_CONNECTING' undeclared (first use in this function)
drivers/net/wireless/ath/wil6210/wmi.c:409:11: error: 'struct wireless_dev' has no member named 'sme_state'
drivers/net/wireless/ath/wil6210/wmi.c:409:26: error: 'CFG80211_SME_CONNECTING' undeclared (first use in this function)
(.text+0x2b2253): undefined reference to `zl10353_attach'
(.text+0x2b22d9): undefined reference to `zl10353_attach'
(.text+0x2b2338): undefined reference to `zl10353_attach'
(.text+0x2d86de): undefined reference to `s5h1409_attach'
(.text+0x2d86fd): undefined reference to `mxl5005s_attach'
net/wireless/mlme.c:113:2: error: 'reason_code' undeclared (first use in this function)
net/wireless/mlme.c:115:2: error: 'from_ap' undeclared (first use in this function)
drivers/dma/iovlock.c:98:21: error: dereferencing pointer to incomplete type
drivers/dma/iovlock.c:101:11: error: dereferencing pointer to incomplete type
drivers/dma/iovlock.c:108:19: error: dereferencing pointer to incomplete type
(.text+0x147cd5): undefined reference to `v4l2_event_pending'
uvc_driver.c:(.text+0x150370): undefined reference to `v4l2_prio_init'
uvc_v4l2.c:(.text+0x1518ee): undefined reference to `v4l2_fh_del'
uvc_v4l2.c:(.text+0x1518f6): undefined reference to `v4l2_fh_exit'
uvc_v4l2.c:(.text+0x151b60): undefined reference to `video_usercopy'
uvc_v4l2.c:(.text+0x151b85): undefined reference to `v4l_printk_ioctl'
uvc_v4l2.c:(.text+0x1526c5): undefined reference to `v4l2_prio_check'
uvc_v4l2.c:(.text+0x152b78): undefined reference to `v4l2_prio_check'
uvc_v4l2.c:(.text+0x152c16): undefined reference to `v4l2_prio_check'
uvc_v4l2.c:(.text+0x152deb): undefined reference to `v4l2_prio_check'
uvc_v4l2.c:(.text+0x152e60): undefined reference to `v4l2_prio_check'
uvc_v4l2.c:(.text+0x152f9f): undefined reference to `v4l2_event_subscribe'
uvc_v4l2.c:(.text+0x15308b): undefined reference to `v4l2_prio_check'
uvc_v4l2.c:(.text+0x15314c): undefined reference to `v4l2_event_dequeue'
uvc_v4l2.c:(.text+0x153217): undefined reference to `v4l2_prio_check'
uvc_v4l2.c:(.text+0x15323b): undefined reference to `v4l2_prio_change'
uvc_v4l2.c:(.text+0x15326c): undefined reference to `v4l2_prio_check'
uvc_v4l2.c:(.text+0x1532c7): undefined reference to `v4l2_prio_max'
uvc_v4l2.c:(.text+0x15333b): undefined reference to `v4l2_prio_check'
uvc_ctrl.c:(.text+0x156e98): undefined reference to `v4l2_event_queue_fh'
uvc_ctrl.c:(.text+0x156f28): undefined reference to `v4l2_event_queue_fh'
drivers/built-in.o:(.rodata+0x1f4f0): undefined reference to `v4l2_ctrl_replace'
drivers/built-in.o:(.rodata+0x1f4f8): undefined reference to `v4l2_ctrl_merge'
ngene-cards.c:(.text+0x3bebb9): undefined reference to `drxd_attach'
(.text+0x3e77f7): undefined reference to `tda10048_attach'
(.text+0x3e78ef): undefined reference to `tda10048_attach'

[warnings]
arch/arm/kernel/smp.c:436:2: warning: initialization from incompatible pointer type [enabled by default]
arch/arm/kernel/smp.c:436:2: warning: (near initialization for 'ipi_types[1].handler') [enabled by default]
drivers/mfd/stw481x.c:156: warning: 'stw481x_set_pctl_reg' defined but not used
drivers/vhost/net.c:135:48: warning: 'struct vhost_net_ubuf_ref' declared inside parameter list [enabled by default]
drivers/vhost/net.c:135:48: warning: its scope is only this definition or declaration, which is probably not what you want [enabled by default]
drivers/vhost/net.c:870:9: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/vhost/net.c:900:3: warning: passing argument 1 of 'vhost_net_ubuf_put_and_wait' from incompatible pointer type [enabled by default]
drivers/vhost/net.c:917:3: warning: passing argument 1 of 'vhost_net_ubuf_put_and_wait' from incompatible pointer type [enabled by default]
drivers/net/ethernet/cadence/macb.c:1566:6: warning: assignment makes pointer from integer without a cast [enabled by default]
drivers/mfd/stw481x.c:32:5: warning: unused variable 'regandval' [-Wunused-variable]
warning: (CRC_T10DIF) selects CRYPTO_CRCT10DIF which has unmet direct dependencies (CRYPTO)
warning: (CRC_T10DIF) selects CRYPTO_CRCT10DIF which has unmet direct dependencies (CRYPTO)
warning: (CRC_T10DIF) selects CRYPTO_CRCT10DIF which has unmet direct dependencies (CRYPTO)
warning: (CRC_T10DIF) selects CRYPTO_CRCT10DIF which has unmet direct dependencies (CRYPTO)
warning: (CRC_T10DIF) selects CRYPTO_CRCT10DIF which has unmet direct dependencies (CRYPTO)

[sparse]
drivers/net/ethernet/cadence/macb.c:1566:15: sparse: undefined identifier 'of_get_mac_address'
drivers/net/ethernet/cadence/macb.c:1572:15: sparse: undefined identifier 'of_get_phy_mode'

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
