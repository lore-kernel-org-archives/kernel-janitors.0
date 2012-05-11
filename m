From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 11 May 2012 06:23:55 +0000
Subject: Re: [PATCH] kgbd: clear compilation warning
Message-Id: <20120511062355.GX22134@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1336709620-19351-1-git-send-email-trbecker@trbecker.org>
In-Reply-To: <1336709620-19351-1-git-send-email-trbecker@trbecker.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thiago Rafael Becker <trbecker@trbecker.org>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, a.p.zijlstra@chello.nl, jason.wessel@windriver.com, jan.kiszka@siemens.com, dhowells@redhat.com

On Fri, May 11, 2012 at 01:13:40AM -0300, Thiago Rafael Becker wrote:
> In the function kgbd_arch_set_breakpoint, the variable is only used
> if DEBUG_RODATA is configured. This clears the following compilation
> warning:
> 
> arch/x86/kernel/kgdb.c:749:7: warning: unused variable 'opc'
> 

This doesn't work.  Now there is a "warning: mixing declarations and
code" warning message for people who have CONFIG_DEBUG_RODATA
turned on.

I sent one of these yesterday where I did:

	if (!config_enabled(CONFIG_DEBUG_RODATA))
		return err;

But test it both ways and do a make arch/x86/kernel/kgdb.i and
make sure the code looks ok.

regards,
dan carpenter

