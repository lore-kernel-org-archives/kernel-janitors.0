From: Anne Thrax <foobarfoobarfoobar@gmail.com>
Date: Thu, 11 May 2006 01:47:06 +0000
Subject: Re: [KJ] [PATCH] linux-2.6.17-rc3-git13
Message-Id: <4462979A.5040907@gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <445EF28A.1010601@bfs.de>
In-Reply-To: <445EF28A.1010601@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

I think that the issue with the DCO is important, but I'm sort of giving up on reducing
the stack usage for that particular function. I haven't reduced the stack usage all that much, and it only seems to be *HUGE* when I'm using UML (probably should have mentioned that earlier). Also, my solution was horribly ugly. Maybe a DCO discussion should be started in another thread, possibly in LKML?
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
