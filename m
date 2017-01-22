From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 18:18:10 +0000
Subject: [PATCH 8/9] KVM: Adjust seven checks for null pointers
Message-Id: <d6a66841-b6f4-f888-51e8-f1ad124874ab@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
In-Reply-To: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sun, 22 Jan 2017 18:54:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written =E2=80=A6

Thus fix affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 virt/kvm/kvm_main.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ca88f3620ee3..4267a2c6f2aa 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -184,7 +184,7 @@ bool kvm_make_all_cpus_request(struct kvm *kvm, unsigne=
d int req)
 		/* Set ->requests bit before we read ->mode. */
 		smp_mb__after_atomic();
=20
-		if (cpus !=3D NULL && cpu !=3D -1 && cpu !=3D me &&
+		if (cpus && cpu !=3D -1 && cpu !=3D me &&
 		      kvm_vcpu_exiting_guest_mode(vcpu) !=3D OUTSIDE_GUEST_MODE)
 			cpumask_set_cpu(cpu, cpus);
 	}
@@ -1532,10 +1532,9 @@ static kvm_pfn_t hva_to_pfn(unsigned long addr, bool=
 atomic, bool *async,
=20
 retry:
 	vma =3D find_vma_intersection(current->mm, addr, addr + 1);
-
-	if (vma =3D NULL)
+	if (!vma) {
 		pfn =3D KVM_PFN_ERR_FAULT;
-	else if (vma->vm_flags & (VM_IO | VM_PFNMAP)) {
+	} else if (vma->vm_flags & (VM_IO | VM_PFNMAP)) {
 		r =3D hva_to_pfn_remapped(vma, addr, async, write_fault, &pfn);
 		if (r =3D -EAGAIN)
 			goto retry;
@@ -2835,7 +2834,7 @@ int kvm_register_device_ops(struct kvm_device_ops *op=
s, u32 type)
 	if (type >=3D ARRAY_SIZE(kvm_device_ops_table))
 		return -ENOSPC;
=20
-	if (kvm_device_ops_table[type] !=3D NULL)
+	if (kvm_device_ops_table[type])
 		return -EEXIST;
=20
 	kvm_device_ops_table[type] =3D ops;
@@ -2844,7 +2843,7 @@ int kvm_register_device_ops(struct kvm_device_ops *op=
s, u32 type)
=20
 void kvm_unregister_device_ops(u32 type)
 {
-	if (kvm_device_ops_table[type] !=3D NULL)
+	if (kvm_device_ops_table[type])
 		kvm_device_ops_table[type] =3D NULL;
 }
=20
@@ -2860,7 +2859,7 @@ static int kvm_ioctl_create_device(struct kvm *kvm,
 		return -ENODEV;
=20
 	ops =3D kvm_device_ops_table[cd->type];
-	if (ops =3D NULL)
+	if (!ops)
 		return -ENODEV;
=20
 	if (test)
@@ -3392,7 +3391,7 @@ static int kvm_io_bus_get_first_dev(struct kvm_io_bus=
 *bus,
=20
 	range =3D bsearch(&key, bus->range, bus->dev_count,
 			sizeof(struct kvm_io_range), kvm_io_bus_sort_cmp);
-	if (range =3D NULL)
+	if (!range)
 		return -ENOENT;
=20
 	off =3D range - bus->range;
@@ -3803,7 +3802,7 @@ static int kvm_init_debug(void)
 	struct kvm_stats_debugfs_item *p;
=20
 	kvm_debugfs_dir =3D debugfs_create_dir("kvm", NULL);
-	if (kvm_debugfs_dir =3D NULL)
+	if (!kvm_debugfs_dir)
 		goto out;
=20
 	kvm_debugfs_num_entries =3D 0;
--=20
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
