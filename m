From: Randy Dunlap <rdunlap@xenotime.net>
Date: Tue, 29 May 2007 23:12:54 +0000
Subject: Re: [KJ] Re: [PATCH ARRAY_SIZE 1/4] kernel 2.6 size macro clean ups
Message-Id: <20070529161254.7ed8832f.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <465C99C3.4030802@gmail.com>
In-Reply-To: <465C99C3.4030802@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, 30 May 2007 00:17:15 +0200 Jaco Kroon wrote:

> Aaron Cripps wrote:
> > Jaco Kroon wrote:
> >> This patch includes a bunch of white-space changes.  I recommend 
> >> passing -B to the diff command.

We really don't want to risk mis-applying a patch.

> >> Jaco
> > Actually, I did that on purpose, as is mentioned in the Patch. The 
> > whitespace changes are "harmless" and
> > make for "better formatted" code. (okay, so the formatting is the same, 
> > but at least the code after the whitespace
> > changes is somewhat uniform).
> > -acripps
> 
> Perhaps, but then these are two different "changes" and should probably 
> be separate patches.

Agreed.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.linux-foundation.org
https://lists.linux-foundation.org/mailman/listinfo/kernel-janitors
