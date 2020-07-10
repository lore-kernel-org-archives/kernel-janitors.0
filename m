From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Date: Fri, 10 Jul 2020 12:15:33 +0000
Subject: Re: [PATCH] xen/xenbus: Fix a double free in xenbus_map_ring_pv()
Message-Id: <3434e219-216f-ba50-c001-35a066d20db4@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200710113610.GA92345@mwanda>
In-Reply-To: <20200710113610.GA92345@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Yan Yankovskyi <yyankovskyi@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, kernel-janitors@vger.kernel.org, Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org

On 10.07.20 13:36, Dan Carpenter wrote:
> When there is an error the caller frees "info->node" so the free here
> will result in a double free.  We should just delete first kfree().
> 
> Fixes: 3848e4e0a32a ("xen/xenbus: avoid large structs and arrays on the stack")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for spotting this!

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
