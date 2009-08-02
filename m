From: Ralf Baechle <ralf@linux-mips.org>
Date: Sun, 02 Aug 2009 18:41:05 +0000
Subject: Re: [PATCH 10/15] arch/mips: Use DIV_ROUND_CLOSEST
Message-Id: <20090802184024.GB9058@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908021047480.15557@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908021047480.15557@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-mips@linux-mips.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Aug 02, 2009 at 10:48:08AM +0200, Julia Lawall wrote:

> 
> From: Julia Lawall <julia@diku.dk>
> 
> The kernel.h macro DIV_ROUND_CLOSEST performs the computation (x + d/2)/d
> but is perhaps more readable.

Applied.  Thanks Julia!

  Ralf
