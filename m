From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Mon, 22 Jan 2007 16:35:58 +0000
Subject: Re: [KJ] Replacing check_region with request_region
Message-Id: <9a8748490701220835x60c49c57w5e09b331838976bb@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1169477126.3554.18.camel@wriver-t81fb058.linuxcoe>
In-Reply-To: <1169477126.3554.18.camel@wriver-t81fb058.linuxcoe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 22/01/07, Vignesh Babu BM <vignesh.babu@wipro.com> wrote:
> Hi,
>   I found the following instances of check_region in the 2.6.20-rc5
> code.
>   I also found that these files also have request_region in some parts.
> So I was just wondering if they were left there for some reason....but
> as part of the deprecated API they have to be removed at some point of
> time right?
>   If they need to be changed then I would go ahead and make a patch.
> Thanks...
>
Yes, check region needs to go away. But there is no rush, most of the
remaining users are in rarely used drivers and are usually used in
ways where the problematic race is very unlikely.

Just be sure you handle errors and properly release regions when the
driver is done with them etc...

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
