From: Joe Perches <joe@perches.com>
Date: Fri, 10 Feb 2012 18:51:01 +0000
Subject: Re: [Cocci] Re: [PATCH] scripts/coccinelle/misc/boolinit.cocci: semantic patch for bool issues
Message-Id: <1328899861.14197.7.camel@joe2Laptop>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1328893887-28932-1-git-send-email-Julia.Lawall@lip6.fr>
	 <1328895943.14197.1.camel@joe2Laptop>
	 <1328899454.22240.91.camel@sauron.fi.intel.com>
In-Reply-To: <1328899454.22240.91.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dedekind1@gmail.com
Cc: Julia Lawall <Julia.Lawall@lip6.fr>, Michal Marek <mmarek@suse.cz>, Gilles Muller <Gilles.Muller@lip6.fr>, bruce.w.allan@intel.com, rusty@rustcorp.com.au, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, cocci@diku.dk, Julia Lawall <julia@diku.dk>

On Fri, 2012-02-10 at 20:44 +0200, Artem Bityutskiy wrote:
> On Fri, 2012-02-10 at 09:45 -0800, Joe Perches wrote:
> > On Fri, 2012-02-10 at 18:11 +0100, Julia Lawall wrote:
> > > From: Julia Lawall <Julia.Lawall@lip6.fr>
> > Thanks Julia.  It seems to work well.
> I wonder though, why would we want to change if (a = true) with if (a)
> etc? Julia did not provide the explanation in the commit message but
> referred to you and Rusty in the semantic patch.

Testing booleans against specific values is poor form.
booleans should be tested or !tested.

If you are going to submit these patches,
I suggest you break them out by 2nd level
directory.

patch 1: drivers/foo/...
patch 2: drivers/bar/...
...
patch n: drivers/baz/...

and cc: trivial@kernel.org

