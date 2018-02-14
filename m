From: Joe Perches <joe@perches.com>
Date: Wed, 14 Feb 2018 07:21:47 +0000
Subject: Re: [PATCH] x86/spectre: fix an error message
Message-Id: <1518592907.25974.2.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180214071416.GA26677@mwanda>
In-Reply-To: <20180214071416.GA26677@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Ingo Molnar <mingo@redhat.com>, KarimAllah Ahmed <karahmed@amazon.de>
Cc: "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Thomas Gleixner <tglx@linutronix.de>, David Woodhouse <dwmw@amazon.co.uk>, Borislav Petkov <bp@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andy Lutomirski <luto@kernel.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2018-02-14 at 10:14 +0300, Dan Carpenter wrote:
> If i = ARRAY_SIZE(mitigation_options) then we accidentally print
> garbage from one space beyond the end of the mitigation_options[] array.
> 
> Fixes: 9005c6834c0f ("x86/spectre: Simplify spectre_v2 command line parsing")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
> index debcdda88560..acee4ebec04f 100644
> --- a/arch/x86/kernel/cpu/bugs.c
> +++ b/arch/x86/kernel/cpu/bugs.c
> @@ -174,7 +174,7 @@ static enum spectre_v2_mitigation_cmd __init spectre_v2_parse_cmdline(void)
>  		}
>  
>  		if (i >= ARRAY_SIZE(mitigation_options)) {
> -			pr_err("unknown option (%s). Switching to AUTO select\n", mitigation_options[i].option);
> +			pr_err("unknown option (%s). Switching to AUTO select\n", arg);
>  			return SPECTRE_V2_CMD_AUTO;
>  		}
>  	}

Should probably unindent this block too by
removing the else after the return

---
 arch/x86/kernel/cpu/bugs.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 4acf16a76d1e..0af8245afb6c 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -161,22 +161,21 @@ static enum spectre_v2_mitigation_cmd __init spectre_v2_parse_cmdline(void)
 
 	if (cmdline_find_option_bool(boot_command_line, "nospectre_v2"))
 		return SPECTRE_V2_CMD_NONE;
-	else {
-		ret = cmdline_find_option(boot_command_line, "spectre_v2", arg, sizeof(arg));
-		if (ret < 0)
-			return SPECTRE_V2_CMD_AUTO;
-
-		for (i = 0; i < ARRAY_SIZE(mitigation_options); i++) {
-			if (!match_option(arg, ret, mitigation_options[i].option))
-				continue;
-			cmd = mitigation_options[i].cmd;
-			break;
-		}
 
-		if (i >= ARRAY_SIZE(mitigation_options)) {
-			pr_err("unknown option (%s). Switching to AUTO select\n", mitigation_options[i].option);
-			return SPECTRE_V2_CMD_AUTO;
-		}
+	ret = cmdline_find_option(boot_command_line, "spectre_v2", arg, sizeof(arg));
+	if (ret < 0)
+		return SPECTRE_V2_CMD_AUTO;
+
+	for (i = 0; i < ARRAY_SIZE(mitigation_options); i++) {
+		if (!match_option(arg, ret, mitigation_options[i].option))
+			continue;
+		cmd = mitigation_options[i].cmd;
+		break;
+	}
+
+	if (i >= ARRAY_SIZE(mitigation_options)) {
+		pr_err("unknown option (%s). Switching to AUTO select\n", arg);
+		return SPECTRE_V2_CMD_AUTO;
 	}
 
 	if ((cmd = SPECTRE_V2_CMD_RETPOLINE ||


