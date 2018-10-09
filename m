From: David Howells <dhowells@redhat.com>
Date: Tue, 09 Oct 2018 10:13:16 +0000
Subject: Re: [PATCH net-next] rxrpc: Remove set but not used variable 'ioc'
Message-Id: <11853.1539079996@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539052273-34824-1-git-send-email-yuehaibing@huawei.com>
In-Reply-To: <1539052273-34824-1-git-send-email-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: YueHaibing <yuehaibing@huawei.com>
Cc: dhowells@redhat.com, davem@davemloft.net, linux-afs@lists.infradead.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

YueHaibing <yuehaibing@huawei.com> wrote:

> net/rxrpc/output.c: In function 'rxrpc_reject_packets':
> net/rxrpc/output.c:527:11: warning:
>  variable 'ioc' set but not used [-Wunused-but-set-variable]
> 
> It never used since introduction in

I wonder why my compiler doesn't show this warning.

Anyway, NAK: just removing the variable is the wrong fix - you need to look at
the code more closely.  The actual fix is to pass it to kernel_sendmsg()
instead of 2.

But thanks anyway!  Do you want to respin your patch?

> commit ece64fec164f ("rxrpc: Emit BUSY packets when supposed to rather than ABORTs")

Btw, this should be a 'Fixes: <commit> ("subject")' line and the patch needs
to go to net, not net-next.

David
