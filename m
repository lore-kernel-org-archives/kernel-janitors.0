From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 09 Oct 2012 08:56:53 +0000
Subject: Re: drivers/net/vxlan.c:676:53: sparse: incorrect type in argument 5 (different base types)
Message-Id: <20121009085652.GB4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20121007123635.GB24374@localhost>
In-Reply-To: <20121007123635.GB24374@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Mon, Oct 08, 2012 at 09:51:14AM -0700, Stephen Hemminger wrote:
> 
> Which version of sparse is this? I see no errors with the current version 4.4.

The endian checking is not turned on by default.

http://lwn.net/Articles/205624/

regards,
dan carpenter
