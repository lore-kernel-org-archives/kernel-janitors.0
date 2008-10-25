From: Joe Damato <ice799@gmail.com>
Date: Sat, 25 Oct 2008 03:15:24 +0000
Subject: [PATCH 04/12] x86: Add macros for gate_desc
Message-Id: <a9cabc5cabdb5a10631e2a6dc330c54826f2b210.1224903712.git.ice799@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <>
 <1224904532-9586-1-git-send-email-ice799@gmail.com>
 <52f8491fb5d55c0171840b01638ea6db0a98f3be.1224903712.git.ice799@gmail.com>
 <03269a2e8f455b431612a32e8cce048e98c75b27.1224903712.git.ice799@gmail.com>
 <4810cc08c12cd78612b53f9b52d7ba93a9b03fd0.1224903712.git.ice799@gmail.com>
In-Reply-To: <4810cc08c12cd78612b53f9b52d7ba93a9b03fd0.1224903712.git.ice799@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-x86_64@vger.kernel.org, linux-newbie@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Joe Damato <ice799@gmail.com>

Add useful macros which can be used to access the lo and hi 32bit words, get the offset of the handler, and get the segment for gate_descs.

Signed-off-by: Joe Damato <ice799@gmail.com>
---
 include/asm-x86/desc_defs.h |    9 +++++++--
 1 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/asm-x86/desc_defs.h b/include/asm-x86/desc_defs.h
index 012df1f..d6a5310 100644
--- a/include/asm-x86/desc_defs.h
+++ b/include/asm-x86/desc_defs.h
@@ -75,8 +75,13 @@ typedef struct ldttss_desc64 tss_desc;
 typedef struct gate_struct gate_desc;
 typedef struct desc_struct ldt_desc;
 typedef struct desc_struct tss_desc;
-#define gate_offset(g)		(((g).b & 0xffff0000) | ((g).a & 0x0000ffff))
-#define gate_segment(g)		((g).a >> 16)
+#define desc_lo(d)		(((u32 *)&d)[0])
+#define desc_hi(d)		(((u32 *)&d)[1])
+#define gate_offset(g)		(((g).base1 << 16) | ((g).base0 & 0x0000ffff))
+#define gate_segment(g)		((g).seg_sel >> 16)
+#define ldttss_offset(d)	(((d).base2 << 24 ) | ((d).base1 << 16) |\
+				 ((d).base0 & 0x0000ffff))
+#define ldttss_limit(d)		((d).limit0)
 #endif
 
 struct desc_ptr {
-- 
1.5.4.3

