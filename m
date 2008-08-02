From: David Woodhouse <dwmw2@infradead.org>
Date: Sat, 02 Aug 2008 17:45:43 +0000
Subject: Re: [PATCH 6/10] drivers/mtd: Use DIV_ROUND_UP
Message-Id: <1217699143.3719.58.camel@shinybook.infradead.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0808021713580.20095@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0808021713580.20095@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

On Sat, 2008-08-02 at 17:14 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> The kernel.h macro DIV_ROUND_UP performs the computation (((n) + (d) -
> 1) / (d)) but is perhaps more readable.

Applied; thanks.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation

