From: Dan Carpenter <error27@gmail.com>
Date: Sat, 05 Jun 2010 21:19:43 +0000
Subject: Re: [PATCH] APIC: Remove unused variable
Message-Id: <20100605211943.GN5483@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1275771369-15113-1-git-send-email-richard@nod.at>
In-Reply-To: <1275771369-15113-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Weinberger <richard@nod.at>
Cc: tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, rakib.mullick@gmail.com, ebiederm@xmission.com, gorcunov@openvz.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, Jun 05, 2010 at 10:56:09PM +0200, Richard Weinberger wrote:
> base is never used in this file.
> 

This is left over from commit 7b20bd5fb9 "x86, irq: Kill 
io_apic_renumber_irq" where we removed the es7000_rename_gsi() function.
Could you remove the comment that went with it as well?

/* 
 * GSI override for ES7000 platforms.
 */

regards,
dan carpenter


