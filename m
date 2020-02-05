From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 05 Feb 2020 12:32:17 +0000
Subject: [PATCH] staging: greybus: use after free in gb_audio_manager_remove_all()
Message-Id: <20200205123217.jreendkyxulqsool@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>, Dinko Mironov <dmironov@mm-sol.com>
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>, kernel-janitors@vger.kernel.org, Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org, Greg Kroah-Hartman <gregkh@google.com>

When we call kobject_put() and it's the last reference to the kobject
then it calls gb_audio_module_release() and frees module.  We dereference
"module" on the next line which is a use after free.

Fixes: c77f85bbc91a ("greybus: audio: Fix incorrect counting of 'ida'")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/staging/greybus/audio_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
index 9b19ea9d3fa1..9a3f7c034ab4 100644
--- a/drivers/staging/greybus/audio_manager.c
+++ b/drivers/staging/greybus/audio_manager.c
@@ -92,8 +92,8 @@ void gb_audio_manager_remove_all(void)
 
 	list_for_each_entry_safe(module, next, &modules_list, list) {
 		list_del(&module->list);
-		kobject_put(&module->kobj);
 		ida_simple_remove(&module_id, module->id);
+		kobject_put(&module->kobj);
 	}
 
 	is_empty = list_empty(&modules_list);
-- 
2.11.0
