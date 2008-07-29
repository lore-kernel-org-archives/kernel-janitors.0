From: Marcin Slusarz <marcin.slusarz@gmail.com>
Date: Tue, 29 Jul 2008 21:02:57 +0000
Subject: Re: How to fix warning 'control reaches end of non-void function'
Message-Id: <20080729210236.GB30067@joi>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080729191738.GA32506@orion>
In-Reply-To: <20080729191738.GA32506@orion>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Jul 29, 2008 at 11:17:38PM +0400, Alexander Beregalov wrote:
> Hi
> 
> What is it a right way to fix these warnings?
> 
> smth function()
> {
> 	switch (var) {
> 	case one:
> 		return 1;
> 	default:
> 		BUG();
> 	}
> }
> 
> warning: control reaches end of non-void function

If BUG() would be normal function it could be marked as __attribute__((noreturn)).
But it's a macro defined differently depending on architecture and CONFIG_*.
Sometimes it calls panic() which is annotated properly and sometimes it calls
other code....

If you are brave, you could fix all implementations.

Marcin
