From: Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
Date: Wed, 14 Mar 2018 21:22:07 +0000
Subject: Re: [PATCH] powerpc: Use common error handling code in setup_new_fdt()
Message-Id: <87fu52jqtc.fsf@morokweng.localdomain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0dd9d938-8d89-f0e0-f05f-9a3e5dc42a57@users.sourceforge.net>
In-Reply-To: <0dd9d938-8d89-f0e0-f05f-9a3e5dc42a57@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linuxppc-dev@lists.ozlabs.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Borislav Petkov <bp@suse.de>, Brijesh Singh <brijesh.singh@amd.com>, Josh Sklar <sklar@linux.vnet.ibm.com>, Kees Cook <keescook@chromium.org>, Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>, Tom Lendacky <thomas.lendacky@amd.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org


SF Markus Elfring <elfring@users.sourceforge.net> writes:

> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Sun, 11 Mar 2018 09:03:42 +0100
>
> Add a jump target so that a bit of exception handling can be better reused
> at the end of this function.
>
> This issue was detected by using the Coccinelle software.
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  arch/powerpc/kernel/machine_kexec_file_64.c | 28 ++++++++++++----------------
>  1 file changed, 12 insertions(+), 16 deletions(-)

I liked it. Thanks!

Reviewed-by: Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>

-- 
Thiago Jung Bauermann
IBM Linux Technology Center

