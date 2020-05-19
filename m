From: David Howells <dhowells@redhat.com>
Date: Tue, 19 May 2020 16:18:03 +0000
Subject: Re: [PATCH] fsinfo: Fix uninitialized variable in fsinfo_generic_mount_all()
Message-Id: <1514223.1589905083@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200515120908.GB575846@mwanda>
In-Reply-To: <20200515120908.GB575846@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: dhowells@redhat.com, linux-fsdevel@vger.kernel.org, kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> The "conn" variable is never set to false.
> 
> Fixes: f2494de388bd ("fsinfo: Add an attribute that lists all the visible mounts in a namespace")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> The buggy commit looks like preliminary stuff not pushed to anywhere so
> probably this can just be folded in.

I folded in someone else's equivalent patch, thanks.

David
