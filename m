From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Sat, 08 Sep 2012 19:58:43 +0000
Subject: Re: [signal:master 62/63] arch/m68k/kernel/entry.S:115: Error: operands mismatch -- statement `movem
Message-Id: <20120908195843.GA26908@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120908135733.GA25549@localhost>
In-Reply-To: <20120908135733.GA25549@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Sep 08, 2012 at 06:48:02PM +0100, Al Viro wrote:

> > https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/4.6.3/x86_64-gcc-4.6.3-nolibc_m68k-linux.tar.xz
> 
> Ho-hum...
> ; strings as |grep Binutils
> (GNU Binutils) 2.22
> ;
> 
> So it's 2.22...  2.20 definitely accepts both variants of syntax.

So does debian build of binutils-2.22, for that matter...
