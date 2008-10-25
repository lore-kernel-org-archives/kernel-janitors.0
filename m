From: Joe Damato <ice799@gmail.com>
Date: Sat, 25 Oct 2008 03:15:26 +0000
Subject: [PATCH 06/12] x86: Refactor pack_descriptor
Message-Id: <8834ad1ab5a5ab9b4902ab708160b23f078f3758.1224903712.git.ice799@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <>
 <1224904532-9586-1-git-send-email-ice799@gmail.com>
 <52f8491fb5d55c0171840b01638ea6db0a98f3be.1224903712.git.ice799@gmail.com>
 <03269a2e8f455b431612a32e8cce048e98c75b27.1224903712.git.ice799@gmail.com>
 <4810cc08c12cd78612b53f9b52d7ba93a9b03fd0.1224903712.git.ice799@gmail.com>
 <a9cabc5cabdb5a10631e2a6dc330c54826f2b210.1224903712.git.ice799@gmail.com>
 <a4c806abcf7a46c78aaff4e338fdbc1a06a56c88.1224903712.git.ice799@gmail.com>
In-Reply-To: <a4c806abcf7a46c78aaff4e338fdbc1a06a56c88.1224903712.git.ice799@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-x86_64@vger.kernel.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joe Damato <ice799@gmail.com>

Refactor pack_descriptor to use fields in the struct instead of bitmasks

Signed-off-by: Joe Damato <ice799@gmail.com>
---
 include/asm-x86/desc.h |   18 +++++++++++++-----
 1 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/include/asm-x86/desc.h b/include/asm-x86/desc.h
index 6b4f3e6..ac9aad5 100644
--- a/include/asm-x86/desc.h
+++ b/include/asm-x86/desc.h
@@ -151,11 +151,19 @@ static inline void pack_descriptor(struct desc_struct *desc, unsigned long base,
 				   unsigned long limit, unsigned char type,
 				   unsigned char flags)
 {
-	desc->a = ((base & 0xffff) << 16) | (limit & 0xffff);
-	desc->b = (base & 0xff000000) | ((base & 0xff0000) >> 16) |
-		(limit & 0x000f0000) | ((type & 0xff) << 8) |
-		((flags & 0xf) << 20);
-	desc->p = 1;
+	desc->limit0 = limit & 0xffff;
+	desc->base0  = base  & 0xffff;
+	desc->base1  = (base  >> 16) & 0xff;
+	desc->base2  = (base  >> 24) & 0xff;
+	desc->type   = type;
+	desc->s      = 0;
+	desc->dpl    = 0;
+	desc->p      = 1;
+	desc->limit  = (limit >> 16) & 0xf;
+	desc->avl    = flags & 0x1;
+	desc->l      = (flags & 0x2) >> 1;
+	desc->d      = (flags & 0x4) >> 2;
+	desc->g      = (flags & 0x8) >> 3;
 }
 
 
-- 
1.5.4.3

