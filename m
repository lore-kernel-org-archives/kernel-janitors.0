From: Mariusz Kozlowski <m.kozlowski@tuxland.pl>
Date: Wed, 26 Mar 2008 00:43:00 +0000
Subject: Re: useless variable initializations
Message-Id: <200803260143.00157.m.kozlowski@tuxland.pl>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0803250951380.22289@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0803250951380.22289@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello,

> Is there any policy about useless variable intializations, such as:
> 
> struct foo *x = NULL;
> ...
> x = kmalloc(...);
> 
> where the original value of x is never used?

Once upon a time I send a few patches regarding this issue and they
were accepted although -02 flag makes both versions be the same
in the end. I'd say it is a cleanup. As you said useless variable
initializations are misleading. Methinks it decreases code readability
as well.

	Mariusz
