From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Sat, 07 Apr 2007 09:44:07 +0000
Subject: Re: [KJ] how about a "NO-OP" macro or something?
Message-Id: <82faac5b0704070244ua38b7b3u850b707e953f4876@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0704060702440.26640@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0704060702440.26640@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 4/7/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
> i wasn't suggesting getting rid of the "do { } while (0)" construct.
> i was suggesting creating a macro to represent it, like:
>
>   #define NO_OP do { } while (0)
>
> and using "NO_OP" instead of spelling out the "do" construct in full.
> it's not only shorter, but it's clearer and, down the road, who knows
> if someone will want to redefine NO_OP to be something better?
>
> as i said, it's probably too late to do anything about the *current*
> usage, but perhaps future code can start taking advantage of this.

I would suggest that the real solution would be to use a MISRA type
coding standard. (which isn't going to happen)  So implementing
another 'non optimal' solution would not be a good use of developer
time.

Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
