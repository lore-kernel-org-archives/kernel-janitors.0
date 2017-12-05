From: Juergen Gross <jgross@suse.com>
Date: Tue, 05 Dec 2017 16:23:51 +0000
Subject: Re: [PATCH 2/2] xen/pvcalls: Fix a check in pvcalls_front_remove()
Message-Id: <06e1bf11-54b8-0271-fce7-d506e6312971@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205143854.d3exoof6rrdgx6yr@mwanda>
In-Reply-To: <20171205143854.d3exoof6rrdgx6yr@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 05/12/17 15:38, Dan Carpenter wrote:
> bedata->ref can't be less than zero because it's unsigned.  This affects
> certain error paths in probe.  We first set ->ref = -1 and then we set
> it to a valid value later.
> 
> Fixes: 219681909913 ("xen/pvcalls: connect to the backend")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
