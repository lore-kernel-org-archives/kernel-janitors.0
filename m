From: David Miller <davem@davemloft.net>
Date: Sat, 30 Oct 2010 23:49:54 +0000
Subject: Re: [PATCH] isdn: mISDN: socket: fix information leak to userland
Message-Id: <20101030.164954.179924837.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1288429473-21864-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1288429473-21864-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: segooon@gmail.com
Cc: kernel-janitors@vger.kernel.org, isdn@linux-pingi.de, acme@redhat.com, tj@kernel.org, eparis@redhat.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

From: Vasiliy Kulikov <segooon@gmail.com>
Date: Sat, 30 Oct 2010 13:04:33 +0400

> Structure mISDN_devinfo is copied to userland with the field "name"
> that has the last elements unitialized.  It leads to leaking of
> contents of kernel stack memory.
> 
> Signed-off-by: Vasiliy Kulikov <segooon@gmail.com>

Applied.
