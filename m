From: Colin King <colin.king@canonical.com>
Date: Thu, 29 Jun 2017 09:14:06 +0000
Subject: [PATCH] perf/x86/intel: constify array lbr_desc and make a function static
Message-Id: <20170629091406.9870-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Peter Zijlstra <peterz@infradead.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

A few minor clean-ups: constify array lbr_desc and make local
function lbr_from_signext_quirk_rd static to fix sparse warning:

"symbol 'lbr_from_signext_quirk_rd' was not declared. Should it be static?"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/events/intel/lbr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/events/intel/lbr.c b/arch/x86/events/intel/lbr.c
index f924629836a8..eb261656a320 100644
--- a/arch/x86/events/intel/lbr.c
+++ b/arch/x86/events/intel/lbr.c
@@ -18,7 +18,7 @@ enum {
 	LBR_FORMAT_MAX_KNOWN    = LBR_FORMAT_TIME,
 };
 
-static enum {
+static const enum {
 	LBR_EIP_FLAGS		= 1,
 	LBR_TSX			= 2,
 } lbr_desc[LBR_FORMAT_MAX_KNOWN + 1] = {
@@ -287,7 +287,7 @@ inline u64 lbr_from_signext_quirk_wr(u64 val)
 /*
  * If quirk is needed, ensure sign extension is 61 bits:
  */
-u64 lbr_from_signext_quirk_rd(u64 val)
+static u64 lbr_from_signext_quirk_rd(u64 val)
 {
 	if (static_branch_unlikely(&lbr_from_quirk_key)) {
 		/*
-- 
2.11.0

