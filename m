From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 06 Dec 2006 14:13:04 +0000
Subject: Re: [KJ] what is best: memcpy or for
Message-Id: <20061206141303.GT3013@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <80ec54e90612052335v3688faedj6c64f979d420c078@mail.gmail.com>
In-Reply-To: <80ec54e90612052335v3688faedj6c64f979d420c078@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Dec 06, 2006 at 08:35:41AM +0100, Daniel Marjam?ki wrote:
> I am wondering if there is any real difference between "for" and "memcpy"..
> 
>     int i, a[100], b[100];
> 
>     // method 1
>     for (i = 0; i < 100; i++)
>         a[i] = b[i];
> 
>     // method 2
>     memcpy(a, b, sizeof(a));
> 
> Is there any difference in speed?
> 
> With a good compiler, the output should be the same for both methods,
> shouldn't it?

Yes, gcc has idiom-recognising techniques for that.  Possibly not in the
version you're using, though.  In any case, the memcpy() gives gcc more
information (that a and b do not overlap) that it would otherwise have
to deduce for itself (it can normally do this, particularly for the
example you gave).
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
