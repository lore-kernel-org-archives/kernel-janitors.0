From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 31 Dec 2016 22:00:09 +0000
Subject: [PATCH 2/6] staging: vchiq_arm: Adjust 13 checks for null pointers
Message-Id: <2b11ef55-9123-3d0e-fb04-dca8cc3b5081@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <5acd65e7-0b5d-0972-5e1a-6e87d71dc1a4@users.sourceforge.net>
In-Reply-To: <5acd65e7-0b5d-0972-5e1a-6e87d71dc1a4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: linux-arm-kernel@lists.infradead.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 31 Dec 2016 21:23:24 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written =E2=80=A6

Thus fix the affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 .../vc04_services/interface/vchiq_arm/vchiq_arm.c  | 34 ++++++++++--------=
----
 1 file changed, 16 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c =
b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 4af77d790ae0..2a260034189d 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -533,7 +533,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsign=
ed long arg)
 		/* Remove all services */
 		i =3D 0;
 		while ((service =3D next_service_by_instance(instance->state,
-			instance, &i)) !=3D NULL) {
+							   instance, &i))) {
 			status =3D vchiq_remove_service(service->handle);
 			unlock_service(service);
 			if (status !=3D VCHIQ_SUCCESS)
@@ -614,7 +614,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsign=
ed long arg)
 				&args.params, srvstate,
 				instance, user_service_free);
=20
-		if (service !=3D NULL) {
+		if (service) {
 			user_service->service =3D service;
 			user_service->userdata =3D userdata;
 			user_service->instance =3D instance;
@@ -661,7 +661,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsign=
ed long arg)
 		VCHIQ_SERVICE_HANDLE_T handle =3D (VCHIQ_SERVICE_HANDLE_T)arg;
=20
 		service =3D find_service_for_instance(instance, handle);
-		if (service !=3D NULL) {
+		if (service) {
 			USER_SERVICE_T *user_service  				(USER_SERVICE_T *)service->base.userd=
ata;
 			/* close_pending is false on first entry, and when the
@@ -687,7 +687,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsign=
ed long arg)
 		VCHIQ_SERVICE_HANDLE_T handle =3D (VCHIQ_SERVICE_HANDLE_T)arg;
=20
 		service =3D find_service_for_instance(instance, handle);
-		if (service !=3D NULL) {
+		if (service) {
 			USER_SERVICE_T *user_service  				(USER_SERVICE_T *)service->base.userd=
ata;
 			/* close_pending is false on first entry, and when the
@@ -714,7 +714,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsign=
ed long arg)
 		VCHIQ_SERVICE_HANDLE_T handle =3D (VCHIQ_SERVICE_HANDLE_T)arg;
=20
 		service =3D find_service_for_instance(instance, handle);
-		if (service !=3D NULL) {
+		if (service) {
 			status =3D (cmd =3D VCHIQ_IOC_USE_SERVICE)	?
 				vchiq_use_service_internal(service) :
 				vchiq_release_service_internal(service);
@@ -747,7 +747,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsign=
ed long arg)
=20
 		service =3D find_service_for_instance(instance, args.handle);
=20
-		if ((service !=3D NULL) && (args.count <=3D MAX_ELEMENTS)) {
+		if (service && (args.count <=3D MAX_ELEMENTS)) {
 			/* Copy elements into kernel space */
 			VCHIQ_ELEMENT_T elements[MAX_ELEMENTS];
 			if (copy_from_user(elements, args.elements,
@@ -1063,11 +1063,11 @@ vchiq_ioctl(struct file *file, unsigned int cmd, un=
signed long arg)
 		spin_unlock(&msg_queue_spinlock);
=20
 		up(&user_service->remove_event);
-		if (header =3D NULL)
+		if (!header)
 			ret =3D -ENOTCONN;
 		else if (header->size <=3D args.bufsize) {
 			/* Copy to user space if msgbuf is not NULL */
-			if ((args.buf =3D NULL) ||
+			if (!args.buf ||
 				(copy_to_user((void __user *)args.buf,
 				header->data,
 				header->size) =3D 0)) {
@@ -1161,7 +1161,7 @@ vchiq_ioctl(struct file *file, unsigned int cmd, unsi=
gned long arg)
 		VCHIQ_SERVICE_HANDLE_T handle =3D (VCHIQ_SERVICE_HANDLE_T)arg;
=20
 		service =3D find_closed_service_for_instance(instance, handle);
-		if (service !=3D NULL) {
+		if (service) {
 			USER_SERVICE_T *user_service  				(USER_SERVICE_T *)service->base.userd=
ata;
 			close_delivered(user_service);
@@ -1559,7 +1559,7 @@ dump_phys_mem(void *virt_addr, uint32_t num_bytes)
=20
 	num_pages =3D (offset + num_bytes + PAGE_SIZE - 1) / PAGE_SIZE;
 	pages =3D kmalloc_array(num_pages, sizeof(*pages), GFP_KERNEL);
-	if (pages =3D NULL) {
+	if (!pages) {
 		vchiq_log_error(vchiq_arm_log_level,
 			"Unable to allocation memory for %d pages\n",
 			num_pages);
@@ -1590,8 +1590,7 @@ dump_phys_mem(void *virt_addr, uint32_t num_bytes)
 		page_idx =3D offset / PAGE_SIZE;
=20
 		if (page_idx !=3D prev_idx) {
-
-			if (page !=3D NULL)
+			if (page)
 				kunmap(page);
 			page =3D pages[page_idx];
 			kmapped_virt_ptr =3D kmap(page);
@@ -1609,7 +1608,7 @@ dump_phys_mem(void *virt_addr, uint32_t num_bytes)
 	}
=20
 out:
-	if (page !=3D NULL)
+	if (page)
 		kunmap(page);
=20
 	for (page_idx =3D 0; page_idx < num_pages; page_idx++)
@@ -1644,14 +1643,13 @@ vchiq_read(struct file *file, char __user *buf,
 VCHIQ_STATE_T *
 vchiq_get_state(void)
 {
-
-	if (g_state.remote =3D NULL)
+	if (!g_state.remote)
 		printk(KERN_ERR "%s: g_state.remote =3D NULL\n", __func__);
 	else if (g_state.remote->initialised !=3D 1)
 		printk(KERN_NOTICE "%s: g_state.remote->initialised !=3D 1 (%d)\n",
 			__func__, g_state.remote->initialised);
=20
-	return ((g_state.remote !=3D NULL) &&
+	return (g_state.remote &&
 		(g_state.remote->initialised =3D 1)) ? &g_state : NULL;
 }
=20
@@ -2655,7 +2653,7 @@ vchiq_instance_get_use_count(VCHIQ_INSTANCE_T instanc=
e)
 	int use_count =3D 0, i;
 	i =3D 0;
 	while ((service =3D next_service_by_instance(instance->state,
-		instance, &i)) !=3D NULL) {
+						   instance, &i))) {
 		use_count +=3D service->service_use_count;
 		unlock_service(service);
 	}
@@ -2681,7 +2679,7 @@ vchiq_instance_set_trace(VCHIQ_INSTANCE_T instance, i=
nt trace)
 	int i;
 	i =3D 0;
 	while ((service =3D next_service_by_instance(instance->state,
-		instance, &i)) !=3D NULL) {
+						   instance, &i))) {
 		service->trace =3D trace;
 		unlock_service(service);
 	}
--=20
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
