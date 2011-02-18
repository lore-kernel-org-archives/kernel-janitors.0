From: Dan Carpenter <error27@gmail.com>
Date: Fri, 18 Feb 2011 09:17:16 +0000
Subject: [patch -next] x86, microcode, AMD: signedness bug in
Message-Id: <20110218091716.GA4384@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andreas Herrmann <andreas.herrmann3@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <borislav.petkov@amd.com>, "maintainer:X86 ARCHITECTURE..." <x86@kernel.org>, "open list:AMD MICROCODE UPD..." <amd64-microcode@amd64.org>, open list <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

install_equiv_cpu_table() returns type int.  It uses negative error
codes so using an unsigned type breaks the error handling.

Signed-off-by: Dan Carpenter <error27@gmail.com>

diff --git a/arch/x86/kernel/microcode_amd.c b/arch/x86/kernel/microcode_amd.c
index 9fb8405..c561038 100644
--- a/arch/x86/kernel/microcode_amd.c
+++ b/arch/x86/kernel/microcode_amd.c
@@ -246,7 +246,7 @@ generic_load_microcode(int cpu, const u8 *data, size_t size)
 	struct ucode_cpu_info *uci = ucode_cpu_info + cpu;
 	struct microcode_header_amd *mc_hdr = NULL;
 	unsigned int mc_size, leftover;
-	unsigned long offset;
+	int offset;
 	const u8 *ucode_ptr = data;
 	void *new_mc = NULL;
 	unsigned int new_rev = uci->cpu_sig.rev;
