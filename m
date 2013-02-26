From: Fengguang Wu <fengguang.wu@intel.com>
Date: Tue, 26 Feb 2013 02:41:49 +0000
Subject: build regressions 2013-02-25
Message-Id: <512c20ed.+8YwWRVIo7dFSDrQ%fengguang.wu@intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[errors]
drivers/platform/x86/chromeos_laptop.c:179:2: error: implicit declaration of function 'add_probed_i2c_device' [-Werror=implicit-function-declaration]
drivers/platform/x86/chromeos_laptop.c:179:41: error: 'I2C_ADAPTER_VGADDC' undeclared (first use in this function)
drivers/platform/x86/chromeos_laptop.c:220:44: error: 'I2C_ADAPTER_PANEL' undeclared (first use in this function)

[warnings]
drivers/net/wireless/brcm80211/brcmfmac/bcmsdh_sdmmc.c:77:6: warning: 'err_ret' may be used uninitialized in this function [-Wuninitialized]
drivers/net/wireless/iwlwifi/pcie/trans.c:845:8: warning: unused variable 'val' [-Wunused-variable]
warning: (DRM_RADEON_KMS && DRM_I915 && STUB_POULSBO && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && IDEAPAD_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (DRM_RADEON_KMS && DRM_I915 && STUB_POULSBO && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && IDEAPAD_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
warning: (DRM_RADEON_KMS && DRM_I915 && STUB_POULSBO && FB_BACKLIGHT && USB_APPLEDISPLAY && FB_OLPC_DCON && ASUS_LAPTOP && SONY_LAPTOP && IDEAPAD_LAPTOP && THINKPAD_ACPI && EEEPC_LAPTOP && ACPI_CMPC && SAMSUNG_Q10) selects BACKLIGHT_CLASS_DEVICE which has unmet direct dependencies (HAS_IOMEM && BACKLIGHT_LCD_SUPPORT)
fs/ext4/inode.c:3427:6: warning: 'ret' may be used uninitialized in this function [-Wmaybe-uninitialized]

---
0-DAY kernel build testing backend              Open Source Technology Center
http://lists.01.org/mailman/listinfo/kbuild                 Intel Corporation
