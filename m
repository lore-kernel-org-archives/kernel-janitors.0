From: Dan Carpenter <error27@gmail.com>
Date: Tue, 12 Oct 2010 14:51:20 +0000
Subject: Re: [patch 1/2] vhost: potential integer overflows
Message-Id: <20101012145120.GC6742@bicker>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20101011172256.GF5851@bicker> <20101012122548.GA25446@redhat.com>
In-Reply-To: <20101012122548.GA25446@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, "David S. Miller" <davem@davemloft.net>, Rusty Russell <rusty@rustcorp.com.au>, kvm@vger.kernel.org, virtualization@lists.osdl.org, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Oct 12, 2010 at 02:25:48PM +0200, Michael S. Tsirkin wrote:
> 
> As far as I can see, maximum value for num is 64K - 1:
> 
>                 if (!s.num || s.num > 0xffff || (s.num & (s.num - 1))) {
>                         r = -EINVAL;
>                         break;
>                 }
> 
> How can any of the above two trigger?
> It seems easier to check value for sanity at a single place where it's
> passed from userspace to kernel.
> 

Gar.  Sorry for that.  My mistake.

regards,
dan carpenter

