From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 30 Aug 2013 21:05:08 +0000
Subject: Re: Updated FarSync driver
Message-Id: <20130830210508.GL19256@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <E603DC592C92B54A89CEF6B0919A0B1CA86BBBD5E2@SOLO.hq.farsitecommunications.com>
In-Reply-To: <E603DC592C92B54A89CEF6B0919A0B1CA86BBBD5E2@SOLO.hq.farsitecommunications.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Fri, Aug 30, 2013 at 11:53:02PM +0300, Dan Carpenter wrote:
> The other thing to be aware of is that we are coming up on a merge
> window so it might already be too late to get this merged in the up
> coming v3.12 kernel in November so you'll have to target v3.13 in Feb.
> Maybe just submit it to the netdev ASAP and see what people say.

Btw, submit the driver as soon as possible even though you are targeting
Feb.  It goes into linux-next and people review it and run static
checkers on it.  It's like there is a queue of patches.  You can join
the queue any time but it takes 3-6 months before your patches come out
the other end and are released in an official kernel.

regards,
dan carpenter


