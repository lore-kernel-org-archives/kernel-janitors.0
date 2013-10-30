From: Jiri Kosina <jkosina@suse.cz>
Date: Wed, 30 Oct 2013 13:45:46 +0000
Subject: Re: [patch] HID: logitech-dj: small cleanup in rdcat()
Message-Id: <alpine.LNX.2.00.1310301444550.21144@pobox.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20131019090859.GD9312@longonot.mountain>
In-Reply-To: <20131019090859.GD9312@longonot.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sat, 19 Oct 2013, Dan Carpenter wrote:

> We could pass the "rdsec" pointer instead of the address of the "rdesc"
> and it's a little simpler.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Cosmetic change on a borderline of being justified to bother with :) 
Thanks Dan, applying now for 3.13.

-- 
Jiri Kosina
SUSE Labs
