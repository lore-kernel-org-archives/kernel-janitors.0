From: Hannes Eder <hannes@hanneseder.net>
Date: Fri, 28 Nov 2008 16:02:06 +0000
Subject: [PATCH] KVM: VMX: fix sparse warning
Message-Id: <49304b16.0ab6660a.0d69.ffff9a04@mx.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Avi Kivity <avi@redhat.com>
Cc: kvm@vger.kernel.org

Impact: make global function static

  arch/x86/kvm/vmx.c:134:3: warning: symbol 'vmx_capability' was not declared. Should it be static?

Signed-off-by: Hannes Eder <hannes@hanneseder.net>
---
 arch/x86/kvm/vmx.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kvm/vmx.c b/arch/x86/kvm/vmx.c
index 7ea4855..e446f23 100644
--- a/arch/x86/kvm/vmx.c
+++ b/arch/x86/kvm/vmx.c
@@ -128,7 +128,7 @@ static struct vmcs_config {
 	u32 vmentry_ctrl;
 } vmcs_config;
 
-struct vmx_capability {
+static struct vmx_capability {
 	u32 ept;
 	u32 vpid;
 } vmx_capability;
-- 
1.5.6.3

