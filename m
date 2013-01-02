From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Date: Wed, 02 Jan 2013 09:28:54 +0000
Subject: Re: [PATCH RESEND 6/6] clk: s5p-g2d: Fix incorrect usage of IS_ERR_OR_NULL
Message-Id: <20130102092854.GC2631@n2100.arm.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355852048-23188-1-git-send-email-linux@prisktech.co.nz>
 <1355852048-23188-7-git-send-email-linux@prisktech.co.nz>
 <50D62BC9.9010706@mvista.com> <50E32C06.5020104@gmail.com>
 <CA+_b7DK2zbBzbCh15ikEAeGP5h-V9gQ_YcX15O-RNvWxCk8Zfg@mail.gmail.com>
 <1357104713.30504.8.camel@gitbox>
 <alpine.DEB.2.02.1301020827040.2241@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1301020827040.2241@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

On Wed, Jan 02, 2013 at 08:29:57AM +0100, Julia Lawall wrote:
> There are dereferences to the result of clk_get a few times.  I tried the 
> following semantic patch:

And those are buggy; struct clk is _SUPPOSED_ to be an OPAQUE COOKIE
and no one other than the clk code should be dereferencing it.

I guess this is the danger of the common clk API - we now have a struct
clk that is exposed in a linux/*.h include which anyone can include, and
now anyone can get a definition for a struct clk and dereference it,
destroying opaqueness of this cookie.
