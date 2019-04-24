From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Date: Wed, 24 Apr 2019 18:50:04 +0000
Subject: Re: [PATCH] xenbus: drop useless LIST_HEAD in xenbus_write_watch() and xenbus_file_write()
Message-Id: <f6ceb91a-394f-21a1-472e-8fb53d2f7cec@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190416040651.186468-1-maowenan@huawei.com>
In-Reply-To: <20190416040651.186468-1-maowenan@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mao Wenan <maowenan@huawei.com>, jgross@suse.com, sstabellini@kernel.org
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 4/16/19 12:06 AM, Mao Wenan wrote:
> Drop LIST_HEAD where the variable it declares is never used.
>
> The declarations were introduced with the file, but the declared
> variables were not used.
>
> Fixes: 1107ba885e469("xen: add xenfs to allow usermode <-> Xen interaction")
> Signed-off-by: Mao Wenan <maowenan@huawei.com>


Applied to for-linus-5.2
