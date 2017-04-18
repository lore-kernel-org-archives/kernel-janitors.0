From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 16:48:10 +0000
Subject: [PATCH 0/6] ACPI: Fine-tuning for some function implementations
Message-Id: <077115e4-8ec3-9c6d-0374-8ffc5e0f85c0@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-acpi@vger.kernel.org, Borislav Petkov <bp@suse.de>, Chun-Yi Lee <joeyli.kernel@gmail.com>, Colin Ian King <colin.king@canonical.com>, Dan Williams <dan.j.williams@intel.com>, Len Brown <lenb@kernel.org>, Linda Knippers <linda.knippers@hpe.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Tony Luck <tony.luck@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, Zhang Rui <rui.zhang@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 18 Apr 2017 18:28:18 +0200

A few update suggestions were taken into account
from static source code analysis.

Markus Elfring (6):
  fan: Use devm_kcalloc() in acpi_fan_get_fps()
  fan: Delete error messages for a failed memory allocation in two functions
  nfit: Use devm_kcalloc() in nfit_mem_dcr_init()
  einj: Replace 12 seq_printf() calls by seq_puts() in available_error_type_show()
  battery: Replace 16 seq_printf() calls by seq_puts()
  proc: Replace two seq_printf() calls by seq_puts() in acpi_system_wakeup_device_seq_show()

 drivers/acpi/apei/einj.c | 25 +++++++++++++------------
 drivers/acpi/battery.c   | 34 +++++++++++++++++-----------------
 drivers/acpi/fan.c       |  9 +++------
 drivers/acpi/nfit/core.c |  8 +++++---
 drivers/acpi/proc.c      |  4 ++--
 5 files changed, 40 insertions(+), 40 deletions(-)

-- 
2.12.2

