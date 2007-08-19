From: "Jesper Juhl" <jesper.juhl@gmail.com>
Date: Sun, 19 Aug 2007 22:19:44 +0000
Subject: Re: convert #include "linux/..." to #include <linux/...> [PATCH]s follow
Message-Id: <9a8748490708191519s73b5ab01w10295dab4083de96@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1187561864.4200.136.camel@localhost>
In-Reply-To: <1187561864.4200.136.camel@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Perches <joe@perches.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Whitcroft <apw@shadowen.org>

On 20/08/07, Joe Perches <joe@perches.com> wrote:
> There are several files that:
>
> #include "linux/file" not #include <linux/file>
> #include "asm/file" not #include <asm/file>
>
> Here's a little script that converts them:
>
If you've actually checked that such conversions are correct and work
fine, how about a patch (or patches)?

-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
