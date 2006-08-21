From: ville palo <ville.palo@vi64pa.net>
Date: Mon, 21 Aug 2006 17:28:40 +0000
Subject: [KJ] [PATCH] Unhandled return values in acpi/video.c
Message-Id: <1156181320.10063.8.camel@localhost.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Is there any particular reason not to care about return values of
the acpi_remove_notify_handler()? If there is some reason, 
status variable is declared for nothing. If there aren't any reasons,
this patch should solve the issue.

Signed-off-by: Ville Palo <ville.palo@vi64pa.net>

diff --git a/drivers/acpi/video.c b/drivers/acpi/video.c
index 56666a9..c55123a 100644
--- a/drivers/acpi/video.c
+++ b/drivers/acpi/video.c
@@ -1569,7 +1569,7 @@ static int acpi_video_bus_put_one_device
                                            ACPI_DEVICE_NOTIFY,
                                            acpi_video_device_notify);
 
-       return 0;
+       return status;
 }
 
 static int acpi_video_bus_put_devices(struct acpi_video_bus *video)
@@ -1771,7 +1771,7 @@ static int acpi_video_bus_remove(struct 
        kfree(video->attached_array);
        kfree(video);
 
-       return 0;
+       return status;
 }
 
 static int

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
