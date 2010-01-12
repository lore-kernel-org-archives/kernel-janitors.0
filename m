From: Darren Jenkins <darrenrjenkins@gmail.com>
Date: Tue, 12 Jan 2010 12:37:07 +0000
Subject: [PATCH] drivers/acpi/power_meter.c : remove double kfree()
Message-Id: <1263299827.4571.11.camel@ICE-BOX>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: djwong@us.ibm.com, lenb@kernel.org, linux-acpi@vger.kernel.org, Kernel Janitors <kernel-janitors@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

resource->domain_devices can be double kfree()'d in a couple of places.
Fix this by setting num_domain_devices = 0 after the kfree().

Coverity CID: 13356, 13355, 13354

Signed-off-by: Darren Jenkins <darrenrjenkins@gmail.com> 

diff --git drivers/acpi/power_meter.c drivers/acpi/power_meter.c
index 2ef7030..18ce00a 100644
--- drivers/acpi/power_meter.c
+++ drivers/acpi/power_meter.c
@@ -534,6 +534,7 @@ static void remove_domain_devices(struct acpi_power_meter_resource *resource)
 
 	kfree(resource->domain_devices);
 	kobject_put(resource->holders_dir);
+	resource->num_domain_devices = 0;
 }
 
 static int read_domain_devices(struct acpi_power_meter_resource *resource)
@@ -740,7 +741,6 @@ skip_unsafe_cap:
 
 	return res;
 error:
-	remove_domain_devices(resource);
 	remove_attrs(resource);
 	return res;
 }


