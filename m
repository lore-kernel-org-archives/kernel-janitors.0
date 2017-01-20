From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 18:23:59 +0000
Subject: [PATCH 05/11] KVM: PPC: Book3S HV: Adjust nine checks for null pointers
Message-Id: <161c8660-d204-5190-9bda-c5a801abe0ab@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <fc2c36e6-a453-ae09-89bf-98b3d74113a4@users.sourceforge.net>
In-Reply-To: <fc2c36e6-a453-ae09-89bf-98b3d74113a4@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Alexander Graf <agraf@suse.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Ellerman <mpe@ellerman.id.au>, Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Fri, 20 Jan 2017 11:25:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The script "checkpatch.pl" pointed information out like the following.

Comparison to NULL could be written =E2=80=A6

Thus fix affected source code places.

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
---
 arch/powerpc/kvm/book3s_hv.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index cfc7699d05df..3122998f6a32 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -458,7 +458,7 @@ static unsigned long do_h_register_vpa(struct kvm_vcpu =
*vcpu,
=20
 		/* convert logical addr to kernel addr and read length */
 		va =3D kvmppc_pin_guest_page(kvm, vpa, &nb);
-		if (va =3D NULL)
+		if (!va)
 			return H_PARAMETER;
 		if (subfunc =3D H_VPA_REG_VPA)
 			len =3D be16_to_cpu(((struct reg_vpa *)va)->length.hword);
@@ -1591,8 +1591,7 @@ static struct kvmppc_vcore *kvmppc_vcore_create(struc=
t kvm *kvm, int core)
 	struct kvmppc_vcore *vcore;
=20
 	vcore =3D kzalloc(sizeof(struct kvmppc_vcore), GFP_KERNEL);
-
-	if (vcore =3D NULL)
+	if (!vcore)
 		return NULL;
=20
 	spin_lock_init(&vcore->lock);
@@ -2221,7 +2220,7 @@ static void collect_piggybacks(struct core_info *cip,=
 int target_threads)
 		prepare_threads(pvc);
 		if (!pvc->n_runnable) {
 			list_del_init(&pvc->preempt_list);
-			if (pvc->runner =3D NULL) {
+			if (!pvc->runner) {
 				pvc->vcore_state =3D VCORE_INACTIVE;
 				kvmppc_core_end_stolen(pvc);
 			}
@@ -2287,7 +2286,7 @@ static void post_guest_process(struct kvmppc_vcore *v=
c, bool is_master)
 		} else {
 			vc->vcore_state =3D VCORE_INACTIVE;
 		}
-		if (vc->n_runnable > 0 && vc->runner =3D NULL) {
+		if (vc->n_runnable > 0 && !vc->runner) {
 			/* make sure there's a candidate runner awake */
 			i =3D -1;
 			vcpu =3D next_runnable_thread(vc, &i);
@@ -2786,7 +2785,7 @@ static int kvmppc_run_vcpu(struct kvm_run *kvm_run, s=
truct kvm_vcpu *vcpu)
=20
 	while (vcpu->arch.state =3D KVMPPC_VCPU_RUNNABLE &&
 	       !signal_pending(current)) {
-		if (vc->vcore_state =3D VCORE_PREEMPT && vc->runner =3D NULL)
+		if (vc->vcore_state =3D VCORE_PREEMPT && !vc->runner)
 			kvmppc_vcore_end_preempt(vc);
=20
 		if (vc->vcore_state !=3D VCORE_INACTIVE) {
@@ -2833,7 +2832,7 @@ static int kvmppc_run_vcpu(struct kvm_run *kvm_run, s=
truct kvm_vcpu *vcpu)
 		vc->vcore_state =3D VCORE_PIGGYBACK))
 		kvmppc_wait_for_exec(vc, vcpu, TASK_UNINTERRUPTIBLE);
=20
-	if (vc->vcore_state =3D VCORE_PREEMPT && vc->runner =3D NULL)
+	if (vc->vcore_state =3D VCORE_PREEMPT && !vc->runner)
 		kvmppc_vcore_end_preempt(vc);
=20
 	if (vcpu->arch.state =3D KVMPPC_VCPU_RUNNABLE) {
@@ -3203,7 +3202,7 @@ void kvmppc_alloc_host_rm_ops(void)
 	int size;
=20
 	/* Not the first time here ? */
-	if (kvmppc_host_rm_ops_hv !=3D NULL)
+	if (kvmppc_host_rm_ops_hv)
 		return;
=20
 	ops =3D kzalloc(sizeof(struct kvmppc_host_rm_ops), GFP_KERNEL);
@@ -3430,10 +3429,10 @@ static int kvmppc_set_passthru_irq(struct kvm *kvm,=
 int host_irq, int guest_gsi)
 	mutex_lock(&kvm->lock);
=20
 	pimap =3D kvm->arch.pimap;
-	if (pimap =3D NULL) {
+	if (!pimap) {
 		/* First call, allocate structure to hold IRQ map */
 		pimap =3D kvmppc_alloc_pimap();
-		if (pimap =3D NULL) {
+		if (!pimap) {
 			mutex_unlock(&kvm->lock);
 			return -ENOMEM;
 		}
--=20
2.11.0

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
