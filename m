From: Joe Damato <ice799@gmail.com>
Date: Sat, 25 Oct 2008 03:15:28 +0000
Subject: [PATCH 08/12] x86: Use static intializer for IDT entries
Message-Id: <c53b3a54b3215187055dfe5673e1351d1bd3957a.1224903712.git.ice799@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <>
 <1224904532-9586-1-git-send-email-ice799@gmail.com>
 <52f8491fb5d55c0171840b01638ea6db0a98f3be.1224903712.git.ice799@gmail.com>
 <03269a2e8f455b431612a32e8cce048e98c75b27.1224903712.git.ice799@gmail.com>
 <4810cc08c12cd78612b53f9b52d7ba93a9b03fd0.1224903712.git.ice799@gmail.com>
 <a9cabc5cabdb5a10631e2a6dc330c54826f2b210.1224903712.git.ice799@gmail.com>
 <a4c806abcf7a46c78aaff4e338fdbc1a06a56c88.1224903712.git.ice799@gmail.com>
 <8834ad1ab5a5ab9b4902ab708160b23f078f3758.1224903712.git.ice799@gmail.com>
 <4d0ab6d642a4edc3ecc7367df7043ecc8f0a7f98.1224903712.git.ice799@gmail.com>
In-Reply-To: <4d0ab6d642a4edc3ecc7367df7043ecc8f0a7f98.1224903712.git.ice799@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-x86_64@vger.kernel.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joe Damato <ice799@gmail.com>

Use static intializer for IDT entries.

Signed-off-by: Joe Damato <ice799@gmail.com>
---
 arch/x86/kernel/traps.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
index e062974..b308d71 100644
--- a/arch/x86/kernel/traps.c
+++ b/arch/x86/kernel/traps.c
@@ -86,7 +86,7 @@ char ignore_fpu_irq;
  * for this.
  */
 gate_desc idt_table[256]
-	__attribute__((__section__(".data.idt"))) = { { { { 0, 0 } } }, };
+	__attribute__((__section__(".data.idt"))) = { __IDT_INITIALIZER(0, 0) };
 #endif
 
 static int ignore_nmis;
-- 
1.5.4.3

