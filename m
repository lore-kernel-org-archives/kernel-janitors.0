From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 03 Jan 2013 11:10:40 +0000
Subject: Re: [PATCH RESEND 6/6] clk: s5p-g2d: Fix incorrect usage of IS_ERR_OR_NULL
Message-Id: <20130103111040.GD7247@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1355852048-23188-1-git-send-email-linux@prisktech.co.nz>
 <1355852048-23188-7-git-send-email-linux@prisktech.co.nz>
 <50D62BC9.9010706@mvista.com> <50E32C06.5020104@gmail.com>
 <CA+_b7DK2zbBzbCh15ikEAeGP5h-V9gQ_YcX15O-RNvWxCk8Zfg@mail.gmail.com>
 <1357104713.30504.8.camel@gitbox> <20130103090520.GC7247@mwanda>
 <20130103100000.GJ2631@n2100.arm.linux.org.uk>
In-Reply-To: <20130103100000.GJ2631@n2100.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-arm-kernel@lists.infradead.org

Come on...  Don't say we haven't read comment.  Obviously, the first
thing we did was read that comment.  I've read it many times at this
point and I still think we should add in a bit which says:

"NOTE:  Drivers should treat the return value as an opaque cookie
and not dereference it.  NULL returns don't imply an error so don't
use IS_ERR_OR_NULL() to check for errors."

regards,
dan carpenter
