From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Wed, 03 Jan 2007 12:09:51 +0000
Subject: Re: [KJ] a question about the patch application cycle
Message-Id: <9a8748490701030409h2b654898l6a43a9ad990960e4@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0701030634470.30039@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0701030634470.30039@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 03/01/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
>   am i correct in assuming that, once the -rc cycle starts for the
> kernel, only critical patches are applied, and non-critical (ie.,
> cleanup) patches are held over until the new release?

That's more or less what usually, mostly, happens.  There are no hard
rules written in stone, but the intention is that new stuff be merged
before -rc1 and from then on it's stabilization time.  What happens in
real life is often close to that but not always.

> which suggests
> that, once 2.6.20 comes out, there would normally be a flurry of those
> cleanup patches applied to start the next cycle?

That's quite common, yes.

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
