From: "Darren Jenkins" <darrenrjenkins@gmail.com>
Date: Wed, 21 Feb 2007 12:04:08 +0000
Subject: Re: [KJ] BIT macro cleanup
Message-Id: <82faac5b0702210404o29c8f935o5d34fca760ffd037@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <45CADD09.70809@bfs.de>
In-Reply-To: <45CADD09.70809@bfs.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 2/21/07, Darren Jenkins <darrenrjenkins@gmail.com> wrote:

> Sounds fine, but if you want to wrap it, wouldn't it just be easier to do
>
> #define BIT(n) (1<<(n%(sizeof(n) * 8)))
>
> and have it all done automaticly ?

Hang on that is obviously wrong, and I should think before I type.

Darren J.
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
