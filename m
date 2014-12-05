From: Johan Hovold <johan@kernel.org>
Date: Fri, 05 Dec 2014 11:22:30 +0000
Subject: Re: [patch] USB: mos7720: delete some unneeded code
Message-Id: <20141205112230.GF11445@localhost>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sat, Nov 29, 2014 at 03:49:54PM +0300, Dan Carpenter wrote:
> The "status" is uninitialized so this creates a static checker warning.
> But it's harmless, we can just delete it.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks, Dan. I'll queue it up and apply once 3.19-rc1 is out.

Johan
