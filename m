From: Al Viro <viro@ZenIV.linux.org.uk>
Date: Wed, 06 Jan 2016 13:08:00 +0000
Subject: Re: [patch] mtip32xx: calling kfree() on an error pointer
Message-Id: <20160106130800.GS9938@ZenIV.linux.org.uk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160106100503.GH23185@mwanda>
In-Reply-To: <20160106100503.GH23185@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jens Axboe <axboe@fb.com>, Asai Thambi SP <asamymuthupa@micron.com>, Selvan Mani <smani@micron.com>, Jeff Moyer <jmoyer@redhat.com>, Michal Hocko <mhocko@suse.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, Jan 06, 2016 at 01:05:03PM +0300, Dan Carpenter wrote:
> If memdup_user() fails then we end up passing an ERR_PTR to kfree()
> which is a bug.

Mind if I fold it (with credit, obviously)?
