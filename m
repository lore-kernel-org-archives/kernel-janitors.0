From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Tue, 13 Mar 2007 13:18:20 +0000
Subject: Re: [KJ] how to generate a multi-part patch?
Message-Id: <9a8748490703130618w656acc80o749b9008eebe80d2@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0703130343080.10772@CPE00045a9c397f-CM001225dbafb6>
In-Reply-To: <Pine.LNX.4.64.0703130343080.10772@CPE00045a9c397f-CM001225dbafb6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 13/03/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
>
>   what's the canonical way to generate a multi-part patch?  that is,
> starting from "PATCH [0/n]" and so on.  a list of bullet points will
> do fine, i can take it from there.
>
>   from what i read, i'd use quilt to generate the patch set, then
> "git-send-email"?  is that it?  thanks.
>
Low tech approach, but this usually works for me:

 1) Figure out the things I want to change and come up with a logical order.
 2) Make the first change and generate a diff, make next change, make
new diff etc.
 3) Start up email client, read in patch file inline, write text and
subject with PATCH [1/n], send
 4) Repeat step 3 until no more patches.

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
