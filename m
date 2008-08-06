From: Matthew Wilcox <matthew@wil.cx>
Date: Wed, 06 Aug 2008 12:09:01 +0000
Subject: Re: getting rid of "fs_initcall" from drivers/ code
Message-Id: <20080806120900.GG2055@parisc-linux.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.LFD.1.10.0808052206430.20743@localhost.localdomain>
In-Reply-To: <alpine.LFD.1.10.0808052206430.20743@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Wed, Aug 06, 2008 at 06:02:46AM -0400, Robert P. J. Day wrote:
>   it's an innocuous addition that would allow folks who *truly* need
> to control the timing of their init code that precisely to use
> subsys_initcall_sync() instead of fs_initcall(), since the use of
> fs_initcall() to do that is really kind of hacky.  the use of
> subsys_initcall_sync() instead at least makes it more obvious what
> you're trying to accomplish, and has exactly the same effect.

No, Robert.  You don't understand what you're doing.  Again.

-- 
Intel are signing my paycheques ... these opinions are still mine
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
