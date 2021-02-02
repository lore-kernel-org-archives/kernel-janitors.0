From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 02 Feb 2021 14:20:45 +0000
Subject: Re: [PATCH] ceph: fix an oops in error handling in ceph_netfs_issue_op
Message-Id: <20210202142045.GD20820@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20210202131041.43977-1-jlayton@kernel.org>
In-Reply-To: <20210202131041.43977-1-jlayton@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Layton <jlayton@kernel.org>
Cc: dhowells@redhat.com, idryomov@gmail.com, ceph-devel@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Tue, Feb 02, 2021 at 08:10:41AM -0500, Jeff Layton wrote:
> Dan reported a potential oops in the cleanup if ceph_osdc_new_request
> returns an error. Eliminate the unneeded initialization of "req" and
> then just set it to NULL in the case where it holds an ERR_PTR.
> 
> Also, drop the unneeded NULL check before calling
> ceph_osdc_put_request.
> 
> Fixes: 1cf7fdf52d5a ("ceph: convert readpage to fscache read helper")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Suggested-by: Ilya Dryomov <idryomov@gmail.com>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>


Looks good.

Acked-by: Dan Carpenter <dan.carpenter@oracle.com>

regards,
dan carpenter
