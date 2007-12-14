From: Kyle McMartin <kyle@mcmartin.ca>
Date: Fri, 14 Dec 2007 19:33:14 +0000
Subject: Re: [PATCH 2/6] drivers/parisc/ccio-dma.c: clean up remove duplicated headers
Message-Id: <20071214193314.GA11163@fattire.cabal.ca>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1197658610-4558-1-git-send-email-francisco.alecrim@indt.org.br> <1197658610-4558-2-git-send-email-francisco.alecrim@indt.org.br> <1197658610-4558-3-git-send-email-francisco.alecrim@indt.org.br>
In-Reply-To: <1197658610-4558-3-git-send-email-francisco.alecrim@indt.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francisco Alecrim <francisco.alecrim@indt.org.br>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, dbrownell@users.sourceforge.net, kyle@parisc-linux.org, dmitry.torokhov@gmail.com, hcegtvedt@atmel.com

On Fri, Dec 14, 2007 at 02:56:46PM -0400, Francisco Alecrim wrote:
> Remove duplicated headers in drivers/parisc/ccio-dma.c:
> drivers/parisc/ccio-dma.c: linux/proc_fs.h is included more than once.
> 

Seems kind of pointless, but I'll apply it.

cheers, Kyle
