From: Dan Carpenter <error27@gmail.com>
Date: Fri, 12 Nov 2010 05:04:43 +0000
Subject: [patch] Staging: quickstart: free after input_unregister_device()
Message-Id: <20101112050443.GD3533@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

input_unregister_device() releases "quickstart_input" so the
input_free_device() is a double free.  Also I noticed that there is a
memory leak if the call to input_register_device() fails.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/drivers/staging/quickstart/quickstart.c b/drivers/staging/quickstart/quickstart.c
index d746715..d83bec8 100644
--- a/drivers/staging/quickstart/quickstart.c
+++ b/drivers/staging/quickstart/quickstart.c
@@ -355,7 +355,6 @@ static int quickstart_acpi_remove(struct acpi_device *device, int type)
 static void quickstart_exit(void)
 {
 	input_unregister_device(quickstart_input);
-	input_free_device(quickstart_input);
 
 	device_remove_file(&pf_device->dev, &dev_attr_pressed_button);
 	device_remove_file(&pf_device->dev, &dev_attr_buttons);
@@ -375,6 +374,7 @@ static int __init quickstart_init_input(void)
 {
 	struct quickstart_btn **ptr = &quickstart_data.btn_lst;
 	int count;
+	int ret;
 
 	quickstart_input = input_allocate_device();
 
@@ -391,7 +391,13 @@ static int __init quickstart_init_input(void)
 		ptr = &((*ptr)->next);
 	}
 
-	return input_register_device(quickstart_input);
+	ret = input_register_device(quickstart_input);
+	if (ret) {
+		input_free_device(quickstart_input);
+		return ret;
+	}
+
+	return 0;
 }
 
 static int __init quickstart_init(void)
