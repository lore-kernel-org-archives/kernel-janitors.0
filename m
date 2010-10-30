From: David Miller <davem@davemloft.net>
Date: Sat, 30 Oct 2010 19:12:38 +0000
Subject: Re: [PATCH] net: core: scm: fix information leak to userland
Message-Id: <20101030.121238.189687981.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288448796-6147-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288448796-6147-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, ebiederm@xmission.com, eric.dumazet@gmail.com, tj@kernel.org, serge@hallyn.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org


Your patches are almost entirely baseless.

You haven't even made an effort to show a real case, in detail,
where your patches actually fix a bug.  The CMSG case shows
that you didn't even bother to look at the assembly of even
one architecture to see if padding bytes even existed in the
structure, and that furthermore even if they existed that they
would leak out ever.

I don't even buy the "preventative nature" argument for the
address[128] thing.  If a protocol is leaking kernel memory in that
case, it also isn't filling in the address value properly, which is a
bug times two.

I absolutely am not applying these patches, sorry.
