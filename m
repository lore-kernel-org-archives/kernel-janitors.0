From: Vasiliy Kulikov <segooon@gmail.com>
Date: Thu, 11 Nov 2010 21:02:51 +0000
Subject: Re: [PATCH] lib: vsprintf: fix invalid arg check
Message-Id: <20101111210251.GA26283@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289421490-23950-1-git-send-email-segooon@gmail.com>
 <20101110130834.02496b48.akpm@linux-foundation.org>
 <alpine.DEB.2.00.1011101335410.7756@chino.kir.corp.google.com>
 <20101111083408.GA3471@albatros>
 <alpine.DEB.2.00.1011111224161.25829@chino.kir.corp.google.com>
In-Reply-To: <alpine.DEB.2.00.1011111224161.25829@chino.kir.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Rientjes <rientjes@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org, =?iso-8859-1?Q?Andr=E9?= Goddard Rosa <andre.goddard@gmail.com>, Joe Perches <joe@perches.com>, Frederic Weisbecker <fweisbec@gmail.com>, Bjorn Helgaas <bjorn.helgaas@hp.com>, linux-kernel@vger.kernel.org

On Thu, Nov 11, 2010 at 12:38 -0800, David Rientjes wrote:
> On Thu, 11 Nov 2010, Vasiliy Kulikov wrote:
> 
> > > > > "size" is size_t.  If we want to check whether it was underflowed
> > > > > then we should cast it to ssize_t instead of int.  When
> > > > > sizeof(size_t) > sizeof(int) the code sees UINT_MAX as underflow,
> > > > > but it is not.
> > > > > 
> > > > 
> > > > Does this patch fix any actual observed problem?
> > 
> > I don't think so, this fix is more theoretical than practical.
> > However, maybe there is some crazy driver that fills array of 2GB with
> > s*printf().
> > 
> 
> All sizes passed to vsprintf() greater than INT_MAX are invalid; that's 
> what the original code is testing, warning, and handling correctly.

Not always correctly:

(int)(0xFFFFFFFFL + 2) = 1 is positive.

> No, it shouldn't, these functions return int.  INT_MAX is the largest 
> value we can handle successfully and that's why it is the special case for 
> sprintf() and vsprintf().
> 
> The code as it stands is correct not because of the type of the size but 
> rather the type of the return value.

OK, if the main reason here is return value type, then the correct
handling should be:

	/* Reject out-of-range values early.  Large positive sizes are
	   used for unknown buffer sizes. */
-	if (WARN_ON_ONCE((int) size < 0))
+	if (WARN_ON_ONCE(size > INT_MAX)
		return 0;

This should catch all underflows and too big integers.

-- 
Vasiliy
