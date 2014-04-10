From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 10 Apr 2014 09:45:45 +0000
Subject: [patch 2/2] Staging: unisys: use after free in list_for_each()
Message-Id: <20140410094545.GB5839@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

These should be using the _safe version of list_for_each() because we
free the current element and it leads to a use after free bug.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/staging/unisys/visorchipset/visorchipset.h b/drivers/staging/unisys/visorchipset/visorchipset.h
index d4bf203..d95825d 100644
--- a/drivers/staging/unisys/visorchipset/visorchipset.h
+++ b/drivers/staging/unisys/visorchipset/visorchipset.h
@@ -104,9 +104,9 @@ finddevice(struct list_head *list, U32 busNo, U32 devNo)
 
 static inline void delbusdevices(struct list_head *list, U32 busNo)
 {
-	VISORCHIPSET_DEVICE_INFO *p;
+	VISORCHIPSET_DEVICE_INFO *p, *tmp;
 
-	list_for_each_entry(p, list, entry) {
+	list_for_each_entry_safe(p, tmp, list, entry) {
 		if (p->busNo = busNo) {
 			list_del(&p->entry);
 			kfree(p);
diff --git a/drivers/staging/unisys/visorchipset/visorchipset_main.c b/drivers/staging/unisys/visorchipset/visorchipset_main.c
index 257c6e5..c475e25 100644
--- a/drivers/staging/unisys/visorchipset/visorchipset_main.c
+++ b/drivers/staging/unisys/visorchipset/visorchipset_main.c
@@ -605,16 +605,16 @@ EXPORT_SYMBOL_GPL(visorchipset_register_busdev_client);
 static void
 cleanup_controlvm_structures(void)
 {
-	VISORCHIPSET_BUS_INFO *bi;
-	VISORCHIPSET_DEVICE_INFO *di;
+	VISORCHIPSET_BUS_INFO *bi, *tmp_bi;
+	VISORCHIPSET_DEVICE_INFO *di, *tmp_di;
 
-	list_for_each_entry(bi, &BusInfoList, entry) {
+	list_for_each_entry_safe(bi, tmp_bi, &BusInfoList, entry) {
 		busInfo_clear(bi);
 		list_del(&bi->entry);
 		kfree(bi);
 	}
 
-	list_for_each_entry(di, &DevInfoList, entry) {
+	list_for_each_entry_safe(di, tmp_di, &DevInfoList, entry) {
 		devInfo_clear(di);
 		list_del(&di->entry);
 		kfree(di);
