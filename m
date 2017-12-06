From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Date: Wed, 06 Dec 2017 16:40:13 +0000
Subject: Re: [Xen-devel] [PATCH 2/2] xen/pvcalls: Fix a check in pvcalls_front_remove()
Message-Id: <6faea52c-2c30-e32e-5ad8-e3822119a84c@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <alpine.DEB.2.10.1712051029410.3403@sstabellini-ThinkPad-X260>
In-Reply-To: <alpine.DEB.2.10.1712051029410.3403@sstabellini-ThinkPad-X260>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 12/05/2017 01:29 PM, Stefano Stabellini wrote:
> On Tue, 5 Dec 2017, Dan Carpenter wrote:
>> bedata->ref can't be less than zero because it's unsigned.  This affects
>> certain error paths in probe.  We first set ->ref = -1 and then we set
>> it to a valid value later.
>>
>> Fixes: 219681909913 ("xen/pvcalls: connect to the backend")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


Applied to for-linus-4.15.

-boris


