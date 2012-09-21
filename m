From: Fengguang Wu <fengguang.wu@intel.com>
Date: Fri, 21 Sep 2012 07:21:42 +0000
Subject: [acpi:release 13/17] drivers/usb/core/usb-acpi.c:55:18: error: storage size of 'pld' isn't known
Message-Id: <20120921072142.GB1253@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Feng Tang <feng.tang@intel.com>
Cc: Yuanhan Liu <yuanhan.liu@intel.com>, kernel-janitors@vger.kernel.org, Len Brown <len.brown@intel.com>, Bob Moore <robert.moore@intel.com>, linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org

Hi Feng,

FYI, kernel build failed on

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git release
head:   abd4c92003ce21c37ca0e6d9d62b93eb22ec118b
commit: 8ede06aba5dffa78a27a18c47a9059eb38072ada [13/17] ACPI: Use ACPICA native way to decode the PLD buffer
config: x86_64-allmodconfig

[error]
drivers/usb/core/usb-acpi.c:55:18: error: storage size of 'pld' isn't known

[warning]
drivers/usb/core/usb-acpi.c:55:18: warning: unused variable 'pld' [-Wunused-variable]

vim +55 drivers/usb/core/usb-acpi.c
    39			goto out;
    40		}
    41	
    42		if (upc->package.elements[0].integer.value)
    43			udev->removable = USB_DEVICE_REMOVABLE;
    44		else
    45			udev->removable = USB_DEVICE_FIXED;
    46	
    47	out:
    48		kfree(upc);
    49		return ret;
    50	}
    51	
    52	static int usb_acpi_check_pld(struct usb_device *udev, acpi_handle handle)
    53	{
    54		acpi_status status;
  > 55		struct acpi_pld pld;
    56	
    57		status = acpi_get_physical_device_location(handle, &pld);
    58	
    59		if (ACPI_FAILURE(status))
    60			return -ENODEV;
    61	
    62		if (pld.user_visible)
    63			udev->removable = USB_DEVICE_REMOVABLE;

---
0-DAY kernel build testing backend         Open Source Technology Centre
Fengguang Wu <wfg@linux.intel.com>                     Intel Corporation
