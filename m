From: James Morris <jmorris@namei.org>
Date: Sun, 16 May 2010 23:01:38 +0000
Subject: Re: [PATCH 7/10] security/selinux/ss: Use kstrdup
Message-Id: <alpine.LRH.2.00.1005170901160.12313@tundra.namei.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005142130140.28935@ask.diku.dk>
In-Reply-To: <Pine.LNX.4.64.1005142130140.28935@ask.diku.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia@diku.dk>
Cc: Stephen Smalley <sds@tycho.nsa.gov>, Eric Paris <eparis@parisplace.org>, linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, 14 May 2010, Julia Lawall wrote:

> From: Julia Lawall <julia@diku.dk>
> 
> Use kstrdup when the goal of an allocation is copy a string into the
> allocated region.
> 

Applied to
git://git.kernel.org/pub/scm/linux/kernel/git/jmorris/security-testing-2.6#next


-- 
James Morris
<jmorris@namei.org>
