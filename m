From: Doug Ledford <dledford@redhat.com>
Date: Wed, 16 Aug 2017 15:32:37 +0000
Subject: Re: [PATCH] IB/core: fix memory leak on ah on error return path
Message-Id: <1502897557.33760.12.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170808101054.13800-1-colin.king@canonical.com>
         <20170808102026.GG3926@linux-x5ow.site>
         <866a49ab-6f7b-4b46-062b-6230e48da725@canonical.com>
         <20170808125927.GK3926@linux-x5ow.site>
         <VI1PR0502MB30082DCBDA1C4B0F071D3DABD18A0@VI1PR0502MB3008.eurprd05.prod.outlook.com>
In-Reply-To: <VI1PR0502MB30082DCBDA1C4B0F071D3DABD18A0-o1MPJYiShExKsLr+rGaxW8DSnupUy6xnnBOFsp37pqbUKgpGm//BTAC/G2K4zDHf@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Parav Pandit <parav-VPRAkNaXOzVWk0Htik3J/w@public.gmane.org>, Johannes Thumshirn <jthumshirn-l3A5Bk7waGM@public.gmane.org>, Colin Ian King <colin.king-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Lijun Ou <oulijun-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Wei Hu <xavier.huwei-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, Sean Hefty <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Hal Rosenstock <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

On Tue, 2017-08-08 at 19:48 +0000, Parav Pandit wrote:
> Hi,
> 
> I need to top post because comments are unrelated to past discussion.
> 
> rdma_ah_retrieve_dmac() can never fail for RoCE as its returning
> pointer from structure ah_attr.
> Provider driver doesn't need to check for null pointer as ib/core
> would never call provider if it's not RoCE provider.
> So this memory leak only exist in theory.
> 
> When its null, driver should WARN_ON/BUG_ON in extreme case, but
> that's not necessary either.
> 
> I have patch is progress under internal review that does nice small
> cleanup in many provider drivers that eliminates the check
> completely.
> Waiting for Moni to finish the review.

This sounds like a nice patch to push into for-next, but in the
meantime I took the V2 of this patch as it silences a checker warning.

-- 
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
    Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD

