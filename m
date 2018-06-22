From: David Howells <dhowells@redhat.com>
Date: Fri, 22 Jun 2018 13:09:50 +0000
Subject: Re: [PATCH] cpuset: Fix cpuset_get_tree()
Message-Id: <31233.1529672990@warthog.procyon.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180619125340.h2supkskfgwmrbtq@kili.mountain>
In-Reply-To: <20180619125340.h2supkskfgwmrbtq@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There was a reversed NULL test to the function couldn't work.

I've folded this into the original patch, thanks.

David
