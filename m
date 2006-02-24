From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Fri, 24 Feb 2006 21:58:30 +0000
Subject: Re: [KJ] [PATCH] check request_region return value
Message-Id: <9a8748490602241358r3b1f5e6an448ecf5d40932a5a@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200602242249.22568.tim@aapopfiets.nl>
In-Reply-To: <200602242249.22568.tim@aapopfiets.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/24/06, Tim Cooijmans <tim@aapopfiets.nl> wrote:
> From: Tim Cooijmans <tim@aapopfiets.nl>
>
> Check request_region return value in arch/powerpc/platform/chrp/setup.c.
> Passed compilation.
>

Looks OK to me, but couldn't this be improved by changing the function
to return an int stating if things are OK or not and then having
caller check the return value and act appropriately?


--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
