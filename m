From: James Morris <jmorris@namei.org>
Date: Wed, 05 Aug 2009 22:47:47 +0000
Subject: Re: [PATCH 2/2] security/smack: Use AF_INET for sin_family field
Message-Id: <alpine.LRH.2.00.0908060847170.6643@tundra.namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.0908051434340.20453@pc-004.diku.dk>
In-Reply-To: <Pine.LNX.4.64.0908051434340.20453@pc-004.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>

On Wed, 5 Aug 2009, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> Elsewhere the sin_family field holds a value with a name of the form
> AF_..., so it seems reasonable to do so here as well.  Also the values of
> PF_INET and AF_INET are the same.
> 
> The semantic patch that makes this change is as follows:
> (http://coccinelle.lip6.fr/)
> 


Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next


-- 
James Morris
<jmorris@namei.org>
