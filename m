From: Tony Lindgren <tony@atomide.com>
Date: Thu, 26 Jan 2012 23:59:22 +0000
Subject: Re: [PATCH 6/9] arch/arm/mach-omap2/devices.c: introduce missing kfree
Message-Id: <20120126235922.GE29812@atomide.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324661974-17281-6-git-send-email-julia@diku.dk>
In-Reply-To: <1324661974-17281-6-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

* Julia Lawall <julia@diku.dk> [111223 09:07]:
> pdata needs to be freed before leaving the function in an error case.

Thanks applying into fixes.

Tony
