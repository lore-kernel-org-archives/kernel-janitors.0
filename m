From: Juergen Gross <jgross@suse.com>
Date: Tue, 05 Dec 2017 16:24:23 +0000
Subject: Re: [PATCH] xen/pvcalls: check for xenbus_read() errors
Message-Id: <318939f7-1c28-c180-d9ee-8fe97ba0d2ed@suse.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20171205143843.hj7b4ayvbgf5ftzl@mwanda>
In-Reply-To: <20171205143843.hj7b4ayvbgf5ftzl@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 05/12/17 15:38, Dan Carpenter wrote:
> Smatch complains that "len" is uninitialized if xenbus_read() fails so
> let's add some error handling.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Reviewed-by: Juergen Gross <jgross@suse.com>


Juergen
