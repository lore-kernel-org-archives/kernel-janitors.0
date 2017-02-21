From: Sagi Grimberg <sagi@grimberg.me>
Date: Tue, 21 Feb 2017 21:20:25 +0000
Subject: Re: [PATCH] nvmet-rdma: Fix error handling
Message-Id: <bea43248-6c09-2a2e-56cc-59c707c2226b@grimberg.me>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170219190438.19371-1-christophe.jaillet@wanadoo.fr>
 <20170219194657.GA6591@lst.de>
In-Reply-To: <20170219194657.GA6591@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org


> On Sun, Feb 19, 2017 at 08:04:38PM +0100, Christophe JAILLET wrote:
>> According to the surrounding goto, it is likely that 'out_destroy_sq' was
>> expected here.
>
> s/surrounding/preceeding/ ?
>
> But the patch itself looks good, thanks.
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Picked it up and reworded, thanks.
