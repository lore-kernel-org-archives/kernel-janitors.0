From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Date: Wed, 06 Dec 2017 16:39:22 +0000
Subject: Re: [PATCH] xen/pvcalls: check for xenbus_read() errors
Message-Id: <c44238de-ef57-929f-c076-483cb749a242@oracle.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205143843.hj7b4ayvbgf5ftzl@mwanda>
 <alpine.DEB.2.10.1712051026390.3403@sstabellini-ThinkPad-X260>
In-Reply-To: <alpine.DEB.2.10.1712051026390.3403@sstabellini-ThinkPad-X260>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stefano Stabellini <sstabellini@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org

On 12/05/2017 01:26 PM, Stefano Stabellini wrote:
> On Tue, 5 Dec 2017, Dan Carpenter wrote:
>> Smatch complains that "len" is uninitialized if xenbus_read() fails so
>> let's add some error handling.
>>
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

Applied to for-linus-4.15.

-boris
