From: Randy Dunlap <rdunlap@xenotime.net>
Date: Tue, 24 Oct 2006 15:07:36 +0000
Subject: Re: [KJ] gcc 4x warnings, x86_64
Message-Id: <20061024080736.1eae126f.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20061024124142.GA10832@silverwood.ncultra.org>
In-Reply-To: <20061024124142.GA10832@silverwood.ncultra.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 24 Oct 2006 08:41:42 -0400 Mike Day wrote:

> A lot of drivers are producing warnings and I would like to submit
> some patches to clean the warnings up. However, a lot of the drivers
> are for devices or chips for which I don't have access and am unable
> to test. Is it OK to submit patches like this or should I limit my
> patches to drivers/code I can actually test?

It's OK to submit patches for them.  Please at least build the
drivers cleanly first, though.  Even using sparse on them
would be a good idea.  (see Documentation/sparse.txt)

---
~Randy
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
