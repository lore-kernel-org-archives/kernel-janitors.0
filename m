From: Pete <greg.petr@gmail.com>
Date: Mon, 05 Oct 2009 17:50:49 +0000
Subject: Re: [PATCH] fs: added KERNEL-DEBUG flag to printk statments
Message-Id: <1254764952.5279.60.camel@linux-k65f.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1254753799.5279.37.camel@linux-k65f.site>
	 <1254756285.5279.39.camel@linux-k65f.site>
	 <20091005170903.GA9791@parisc-linux.org>
In-Reply-To: <20091005170903.GA9791@parisc-linux.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Wilcox <matthew@wil.cx>, Joe Perches <joe@perches.com>
Cc: kernel-janitors@vger.kernel.org, trivial@kernel.org, linux-kernel@vger.kernel.org


> Pay special attention to getting DEBUG set in the right place, and
> _at least_ compile-test your code, with and without DEBUG enabled.
> You should really run your code (again, with and without DEBUG enabled)
> and check that it does the right thing.

ok - Thanks will redo, test and send a more generalized version of the
patch which modifies the macro instead.
-Greg

