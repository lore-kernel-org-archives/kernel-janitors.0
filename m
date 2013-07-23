From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 23 Jul 2013 22:53:45 +0000
Subject: build regressions 2013-07-23
Message-Id: <51ef0979.RcjcX4c8N9aah3vs%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
sound/soc/omap/omap-abe-twl6040.c:49:28: fatal error: aess/omap-aess.h: No such file or directory
sound/soc/omap/omap-mcpdm.c:46:28: fatal error: aess/omap-aess.h: No such file or directory
drivers/clk/clk-palmas.c:170:3: error: implicit declaration of function 'of_property_read_u32' [-Werror=implicit-function-declaration]
olpc_dcon_xo_1.c:(.text+0x17bfc8): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c00c): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c018): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c027): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c036): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c045): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x17c054): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x17c063): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x17c072): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x17c081): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x17c0c8): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c0e4): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c0f3): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c102): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c111): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c1a7): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x17c1b3): undefined reference to `cs5535_gpio_isset'
olpc_dcon_xo_1.c:(.text+0x17c20f): undefined reference to `cs5535_gpio_setup_event'
olpc_dcon_xo_1.c:(.text+0x17c21e): undefined reference to `cs5535_gpio_set_irq'
olpc_dcon_xo_1.c:(.text+0x17c265): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x17c274): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c283): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x17c292): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x17c2a1): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x17c2b0): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c2bf): undefined reference to `cs5535_gpio_clear'
olpc_dcon_xo_1.c:(.text+0x17c2ce): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c2da): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c2e9): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c2f8): undefined reference to `cs5535_gpio_set'
olpc_dcon_xo_1.c:(.text+0x17c307): undefined reference to `cs5535_gpio_set'
(.text+0x2fc1c): undefined reference to `regmap_init_i2c'
(.text+0x8d354): undefined reference to `video_devdata'
(.text+0x8d397): undefined reference to `video_devdata'
(.text+0x8d3da): undefined reference to `video_devdata'
(.text+0x8d417): undefined reference to `video_devdata'
(.text+0x8d597): undefined reference to `video_devdata'
(.text+0x8e7f0): undefined reference to `v4l2_event_pending'
(.text+0x8e9e3): undefined reference to `video_devdata'
(.text+0x8eda7): undefined reference to `video_devdata'
(.text+0x8ee87): undefined reference to `video_devdata'
(.text+0x8ef4d): undefined reference to `video_devdata'
(.text+0x8f14a): undefined reference to `video_devdata'
(.text+0x8f234): undefined reference to `v4l2_fh_release'
usbtv.c:(.text+0x914d5): undefined reference to `v4l2_get_timestamp'
usbtv.c:(.text+0x91582): undefined reference to `v4l2_device_unregister'
usbtv.c:(.text+0x915aa): undefined reference to `video_devdata'
usbtv.c:(.text+0x91799): undefined reference to `v4l2_device_register'
usbtv.c:(.text+0x917d6): undefined reference to `video_device_release_empty'
usbtv.c:(.text+0x9183e): undefined reference to `__video_register_device'
usbtv.c:(.text+0x9184f): undefined reference to `v4l2_device_unregister'
usbtv.c:(.text+0x91b97): undefined reference to `video_unregister_device'
usbtv.c:(.text+0x91b9f): undefined reference to `v4l2_device_disconnect'
usbtv.c:(.text+0x91bc8): undefined reference to `v4l2_device_put'
drivers/built-in.o:(.data+0xfc08): undefined reference to `video_ioctl2'
drivers/built-in.o:(.data+0xfc20): undefined reference to `v4l2_fh_open'
sound/soc/soc-pcm.c:2104:52: error: 'struct snd_pcm_substream' has no member named 'hw_no_buffer'
sound/soc/soc-pcm.c:2105:51: error: 'struct snd_pcm_substream' has no member named 'hw_no_buffer'
sound/soc/soc-dapm.c:826:13: error: 'struct snd_soc_dapm_widget' has no member named 'dai_endpoint'
sound/soc/soc-dapm.c:926:13: error: 'struct snd_soc_dapm_widget' has no member named 'dai_endpoint'

[warnings]
drivers/gpu/drm/i915/intel_display.c:9646:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/gpu/drm/i915/intel_display.c:9646:2: warning: (near initialization for 'intel_quirks[12].hook') [enabled by default]
drivers/gpu/drm/i915/intel_display.c:9648:2: warning: initialization from incompatible pointer type [enabled by default]
drivers/gpu/drm/i915/intel_display.c:9648:2: warning: (near initialization for 'intel_quirks[13].hook') [enabled by default]

[sparse]
drivers/vhost/vhost.c:592:39: sparse: incorrect type in assignment (different address spaces) @@    expected struct vring_desc *desc @@    got voidstruct vring_desc *desc @@
drivers/vhost/vhost.c:593:40: sparse: incorrect type in assignment (different address spaces) @@    expected struct vring_avail *avail @@    got voistruct vring_avail *avail @@
drivers/vhost/vhost.c:594:39: sparse: incorrect type in assignment (different address spaces) @@    expected struct vring_used *used @@    got voidstruct vring_used *used @@
drivers/vhost/vhost.c:879:13: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:1>*<noident> @@    got oderef] <asn:1>*<noident> @@
drivers/vhost/vhost.c:883:16: sparse: incorrect type in argument 1 (different address spaces) @@    expected void const volatile [noderef] <asn:1>*<noident> @@    got oderef] <asn:1>*<noident> @@
drivers/gpu/drm/radeon/atombios_dp.c:105:30: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [addressable] [usertype] lpAuxRequest @@    got ed] [addressable] [usertype] lpAuxRequest @@
drivers/gpu/drm/radeon/atombios_dp.c:106:27: sparse: incorrect type in assignment (different base types) @@    expected unsigned short [unsigned] [addressable] [usertype] lpDataOut @@    got ed] [addressable] [usertype] lpDataOut @@
drivers/gpu/drm/i915/intel_display.c:9646:35: sparse: incorrect type in initializer (different argument counts) @@    expected void ( *hook )( ... ) @@    got void ( static [topvoid ( *hook )( ... ) @@
drivers/gpu/drm/i915/intel_display.c:9648:35: sparse: incorrect type in initializer (different argument counts) @@    expected void ( *hook )( ... ) @@    got void ( static [topvoid ( *hook )( ... ) @@

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
