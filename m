From: Colin King <colin.king@canonical.com>
Date: Mon, 03 Jul 2017 14:22:58 +0000
Subject: [PATCH] x86/platform/uv/BAU: minor cleanup, make some local functions static
Message-Id: <20170703142258.18240-1-colin.king@canonical.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Andrew Banman <abanman@hpe.com>, Mike Travis <mike.travis@hpe.com>, Dimitri Sivanich <sivanich@sgi.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

Functions normal_busy, handle_uv2_busy, uv_flush_send_and_wait and
find_another_by_swack are local to the source, so make them static

Fixes various smatch warnings, such as:
"symbol 'find_another_by_swack' was not declared. Should it be static?"
"symbol 'handle_uv2_busy' was not declared. Should it be static?"

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/x86/platform/uv/tlb_uv.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
index 2983faab5b18..730b47dce402 100644
--- a/arch/x86/platform/uv/tlb_uv.c
+++ b/arch/x86/platform/uv/tlb_uv.c
@@ -595,7 +595,7 @@ static unsigned long uv2_3_read_status(unsigned long offset, int rshft, int desc
  * The bit provided by the activation_status_2 register is irrelevant to
  * the status if it is only being tested for busy or not busy.
  */
-int normal_busy(struct bau_control *bcp)
+static int normal_busy(struct bau_control *bcp)
 {
 	int cpu = bcp->uvhub_cpu;
 	int mmr_offset;
@@ -612,7 +612,7 @@ int normal_busy(struct bau_control *bcp)
  * of a hardware bug.
  * Workaround the bug.
  */
-int handle_uv2_busy(struct bau_control *bcp)
+static int handle_uv2_busy(struct bau_control *bcp)
 {
 	struct ptc_stats *stat = bcp->statp;
 
@@ -917,7 +917,8 @@ static void handle_cmplt(int completion_status, struct bau_desc *bau_desc,
  * Returns 1 if it gives up entirely and the original cpu mask is to be
  * returned to the kernel.
  */
-int uv_flush_send_and_wait(struct cpumask *flush_mask, struct bau_control *bcp,
+static int uv_flush_send_and_wait(struct cpumask *flush_mask,
+	struct bau_control *bcp,
 	struct bau_desc *bau_desc)
 {
 	int seq_number = 0;
@@ -1212,8 +1213,8 @@ const struct cpumask *uv_flush_tlb_others(const struct cpumask *cpumask,
  * Search the message queue for any 'other' unprocessed message with the
  * same software acknowledge resource bit vector as the 'msg' message.
  */
-struct bau_pq_entry *find_another_by_swack(struct bau_pq_entry *msg,
-					   struct bau_control *bcp)
+static struct bau_pq_entry *find_another_by_swack(struct bau_pq_entry *msg,
+						  struct bau_control *bcp)
 {
 	struct bau_pq_entry *msg_next = msg + 1;
 	unsigned char swack_vec = msg->swack_vec;
-- 
2.11.0

