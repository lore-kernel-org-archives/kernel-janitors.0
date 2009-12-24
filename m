From: Ralf Baechle <ralf@linux-mips.org>
Date: Thu, 24 Dec 2009 13:22:57 +0000
Subject: Re: [PATCH 1/9] arch/mips/alchemy: Correct code taking the size of a
Message-Id: <20091224132257.GA29598@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912131240100.24267@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912131240100.24267@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Dec 13, 2009 at 12:40:39PM +0100, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> sizeof(dp) is just the size of the pointer.  Change it to the size of the
> referenced structure.

Thanks Julia, applied.

  Ralf
