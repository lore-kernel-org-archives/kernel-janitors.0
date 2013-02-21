From: Fengguang Wu <fengguang.wu@intel.com>
Date: Thu, 21 Feb 2013 17:08:28 +0000
Subject: build regressions 2013-02-21
Message-Id: <5126548c.YdfAGforXf/fZojk%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/cpufreq/cpufreq_conservative.c:245: error: incompatible types in assignment
drivers/cpufreq/cpufreq_governor.c:39: error: incompatible types in assignment
drivers/cpufreq/cpufreq_governor.c:40: error: invalid operands to binary +
drivers/cpufreq/cpufreq_governor.c:41: error: invalid operands to binary +
drivers/cpufreq/cpufreq_governor.c:42: error: invalid operands to binary +
drivers/cpufreq/cpufreq_governor.c:43: error: invalid operands to binary +
drivers/cpufreq/cpufreq_governor.c:44: error: invalid operands to binary +
drivers/cpufreq/cpufreq_governor.c:107: error: invalid operands to binary -
drivers/cpufreq/cpufreq_governor.c:116: error: incompatible types in assignment
drivers/cpufreq/cpufreq_governor.c:219: error: incompatible types in assignment
drivers/cpufreq/cpufreq_ondemand.c:406: error: incompatible types in assignment
arch/ia64/kernel/sys_ia64.c:47:12: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/ia64/kernel/sys_ia64.c:73:6: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/powerpc/mm/slice.c:251:16: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:253:6: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:255:26: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/powerpc/mm/slice.c:280:7: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/powerpc/mm/slice.c:283:30: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:284:13: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:291:5: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:309:16: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:310:6: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:311:6: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/powerpc/mm/slice.c:317:12: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/powerpc/mm/slice.c:328:16: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/powerpc/mm/slice.c:358:7: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/powerpc/mm/slice.c:363:30: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:364:13: error: 'struct mm_struct' has no member named 'cached_hole_size'
arch/powerpc/mm/slice.c:382:5: error: 'struct mm_struct' has no member named 'free_area_cache'
arch/powerpc/mm/slice.c:383:5: error: 'struct mm_struct' has no member named 'cached_hole_size'
drivers/cpufreq/cpufreq_conservative.c:244:33: error: incompatible types when assigning to type 'u64' from type 'atomic64_t'
drivers/cpufreq/cpufreq_governor.c:39:12: error: incompatible types when assigning to type 'u64' from type 'atomic64_t'
drivers/cpufreq/cpufreq_governor.c:40:12: error: invalid operands to binary + (have 'u64' and 'atomic64_t')
drivers/cpufreq/cpufreq_governor.c:41:12: error: invalid operands to binary + (have 'u64' and 'atomic64_t')
drivers/cpufreq/cpufreq_governor.c:42:12: error: invalid operands to binary + (have 'u64' and 'atomic64_t')
drivers/cpufreq/cpufreq_governor.c:43:12: error: invalid operands to binary + (have 'u64' and 'atomic64_t')
drivers/cpufreq/cpufreq_governor.c:44:12: error: invalid operands to binary + (have 'u64' and 'atomic64_t')
drivers/cpufreq/cpufreq_governor.c:106:53: error: invalid operands to binary - (have 'atomic64_t' and 'u64')
drivers/cpufreq/cpufreq_governor.c:115:24: error: incompatible types when assigning to type 'u64' from type 'atomic64_t'
drivers/cpufreq/cpufreq_governor.c:218:27: error: incompatible types when assigning to type 'u64' from type 'atomic64_t'
drivers/cpufreq/cpufreq_ondemand.c:405:33: error: incompatible types when assigning to type 'u64' from type 'atomic64_t'
drivers/macintosh/rack-meter.c:86:51: error: invalid operands to binary + (have 'atomic64_t' and 'atomic64_t')
drivers/macintosh/rack-meter.c:90:10: error: invalid operands to binary + (have 'u64' and 'atomic64_t')
arch/s390/appldata/appldata_os.c:116:4: error: incompatible type for argument 1 of 'cputime_to_jiffies'
arch/s390/appldata/appldata_os.c:118:4: error: incompatible type for argument 1 of 'cputime_to_jiffies'
arch/s390/appldata/appldata_os.c:120:4: error: incompatible type for argument 1 of 'cputime_to_jiffies'
arch/s390/appldata/appldata_os.c:122:4: error: incompatible type for argument 1 of 'cputime_to_jiffies'
arch/s390/appldata/appldata_os.c:124:4: error: incompatible type for argument 1 of 'cputime_to_jiffies'
arch/s390/appldata/appldata_os.c:126:4: error: incompatible type for argument 1 of 'cputime_to_jiffies'
arch/s390/appldata/appldata_os.c:128:4: error: incompatible type for argument 1 of 'cputime_to_jiffies'
arch/s390/appldata/appldata_os.c:130:4: error: incompatible type for argument 1 of 'cputime_to_jiffies'

[warnings]
drivers/infiniband/ulp/isert/isert_core.c:418:54: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'unsigned int' [-Wformat]
drivers/infiniband/ulp/isert/isert_core.c:507:2: warning: #warning FIXME: Check for partial WRITEs [-Wcpp]
warning: (DRM_RADEON && DRM_I915 && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (DRM_RADEON && DRM_I915 && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (DRM_RADEON && DRM_I915 && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (DRM_RADEON && DRM_I915 && DRM_TILCDC && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (DRM_RADEON && DRM_I915 && DRM_TILCDC && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (DRM_RADEON && DRM_I915 && DRM_TILCDC && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
fs/btrfs/raid56.c:946:1: warning: 'finish_rmw' uses dynamic stack allocation [enabled by default]

[smatch]
fs/btrfs/volumes.c:4755 __btrfs_map_block() warn: possible memory leak of 'raid_map'
drivers/target/iscsi/iscsi_target_util.c:696 iscsit_release_cmd() error: we previously assumed 'conn' could be null (see line 691)
drivers/infiniband/ulp/isert/isert_verbs.c:308 isert_connect_release() warn: variable dereferenced before check 'isert_conn->conn_cm_id' (see line 291)
drivers/infiniband/ulp/isert/isert_core.c:248 isert_rx_login_req() error: __builtin_memcpy() '&desc->data[0]' too small (128 vs 8192)

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
