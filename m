From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Mon, 13 Aug 2007 10:42:35 +0000
Subject: Re: [PATCH 4 of 5 ] /drivers/char/rio ioremap balancing/ returncode
Message-Id: <20070813114235.1a2f6484@the-village.bc.nu>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070813040530.9E0E9DA82E@mailserver8.hushmail.com>
In-Reply-To: <20070813040530.9E0E9DA82E@mailserver8.hushmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: postfail@hushmail.com
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, dri-devel@lists.sourceforge.net

On Mon, 13 Aug 2007 00:05:30 -0400
"Scott Thompson" <postfail@hushmail.com> wrote:

> patchset against 2.6.23-rc2 and this set is an audit of 
> /drivers/char/a* 
> through drivers/char .   
> 
> this corrects missing ioremap return checks and balancing on 
> iounmap calls..

Your mail client has wrapped the patches. Please resend without wrapping
