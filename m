From: Julia Lawall <julia@diku.dk>
Date: Sun, 30 May 2010 20:28:14 +0000
Subject: [PATCH 3/3] arch/s390/kvm: Use GFP_ATOMIC when a lock is held
Message-Id: <Pine.LNX.4.64.1005302227470.19253@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carsten Otte <cotte@de.ibm.com>, Christian Borntraeger <borntraeger@de.ibm.com>, linux390@de.ibm.com, Avi Kivity <avi@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Martin

From: Julia Lawall <julia@diku.dk>

The containing function is called from several places.  At one of them, in
the function __sigp_stop, the spin lock &fi->lock is held.

The semantic patch that makes this change is as follows:
(http://coccinelle.lip6.fr/)

// <smpl>
@gfp exists@
identifier fn;
position p;
@@

fn(...) {
... when != spin_unlock
    when any
  GFP_KERNEL@p
 ... when any
}

@locked@
identifier gfp.fn;
@@

spin_lock(...)
... when != spin_unlock
fn(...)

@depends on locked@
position gfp.p;
@@

- GFP_KERNEL@p
+ GFP_ATOMIC
// </smpl>

Signed-off-by: Julia Lawall <julia@diku.dk>

---
 arch/s390/kvm/sigp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -u -p a/arch/s390/kvm/sigp.c b/arch/s390/kvm/sigp.c
--- a/arch/s390/kvm/sigp.c
+++ b/arch/s390/kvm/sigp.c
@@ -113,7 +113,7 @@ static int __inject_sigp_stop(struct kvm
 {
 	struct kvm_s390_interrupt_info *inti;
 
-	inti = kzalloc(sizeof(*inti), GFP_KERNEL);
+	inti = kzalloc(sizeof(*inti), GFP_ATOMIC);
 	if (!inti)
 		return -ENOMEM;
 	inti->type = KVM_S390_SIGP_STOP;
