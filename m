From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 11 Oct 2018 08:38:08 +0000
Subject: Re: [PATCH net-next] rxrpc: Remove set but not used variable 'ioc'
Message-Id: <20181011083807.tvhfguimyw7glrtp@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1539052273-34824-1-git-send-email-yuehaibing@huawei.com>
 <11853.1539079996@warthog.procyon.org.uk>
In-Reply-To: <11853.1539079996@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Howells <dhowells@redhat.com>
Cc: YueHaibing <yuehaibing@huawei.com>, davem@davemloft.net, linux-afs@lists.infradead.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Oct 09, 2018 at 11:13:16AM +0100, David Howells wrote:
> YueHaibing <yuehaibing@huawei.com> wrote:
> 
> > net/rxrpc/output.c: In function 'rxrpc_reject_packets':
> > net/rxrpc/output.c:527:11: warning:
> >  variable 'ioc' set but not used [-Wunused-but-set-variable]
> > 
> > It never used since introduction in
> 
> I wonder why my compiler doesn't show this warning.
> 
> Anyway, NAK: just removing the variable is the wrong fix - you need to look at
> the code more closely.  The actual fix is to pass it to kernel_sendmsg()
> instead of 2.
> 
> But thanks anyway!  Do you want to respin your patch?
> 
> > commit ece64fec164f ("rxrpc: Emit BUSY packets when supposed to rather than ABORTs")
> 
> Btw, this should be a 'Fixes: <commit> ("subject")' line and the patch needs
> to go to net, not net-next.

I told him to do that because it wasn't a bugfix...  Probably just Fixes
is the right thing to use though.

regards,
dan carpenter
