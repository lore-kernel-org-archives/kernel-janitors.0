From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Wed, 14 Feb 2018 07:14:17 +0000
Subject: [PATCH] x86/spectre: fix an error message
Message-Id: <20180214071416.GA26677@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@redhat.com>, KarimAllah Ahmed <karahmed@amazon.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw@amazon.co.uk>, Borislav Petkov <bp@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Lutomirski <luto@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

If i = ARRAY_SIZE(mitigation_options) then we accidentally print
garbage from one space beyond the end of the mitigation_options[] array.

Fixes: 9005c6834c0f ("x86/spectre: Simplify spectre_v2 command line parsing")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index debcdda88560..acee4ebec04f 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -174,7 +174,7 @@ static enum spectre_v2_mitigation_cmd __init spectre_v2_parse_cmdline(void)
 		}
 
 		if (i >= ARRAY_SIZE(mitigation_options)) {
-			pr_err("unknown option (%s). Switching to AUTO select\n", mitigation_options[i].option);
+			pr_err("unknown option (%s). Switching to AUTO select\n", arg);
 			return SPECTRE_V2_CMD_AUTO;
 		}
 	}
