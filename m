From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 26 May 2005 21:07:36 +0000
Subject: Re: [KJ] [PATCH] Fix gcc4 warning,
Message-Id: <200505262307.37233.arnd@arndb.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <428E3224.8030307@cs.pdx.edu>
In-Reply-To: <428E3224.8030307@cs.pdx.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Middeweken 25 Mai 2005 21:18, Jesse Millan wrote:
> Your right, it could go either way. Arnd Bergmann had posted earlier and
> said that it would be better to make the change in the function itself.
> I took that advice.

I think what Mark was suggesting is to initialize the parameters at the
start of the inner function (asn1_length_decode), which makes perfect
sense to me, at least in this particular case.

What you should not do is initialize it in the calling function, because
then you defeat gcc's ability to warn you about real uninitialized uses
of the local variables in that function.

	Arnd <><
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
