From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Tue, 24 Oct 2006 17:54:00 +0000
Subject: Re: [KJ] gcc 4x warnings, x86_64
Message-Id: <20061024175359.GB5337@martell.zuzino.mipt.ru>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061024124142.GA10832@silverwood.ncultra.org>
In-Reply-To: <20061024124142.GA10832@silverwood.ncultra.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Oct 24, 2006 at 08:41:42AM -0400, Mike Day wrote:
> A lot of drivers are producing warnings and I would like to submit
> some patches to clean the warnings up.

Note, that

	warning: 'foo' may be used uninitialized in this function

style patches must have a description of codepath where foo is indeed
used initialized.

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
