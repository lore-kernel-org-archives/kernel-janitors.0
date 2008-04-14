From: Randy Dunlap <rdunlap@xenotime.net>
Date: Mon, 14 Apr 2008 19:59:11 +0000
Subject: Re: cli()/sti() removal
Message-Id: <20080414125911.acc8b574.rdunlap@xenotime.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
In-Reply-To: <919fe2b30804141238g45bd323er9929d54ff5dcfa8e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, 14 Apr 2008 15:38:27 -0400 M. Asselstine wrote:

> Looking at Documentation/cli-sti-removal.txt and grepping for these
> macros in the kernel tree reveal that things are close to allowing
> this task to be completed. I would like to propose that the remainder
> of this work be completed, cleaning up documentation and code related
> to this deprecation. I am willing to do the work but just wanted to
> put a feeler out there to determine if there is any reason not to
> proceed. I also wanted to make sure there wasn't anyone else doing
> this already.

Hi,

The biggest issue is that this isn't a simple grep for and then
substitute new strings for the old ones.  If that's all it was,
it would have been completed long ago.

Some actual thought/design has to be done on several of these in
order to do the locking correctly in all possible contexts, so if
you are up for that, go ahead.  I don't think that anyone else is
doing this just now.

---
~Randy
