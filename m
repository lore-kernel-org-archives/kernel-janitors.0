From: Matthew Wilcox <matthew@wil.cx>
Date: Mon, 09 Feb 2009 01:21:40 +0000
Subject: Re: [PATCH 4/6] drivers/pci: introduce missing kfree
Message-Id: <20090209012140.GJ31509@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0902082244490.25891@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0902082244490.25891@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: jbarnes@virtuousgeek.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Feb 08, 2009 at 10:45:24PM +0100, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Error handling code following a kmalloc should free the allocated data.
> Since the subsequent code that could provoke an error does not use the
> allocated data, the allocation is just moved below it.
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Reviewed-by: Matthew Wilcox <willy@linux.intel.com>

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
