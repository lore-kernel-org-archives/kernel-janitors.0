From: Julia Lawall <julia@diku.dk>
Date: Tue, 09 Nov 2010 07:10:29 +0000
Subject: Re: [PATCH 6/14] arch/mips/pmc-sierra/yosemite/setup.c: delete double
Message-Id: <Pine.LNX.4.64.1011090809480.25928@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
 <1288088743-3725-7-git-send-email-julia@diku.dk> <20101109004808.GA10116@linux-mips.org>
In-Reply-To: <20101109004808.GA10116@linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ralf Baechle <ralf@linux-mips.org>
Cc: kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

On Tue, 9 Nov 2010, Ralf Baechle wrote:

> On Tue, Oct 26, 2010 at 12:25:35PM +0200, Julia Lawall wrote:
> > From: Julia Lawall <julia@diku.dk>
> > 
> > Delete successive assignments to the same location.
> 
> [...]
> 
> > This change also makes the variable cpu_clock_freq be not used in the
> > current file.  If this is the correct change to plat_time_init, then
> > perhaps the declaration of that variable should be moved elsewhere, or the
> > variable should be deleted completely.
> 
> The 2nd assignment is a temporary override for debugging purpose that is
> it's there intionsionally.

OK, thanks.  I indeed suspected that, but I thought it might be worthwhile 
to mention it, in case it had outlived its usefulness.

julia
