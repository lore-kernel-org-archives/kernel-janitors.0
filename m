From: Ralf Baechle <ralf@linux-mips.org>
Date: Tue, 09 Nov 2010 00:48:09 +0000
Subject: Re: [PATCH 6/14] arch/mips/pmc-sierra/yosemite/setup.c: delete
Message-Id: <20101109004808.GA10116@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288088743-3725-1-git-send-email-julia@diku.dk>
 <1288088743-3725-7-git-send-email-julia@diku.dk>
In-Reply-To: <1288088743-3725-7-git-send-email-julia@diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

On Tue, Oct 26, 2010 at 12:25:35PM +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Delete successive assignments to the same location.

[...]

> This change also makes the variable cpu_clock_freq be not used in the
> current file.  If this is the correct change to plat_time_init, then
> perhaps the declaration of that variable should be moved elsewhere, or the
> variable should be deleted completely.

The 2nd assignment is a temporary override for debugging purpose that is
it's there intionsionally.

Thanks!

  Ralf
