From: Roland Dreier <rdreier@cisco.com>
Date: Sat, 22 May 2010 15:15:50 +0000
Subject: Re: [PATCH 10/27] drivers/infiniband/core: Use memdup_user
Message-Id: <adaaars0xy1.fsf@roland-alpha.cisco.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <Pine.LNX.4.64.1005221021030.13021@ask.diku.dk>
	<4BF7A65D.1070501@bfs.de>
In-Reply-To: <4BF7A65D.1070501-fPG8STNUNVg@public.gmane.org> (walter harms's message of "Sat, 22 May
	2010 11:39:41 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: wharms-fPG8STNUNVg@public.gmane.org
Cc: Julia Lawall <julia-dAYI7NvHqcQ@public.gmane.org>, Roland Dreier <rolandd-FYB4Gu1CFyUAvxtiuMwx3w@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

 > > +	data = memdup_user((void __user *)(unsigned long)src, len);
 > > +	if (IS_ERR(data))
 > > +		return PTR_ERR(data);

 > This cast look strange, can it happen that (unsigned long)<(u64) ?
 > (is there a 32bit infiniband) ?

There is 32-bit infiniband.  Linux kernel assumes that unsigned long is
equivalent to uintptr_t -- in other words all pointers are the same size
as longs.  So when casting from integer to pointer we add a cast to
unsigned long to avoid a warning precisely in the 32-bit case -- we
would get a warning about cast to pointer from integer of different size
when casting from 64-bit integer to 32-bit pointer.
-- 
Roland Dreier <rolandd@cisco.com> || For corporate legal information go to:
http://www.cisco.com/web/about/doing_business/legal/cri/index.html
