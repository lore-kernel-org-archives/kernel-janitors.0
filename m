From: Juergen Gross <jgross@suse.com>
Date: Tue, 16 Apr 2019 05:20:48 +0000
Subject: Re: [PATCH] xenbus: drop useless LIST_HEAD in xenbus_write_watch() and xenbus_file_write()
Message-Id: <545749c9-dfad-2de4-3b74-f73d78419007@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190416040651.186468-1-maowenan@huawei.com>
In-Reply-To: <20190416040651.186468-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>, boris.ostrovsky@oracle.com, sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 16/04/2019 06:06, Mao Wenan wrote:
> Drop LIST_HEAD where the variable it declares is never used.
> 
> The declarations were introduced with the file, but the declared
> variables were not used.
> 
> Fixes: 1107ba885e469("xen: add xenfs to allow usermode <-> Xen interaction")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
