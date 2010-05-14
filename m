From: Eric Paris <eparis@redhat.com>
Date: Fri, 14 May 2010 20:09:28 +0000
Subject: Re: [PATCH 7/10] security/selinux/ss: Use kstrdup
Message-Id: <1273867768.2826.30.camel@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005142130140.28935@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005142130140.28935@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Stephen Smalley <sds@tycho.nsa.gov>, James Morris <jmorris@namei.org>, Eric Paris <eparis@parisplace.org>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 2010-05-14 at 21:30 +0200, Julia Lawall wrote:
> From: Julia Lawall <julia@diku.dk>
> 
> Use kstrdup when the goal of an allocation is copy a string into the
> allocated region.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 
> // <smpl>
> @@
> expression from,to;
> expression flag,E1,E2;
> statement S;
> @@
> 
> -  to = kmalloc(strlen(from) + 1,flag);
> +  to = kstrdup(from, flag);
>    ... when != \(from = E1 \| to = E1 \)
>    if (to=NULL || ...) S
>    ... when != \(from = E2 \| to = E2 \)
> -  strcpy(to, from);
> // </smpl>
> 
> Signed-off-by: Julia Lawall <julia@diku.dk>

Acked-by: Eric Paris <eparis@redhat.com>


