From: David Miller <davem@davemloft.net>
Date: Thu, 03 Jan 2008 09:41:04 +0000
Subject: Re: [PATCH] drivers/video/aty/radeon_base.c: compilation warning
Message-Id: <20080103.014104.46420831.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <200801021901.44226.lpotenza@inwind.it>
In-Reply-To: <200801021901.44226.lpotenza@inwind.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Date: Thu, 03 Jan 2008 07:19:33 +1100

> 
> On Wed, 2008-01-02 at 19:01 +0100, Leonardo Potenza wrote:
> > From: Leonardo Potenza <lpotenza@inwind.it>
> > 
> > Added a check for the sysfs_create_bin_file() return value
> > 
> > Signed-off-by: Leonardo Potenza <lpotenza@inwind.it>
> 
> NACK.
> 
> The warnings are stupid, this is a long argument we had with akpm among
> others, I totally refuse to fail creating the framebuffer because
> something went bonkers creating some sysfs file that are in no way
> mandatory for the good operations of the fb.
> 
> There is a _shitload_ of cases where testing the result of those sysfs
> calls is pure bloat.

I agree.

In fact my first reaction to this patch is "Damn, I better test
to make sure I don't lose my console on my workstation because
of this stupid patch."

Just put (void)'s there or whatever, or we should get rid of
the mustcheck annotations.  Either way is fine with me.

