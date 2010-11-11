From: David Rientjes <rientjes@google.com>
Date: Thu, 11 Nov 2010 21:34:05 +0000
Subject: Re: [PATCH] lib: vsprintf: fix invalid arg check
Message-Id: <alpine.DEB.2.00.1011111319110.25829@chino.kir.corp.google.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289421490-23950-1-git-send-email-segooon@gmail.com> <20101110130834.02496b48.akpm@linux-foundation.org> <alpine.DEB.2.00.1011101335410.7756@chino.kir.corp.google.com> <20101111083408.GA3471@albatros> <alpine.DEB.2.00.1011111224161.25829@chino.kir.corp.google.com>
 <20101111210251.GA26283@albatros>
In-Reply-To: <20101111210251.GA26283@albatros>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vasiliy Kulikov <segooon@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel-janitors@vger.kernel.org, =?UTF-8?Q?Andr=C3=A9_Goddard_Rosa?= <andre.goddard@gmail.com>, Joe Perches <joe@perches.com>, Frederic Weisbecker <fweisbec@gmail.com>, Bjorn Helgaas <bjorn.helgaas@hp.com>, linux-kernel@vger.kernel.org

On Fri, 12 Nov 2010, Vasiliy Kulikov wrote:

> OK, if the main reason here is return value type, then the correct
> handling should be:
> 
> 	/* Reject out-of-range values early.  Large positive sizes are
> 	   used for unknown buffer sizes. */
> -	if (WARN_ON_ONCE((int) size < 0))
> +	if (WARN_ON_ONCE(size > INT_MAX)
> 		return 0;
> 
> This should catch all underflows and too big integers.
> 

That is equivalent since size_t is always unsigned; if you'd like to 
change it, it should be presented only as a style change.  More important 
would be writing a less cryptic comment :)
