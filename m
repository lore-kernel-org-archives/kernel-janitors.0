From: Vasiliy Kulikov <segoon@openwall.com>
Date: Mon, 15 Nov 2010 19:18:51 +0000
Subject: Re: [PATCH] fs: jffs2: fix error value sign
Message-Id: <20101115191851.GA6450@albatros>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1289765320-6071-1-git-send-email-segoon@openwall.com>
	<20101114202905.GA21614@bicker> <20101115143735.GA4548@albatros>
	<20101115184531.GA24643@bicker>
In-Reply-To: <20101115184531.GA24643@bicker>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <error27@gmail.com>, kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org

On Mon, Nov 15, 2010 at 21:45 +0300, Dan Carpenter wrote:
> On Mon, Nov 15, 2010 at 05:37:37PM +0300, Vasiliy Kulikov wrote:
> > 
> > x86_64, linux-next:
> > 
> > make -C /home/vasya/linux fs/jffs2/xattr.o
> > make: Вход в каталог `/home/vasya/dev/linux-next'
>         ^^^^^^^^^^^^^^
> 
> This means "Entering directory" right?  So /home/vasya/linux is a
> symlink to /home/vasya/dev/linux-next.  It still compiles for me
> when I create a symlink and use the -C option...

Correct, but the same with cd ~linux/ && make fs/jffs2/xattr.o.

I've just updated to next-2010111 and it became compilable ;)
linux next is just very nonstable...

Thanks,

-- 
Vasiliy
