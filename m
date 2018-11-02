From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 02 Nov 2018 18:33:55 +0000
Subject: [PATCH 4.18 073/150] x86/paravirt: Fix some warning messages
Message-Id: <20181102182908.682563548@linuxfoundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20181102182902.250560510@linuxfoundation.org>
In-Reply-To: <20181102182902.250560510@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, Juergen Gross <jgross@suse.com>, Peter Zijlstra <peterz@infradead.org>, Alok Kataria <akataria@vmware.com>, "H. Peter Anvin" <hpa@zytor.com>, virtualization@lists.linux-foundation.org, kernel-janitors@vger.kernel.org, Sasha Levin <sashal@kernel.org>

4.18-stable review patch.  If anyone has any objections, please let me know.

------------------

[ Upstream commit 571d0563c8881595f4ab027aef9ed1c55e3e7b7c ]

The first argument to WARN_ONCE() is a condition.

Fixes: 5800dc5c19f3 ("x86/paravirt: Fix spectre-v2 mitigations for paravirt guests")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Juergen Gross <jgross@suse.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Alok Kataria <akataria@vmware.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: virtualization@lists.linux-foundation.org
Cc: kernel-janitors@vger.kernel.org
Link: https://lkml.kernel.org/r/20180919103553.GD9238@mwanda
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/x86/kernel/paravirt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 930c88341e4e..1fbf38dde84c 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -90,7 +90,7 @@ unsigned paravirt_patch_call(void *insnbuf,
 
 	if (len < 5) {
 #ifdef CONFIG_RETPOLINE
-		WARN_ONCE("Failing to patch indirect CALL in %ps\n", (void *)addr);
+		WARN_ONCE(1, "Failing to patch indirect CALL in %ps\n", (void *)addr);
 #endif
 		return len;	/* call too long for patch site */
 	}
@@ -110,7 +110,7 @@ unsigned paravirt_patch_jmp(void *insnbuf, const void *target,
 
 	if (len < 5) {
 #ifdef CONFIG_RETPOLINE
-		WARN_ONCE("Failing to patch indirect JMP in %ps\n", (void *)addr);
+		WARN_ONCE(1, "Failing to patch indirect JMP in %ps\n", (void *)addr);
 #endif
 		return len;	/* call too long for patch site */
 	}
-- 
2.17.1
