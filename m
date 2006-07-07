From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Fri, 07 Jul 2006 13:41:26 +0000
Subject: Re: [KJ] [Kj] [PATCH] drivers/acpi/cm_sbs.c: if statement moved
Message-Id: <9a8748490607070641o5859d2b2hadedff0fdd351cb5@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <8ef77f2e0607070606y4367b47fw5cc3b195b5fe21a@mail.gmail.com>
In-Reply-To: <8ef77f2e0607070606y4367b47fw5cc3b195b5fe21a@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 07/07/06, Jesper Juhl <jesper.juhl@gmail.com> wrote:
> 6) As a general rule, don't mix unrelated changes in the same patch -
> send multiple patches instead (like in this patch you are mixing
> whitespace changes and code changes).

Ehh, I meant comment changes (and actually created an error at the
same time), not whitespace changes. whoops.

Always test your changes before submitting patches.
At a minimum make sure they compile without errors or warnings on at
least one architecture (more if possible - cross-compilers are
helpful).
Booting a kernel with the patch applied is also always a nice thing to
have done, even for simple changes.
If you can think of more ways to test your changes, then do so.

When sending in the patch, outline what testing you have done (a
simple line like "compile and boot tested on x86" or similar is
enough). If you have done no testing at all, then let people know that
as well.


-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
