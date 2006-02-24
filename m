From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Fri, 24 Feb 2006 18:59:29 +0000
Subject: Re: [KJ] [Patch] convert drivers/input to kzalloc() usage
Message-Id: <9a8748490602241059g47e66daal94e46d3a98cef863@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1140806922.22903.2.camel@alice>
In-Reply-To: <1140806922.22903.2.camel@alice>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/24/06, Eric Sesterhenn <snakebyte@gmx.de> wrote:
> hi,
>
> this converts drivers/input to kzalloc() usage, and cleans
> up two if blocks in input/mouse/hil_ptr.c
> Compile tested with allyesconfig.
>

Did a quick read of the patch. Looks good to me.

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
