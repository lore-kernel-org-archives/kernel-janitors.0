From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 09 Aug 2017 15:30:12 +0000
Subject: [PATCH v2 0/9] ACPI-video: Fine-tuning for several function implementations
Message-Id: <d8cc6f88-9261-55d9-a736-a14b853a2570@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <566ABCD9.1060404@users.sourceforge.net>
 <897ebf36-2fe5-e109-adf6-b81b6e863d9a@users.sourceforge.net>
 <CAJZ5v0hug9QfZHQosCFFXEcFMsDd=YvXkqMmQya3RSqmOnY4dg@mail.gmail.com>
 <3e0cdc5b-fd15-515a-82f2-2f44792664ed@users.sourceforge.net>
 <CAJZ5v0gWgxbtJ4m0eDkdOaR_usjTqmcWBWds5qprr+ydHhEjnA@mail.gmail.com>
 <6882cbb1-3f61-fb64-2972-30c277f28580@users.sourceforge.net>
 <CAJZ5v0hyhdUknW8RqpT6f4zAuPuMN1EN=P7C54Aa+VqEK2pcGw@mail.gmail.com>
In-Reply-To: <CAJZ5v0hyhdUknW8RqpT6f4zAuPuMN1EN=P7C54Aa+VqEK2pcGw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-acpi@vger.kernel.org, Len Brown <lenb@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Zhang Rui <rui.zhang@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From 2a7010a6555091b685ed51d91fea23ff9058047c Mon Sep 17 00:00:00 2001
From: Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 9 Aug 2017 17:16:15 +0200
Subject: [PATCH v2 0/9] ACPI-video: Fine-tuning for several function implementations

Several update suggestions were taken into account
from static source code analysis.

Markus Elfring (9):
  Use kmalloc_array() in acpi_video_get_levels()
  Return directly after a failed device query
  Delete an error message for a failed kzalloc() call
  Return directly after a failed input_allocate_device()
  Delete unnecessary if statement in acpi_video_switch_brightness()
  Improve a jump target in acpi_video_switch_brightness()
  Delete an unnecessary initialisation in three functions
  Move four assignments in acpi_video_get_levels()
  Improve a size determination in four functions

---

v2:
* Desired changes were rebased on source files from Linux next-20170803.

* Some update steps were recombined.

 drivers/acpi/acpi_video.c | 53 ++++++++++++++++++++++-------------------------
 1 file changed, 25 insertions(+), 28 deletions(-)

-- 
2.13.4

