From: Ralf Baechle <ralf@linux-mips.org>
Date: Mon, 26 Jul 2010 14:04:17 +0000
Subject: Re: [PATCH 03/11] arch/mips/kernel/smtc.c: formatting of pointers in
Message-Id: <20100726140417.GA12084@linux-mips.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1279130502-10777-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1279130502-10777-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: kernel-janitors@vger.kernel.org, Chris Dearman <chris@mips.com>, "Robert P. J. Day" <rpjday@crashcourse.ca>, Rusty Russell <rusty@rustcorp.com.au>, =?iso-8859-1?Q?Andr=E9?= Goddard Rosa <andre.goddard@gmail.com>, linux-mips@linux-mips.org, linux-kernel@vger.kernel.org

On Wed, Jul 14, 2010 at 10:01:42PM +0400, Kulikov Vasiliy wrote:

> Use %p instead of %08x in printk().

Queued for 2.6.36, thanks!

Yes, %p is prefered here.  But your log message doesn't mention that your
patch also does a functional change, it drops the 0x prefix of the printed
value ...

  Ralf
