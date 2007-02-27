From: burns.ethan@gmail.com
Date: Tue, 27 Feb 2007 16:12:00 +0000
Subject: Re: [KJ] [PATCH] 3c505.c: replacing strcpy to strncpy
Message-Id: <20070227161200.GA11696@bender.eaburns.mooo.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20070225173528.GB3595@localhost.localdomain>
In-Reply-To: <20070225173528.GB3595@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 27, 2007 at 10:03:25AM +0100, Standard Azi wrote:
> char buf[150];
>
> strcpy(buf, "LALA");
>
> that's one reason, for example

char buf[150] = "LALA";

and if you really need to do it outside of initialization, does the strncpy()
really hurt it?  What if the size of `buf' gets changed, then we would have to
go check for all strcpy()s and make sure that they are still valid, where
strncpy would do it by default.

	--Ethan
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
