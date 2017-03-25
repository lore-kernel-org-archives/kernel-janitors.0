From: Doug Ledford <dledford@redhat.com>
Date: Sat, 25 Mar 2017 01:48:49 +0000
Subject: Re: [PATCH] IB/rxe: double free on error
Message-Id: <1490406529.2404.35.camel@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170308052152.GA31503@mwanda>
In-Reply-To: <20170308052152.GA31503@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Moni Shoua <monis@mellanox.com>
Cc: Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 2017-03-08 at 08:21 +0300, Dan Carpenter wrote:
> "goto err;" has it's own kfree_skb() call so it's a double free.  We
> only need to free on the "goto exit;" path.
> 
> Fixes: 8700e3e7c485 ("Soft RoCE driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, applied to -rc.

-- 
Doug Ledford <dledford@redhat.com>
    GPG KeyID: B826A3330E572FDD
   
Key fingerprint = AE6B 1BDA 122B 23B4 265B  1274 B826 A333 0E57 2FDD

