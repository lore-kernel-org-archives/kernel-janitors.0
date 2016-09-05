From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 05 Sep 2016 16:42:19 +0000
Subject: [PATCH 00/21] ACPI-video: Fine-tuning for several function implementations
Message-Id: <897ebf36-2fe5-e109-adf6-b81b6e863d9a@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
In-Reply-To: <566ABCD9.1060404@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-acpi@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Zhang Rui <rui.zhang@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>, Paolo Bonzini <pbonzini@redhat.com>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Mon, 5 Sep 2016 18:22:11 +0200

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (21):
  Use kmalloc_array() in acpi_video_get_levels()
  Return directly after a failed device query
  Delete an error message for a failed kzalloc() call
  Rename jump labels in acpi_video_get_levels()
  Delete an unnecessary initialisation in acpi_video_get_levels()
  Move four assignments in acpi_video_get_levels()
  Rename jump labels in acpi_video_bus_add()
  Improve a size determination in acpi_video_bus_add()
  Rename jump labels in acpi_video_register()
  Return directly after a failed input_allocate_device()
  Rename jump labels in acpi_video_bus_add_notify_handler()
  Delete unnecessary if statement in acpi_video_switch_brightness()
  Improve a jump target in acpi_video_switch_brightness()
  Improve a size determination in acpi_video_device_enumerate()
  Delete an unnecessary initialisation in acpi_video_device_enumerate()
  Rename jump labels in acpi_video_device_enumerate()
  Delete an unnecessary initialisation in acpi_video_init_brightness()
  Rename jump labels in acpi_video_init_brightness()
  Rename a jump label in acpi_video_device_lcd_query_levels()
  Improve a size determination in acpi_video_dev_register_backlight()
  Improve a size determination in acpi_video_bus_get_one_device()

 drivers/acpi/acpi_video.c | 114 +++++++++++++++++++++-------------------------
 1 file changed, 52 insertions(+), 62 deletions(-)

-- 
2.10.0

