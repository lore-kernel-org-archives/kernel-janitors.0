From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Tue, 19 Sep 2006 21:31:35 +0000
Subject: Re: [KJ] [PATCH] add KERN_* constants to printk()'s in pty.c and
Message-Id: <9a8748490609191431ga2ffd4bheedf1c54b70d3ef5@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200609191426.k8JEQonV000566@smtp.osdl.org>
In-Reply-To: <200609191426.k8JEQonV000566@smtp.osdl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 19/09/06, steve@lonetwin.net <steve@lonetwin.net> wrote:
> Hi all,
>
> This is my first patch. This is more of a 'get-submission-right' type of patch.
> So please do comment on the patch submission style even if this patch has already
> been submitted (although a hurried search through the list archives does not seem
> to suggest this).
>
> - steve
>

You should generally always have a small (or long) note saying what
the patch does as well as why it makes the change.  It goes in the
commit message for later reference.

You should usually also specify what sort of testing the patch has
seen. Like, "compile tested only", "compiled on arch x, y, z and boot
tested on x & y" or "compile and boot tested on i386 and further
tested by doing <whatever>" - you get the picture...

> ---
>
> Signed-off-by: Steven Fernandez <steve@lonetwin.net>
>
> ---
>

a "diffstat -p1 -w70" at this point is usually appreciated.


This is a good read: http://www.zip.com.au/~akpm/linux/patches/stuff/tpp.txt
Documentation/SubmittingPatches is also a good read.


-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
