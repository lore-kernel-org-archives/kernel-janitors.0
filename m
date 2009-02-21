From: Hannes Eder <hannes@hanneseder.net>
Date: Sat, 21 Feb 2009 01:18:13 +0000
Subject: [PATCH 1/2] KVM: fix sparse warnings: context imbalance
Message-Id: <20090221011806.7022.88651.stgit@vmbox.hanneseder.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20090221011723.7022.97639.stgit@vmbox.hanneseder.net>
In-Reply-To: <20090221011723.7022.97639.stgit@vmbox.hanneseder.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Avi Kivity <avi@redhat.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Impact: Attribute function with __acquires(...) resp. __releases(...).

Fix this sparse warnings:
  arch/x86/kvm/i8259.c:34:13: warning: context imbalance in 'pic_lock' - wrong count at exit
  arch/x86/kvm/i8259.c:39:13: warning: context imbalance in 'pic_unlock' - unexpected unlock

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 arch/x86/kvm/i8259.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/x86/kvm/i8259.c b/arch/x86/kvm/i8259.c
index 9316037..a095415 100644
--- a/arch/x86/kvm/i8259.c
+++ b/arch/x86/kvm/i8259.c
@@ -32,11 +32,13 @@
 #include <linux/kvm_host.h>
 
 static void pic_lock(struct kvm_pic *s)
+	__acquires(&s->lock)
 {
 	spin_lock(&s->lock);
 }
 
 static void pic_unlock(struct kvm_pic *s)
+	__releases(&s->lock)
 {
 	struct kvm *kvm = s->kvm;
 	unsigned acks = s->pending_acks;

