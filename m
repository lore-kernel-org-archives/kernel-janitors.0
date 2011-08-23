From: Timur Tabi <timur@freescale.com>
Date: Tue, 23 Aug 2011 18:38:10 +0000
Subject: Re: [PATCH 8/9] arch/powerpc/sysdev/ehv_pic.c: add missing kfree
Message-Id: <4E53F392.1080702@freescale.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1312802283-9107-8-git-send-email-julia@diku.dk>
In-Reply-To: <1312802283-9107-8-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org

Julia Lawall wrote:
> At this point, ehv_pic has been allocated but not stored anywhere, so it
> should be freed before leaving the function.

Acked-by: Timur Tabi <timur@freescale.com>

FYI, Ashish is no longer with Freescale, so I've taken over maintainership of
ehv_pic.

-- 
Timur Tabi
Linux kernel developer at Freescale

