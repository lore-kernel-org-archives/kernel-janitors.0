From: Arnaldo Carvalho de Melo <acme@conectiva.com.br>
Date: Sat, 28 Feb 2004 04:07:27 +0000
Subject: Re: [Kernel-janitors] serial.c cli() patch
Message-Id: <200402280107.27354.acme@conectiva.com.br>
List-Id: <kernel-janitors.vger.kernel.org>
References: <403D1CC3.6080906@chello.nl>
In-Reply-To: <403D1CC3.6080906@chello.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Thursday 26 February 2004 21:32, Zach Brown wrote:
> > So if I lock data I should use a lock for every single data variable
> > which is at risk for a race condition. If I use a global one like I did
> > here then all data structures are locked at once, which is not very good
> > in a SMP system since an other processor could access an other data
> > structure which now is also locked by the global lock.
> > Am I right here?
>
> Yeah, you have the idea.  It's always a trade-off between complexity and
> concurrency.  It's good practice to only go down the complexity road
> when it has been proven that concurrency is strongly desired.
>
> I'm pretty sure that's why Matthew questioned the patch :)  Code changes
> are always risky, and simple replacing cli with _irqsave spinlocks
> doesn't increase the concurrency and I strongly suspect that no one has
> shown that concurrency matters in these crufty old paths.
>
> - z
> (too wordy?  I'm new here.)

With contributions like this, I sure don't mind that you were that wordy.

Next more don't feel so constrained, free your mouth, we need this people
like you to help the nephytes hordes!

Like in CNN: "Don't go away, stay with us" :-)

- Arnaldo
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors
