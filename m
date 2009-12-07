From: James Morris <jmorris@namei.org>
Date: Mon, 07 Dec 2009 22:11:32 +0000
Subject: Re: [PATCH 5/5] security/selinux/ss: correct size computation
Message-Id: <alpine.LRH.2.00.0912080911130.21013@tundra.namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0912061016310.20858@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0912061016310.20858@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Stephen Smalley <sds@tycho.nsa.gov>, Eric Paris <eparis@parisplace.org>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, 6 Dec 2009, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> The size argument to kcalloc should be the size of desired structure,
> not the pointer to it.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @expression@
> expression *x;
> @@
> 
> x >  <+...
> -sizeof(x)
> +sizeof(*x)
> ...+>// </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>


Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next


-- 
James Morris
<jmorris@namei.org>
