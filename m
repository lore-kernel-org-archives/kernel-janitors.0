From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Thu, 11 Feb 2010 13:03:52 +0000
Subject: Re: [PATCH] drivers/acpi/processor_thermal.c
Message-Id: <1265893432.27789.14.camel@ICE-BOX>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1265882211.27789.1.camel@ICE-BOX>
In-Reply-To: <1265882211.27789.1.camel@ICE-BOX>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Renninger <trenn@suse.de>
Cc: Julia Lawall <julia@diku.dk>, Len Brown <lenb@kernel.org>, Zhang Rui <rui.zhang@intel.com>, H Hartley Sweeten <hsweeten@visionengravers.com>, Andrew Morton <akpm@linux-foundation.org>, Alexey Dobriyan <adobriyan@gmail.com>, Matthew Garrett <mjg@redhat.com>, linux ACPI <linux-acpi@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kernel Janitors <kernel-janitors@vger.kernel.org>


On Thu, Feb 11, 2010 at 10:04 PM, Thomas Renninger <trenn@suse.de>
wrote:
> I expect also Darren has to rebase his fixes on top of this
> one then.

In case Len decides to go this way, here are the two patches rebased on top of this change 
and combined into one patch.

[PATCH] drivers/acpi/ fix use before NULL checking 

Fix some use before NULL checks by re-ordering of code in drivers/acpi

Coverity CID: 2752 2751 2750 2758


Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com>
---
 drivers/acpi/fan.c               |    9 +++++++--
 drivers/acpi/processor_thermal.c |   28 ++++++++++++++++++++--------
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/drivers/acpi/fan.c b/drivers/acpi/fan.c
index 1290c25..278cebd 100644
--- a/drivers/acpi/fan.c
+++ b/drivers/acpi/fan.c
@@ -298,9 +298,14 @@ static int acpi_fan_add(struct acpi_device *device)
 
 static int acpi_fan_remove(struct acpi_device *device, int type)
 {
-	struct thermal_cooling_device *cdev = device->driver_data;
+	struct thermal_cooling_device *cdev;
+
+	if (!device)
+		return -EINVAL;
+
+	cdev = device->driver_data;
 
-	if (!device || !cdev)
+	if (!cdev)
 		return -EINVAL;
 
 	acpi_fan_remove_fs(device);
diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_thermal.c
index cd18c98..3c9f8ac 100644
--- a/drivers/acpi/processor_thermal.c
+++ b/drivers/acpi/processor_thermal.c
@@ -379,9 +379,14 @@ processor_get_max_state(struct thermal_cooling_device *cdev,
 			unsigned long *state)
 {
 	struct acpi_device *device = cdev->devdata;
-	struct acpi_processor *pr = device->driver_data;
+	struct acpi_processor *pr;
 
-	if (!device || !pr)
+	if (!device)
+		return -EINVAL;
+
+	pr = device->driver_data;
+
+	if (!pr)
 		return -EINVAL;
 
 	*state = acpi_processor_max_state(pr);
@@ -393,9 +398,14 @@ processor_get_cur_state(struct thermal_cooling_device *cdev,
 			unsigned long *cur_state)
 {
 	struct acpi_device *device = cdev->devdata;
-	struct acpi_processor *pr = device->driver_data;
+	struct acpi_processor *pr;
+
+	if (!device)
+		return -EINVAL;
 
-	if (!device || !pr)
+	pr = device->driver_data;
+
+	if (!pr)
 		return -EINVAL;
 
 	*cur_state = cpufreq_get_cur_state(pr->id);
@@ -409,18 +419,20 @@ processor_set_cur_state(struct thermal_cooling_device *cdev,
 			unsigned long state)
 {
 	struct acpi_device *device = cdev->devdata;
-	struct acpi_processor *pr = device->driver_data;
+	struct acpi_processor *pr;
 	int result = 0;
 	int max_pstate;
 
-	if (!device || !pr)
+	if (!device)
 		return -EINVAL;
 
-	max_pstate = cpufreq_get_max_state(pr->id);
+	pr = device->driver_data;
 
-	if (state > acpi_processor_max_state(pr))
+	if (!pr || state > acpi_processor_max_state(pr))
 		return -EINVAL;
 
+	max_pstate = cpufreq_get_max_state(pr->id);
+
 	if (state <= max_pstate) {
 		if (pr->flags.throttling && pr->throttling.state)
 			result = acpi_processor_set_throttling(pr, 0, false);
-- 
1.6.3.3

 



