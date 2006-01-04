From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Wed, 04 Jan 2006 17:14:48 +0000
Subject: Re: [KJ] [PATCH] mm: Clean up local variables
Message-Id: <9a8748490601040914l1a7beb58k65da55ed348627c5@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20060104170119.GB1243@neon.tklauser.home>
In-Reply-To: <20060104170119.GB1243@neon.tklauser.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 1/4/06, Tobias Klauser <tklauser@nuerscht.ch> wrote:
> Clean up local variables with the same name as a variable in a larger
> block. See http://linuxicc.sourceforge.net/Remark_1599.html for details.
>
If you want to find a lot more of these, then add -Wshadow to the gcc
options in your kernels Makefile.

I tried submitting a patch that cleaned up a few to "test the waters"
as to making the kernel -Wshadow clean, but the patch had a mixed
reception. Good luck though, personally I'd like to see us be able to
add -Wshadow to the standard build flags - we just have to clean it
all up first and getting the patches merged looks like it could
possibly be difficult.

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
