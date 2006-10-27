From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Fri, 27 Oct 2006 09:36:59 +0000
Subject: Re: [KJ] using git to pull linux tree for only one architecture.
Message-Id: <9a8748490610270236s6ff45b59ncece36cab7966425@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 27/10/06, Amit Choudhary <amit2030@yahoo.com> wrote:
> Hi All,
>
> I was just wondering if I could use git to pull the linux tree for only one architecture, say,
> only for i386.
>
I don't believe that's possible. The source tree is not split that
neatly.  For example, parts of x86 and x86-64 include files from
eachother and other parts of the tree has similar cases.

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
