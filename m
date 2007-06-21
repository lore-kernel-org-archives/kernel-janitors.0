From: "Alexey Dobriyan" <adobriyan@gmail.com>
Date: Thu, 21 Jun 2007 13:46:37 +0000
Subject: Re: [KJ] [PATCH] Centralize checking for adequate version of gcc.
Message-Id: <b6fcc0a0706210646q4984a51fke1343c7f92a16ed8@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0706150650010.25667@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 6/21/07, Robert P. J. Day <rpjday@mindspring.com> wrote:
> actually, it made me wonder why gcc < 3.2.0 is a *fatal* choice, but
> gcc = 4.1.0 is just a *warning*.  if 4.1.0 is "known to miscompile
> the kernel," why not just make it unacceptable?  why the double
> standard here?

Runtime checking of gcc for known miscompilation bugs is welcome. :-)
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
