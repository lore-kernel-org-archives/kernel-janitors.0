From: Joe Damato <ice799@gmail.com>
Date: Sat, 25 Oct 2008 03:15:27 +0000
Subject: [PATCH 07/12] x86: Add a static initializer for IDTs
Message-Id: <4d0ab6d642a4edc3ecc7367df7043ecc8f0a7f98.1224903712.git.ice799@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <>
 <1224904532-9586-1-git-send-email-ice799@gmail.com>
 <52f8491fb5d55c0171840b01638ea6db0a98f3be.1224903712.git.ice799@gmail.com>
 <03269a2e8f455b431612a32e8cce048e98c75b27.1224903712.git.ice799@gmail.com>
 <4810cc08c12cd78612b53f9b52d7ba93a9b03fd0.1224903712.git.ice799@gmail.com>
 <a9cabc5cabdb5a10631e2a6dc330c54826f2b210.1224903712.git.ice799@gmail.com>
 <a4c806abcf7a46c78aaff4e338fdbc1a06a56c88.1224903712.git.ice799@gmail.com>
 <8834ad1ab5a5ab9b4902ab708160b23f078f3758.1224903712.git.ice799@gmail.com>
In-Reply-To: <8834ad1ab5a5ab9b4902ab708160b23f078f3758.1224903712.git.ice799@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-x86_64@vger.kernel.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joe Damato <ice799@gmail.com>

Add static intializer for IDT entries.

Signed-off-by: Joe Damato <ice799@gmail.com>
---
 include/asm-x86/desc_defs.h |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/include/asm-x86/desc_defs.h b/include/asm-x86/desc_defs.h
index d6a5310..a1c6516 100644
--- a/include/asm-x86/desc_defs.h
+++ b/include/asm-x86/desc_defs.h
@@ -82,6 +82,15 @@ typedef struct desc_struct tss_desc;
 #define ldttss_offset(d)	(((d).base2 << 24 ) | ((d).base1 << 16) |\
 				 ((d).base0 & 0x0000ffff))
 #define ldttss_limit(d)		((d).limit0)
+#define __IDT_INITIALIZER(lo,hi) \
+                { .base0 = lo & 0xffff \
+                , .seg_sel = (lo >> 16) & 0xffff \
+                , .reserved = 0 \
+                , .type = (hi >> 8) & 0xf \
+                , .zero = 0 \
+                , .dpl = (hi >> 13) & 3 \
+                , .p   = (hi >> 15) & 1 \
+                , .base1 = (hi >> 16) & 0xffff }
 #endif
 
 struct desc_ptr {
-- 
1.5.4.3

