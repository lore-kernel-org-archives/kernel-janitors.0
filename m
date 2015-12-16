From: Jiri Kosina <jikos@kernel.org>
Date: Wed, 16 Dec 2015 14:57:52 +0000
Subject: Re: [patch] HID: wacom: bitwise vs logical ORs
Message-Id: <alpine.LNX.2.00.1512161557060.9922@cbobk.fhfr.pm>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20151209102205.GB3173@mwanda>
In-Reply-To: <20151209102205.GB3173@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jason Gerecke <killertofu@gmail.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, kernel-janitors@vger.kernel.org

On Wed, 9 Dec 2015, Dan Carpenter wrote:

> Smatch complains that these should probably be bitwise ORs instead of
> logical.  It doesn't matter for "prox" but it makes a difference for
> "strip1" and "strip2".
> 
> Fixes: c7f0522a1ad1 ('HID: wacom: Slim down wacom_intuos_pad processing')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Jason, could you please provide your Ack for this one?

It's obviously a Correct Thing To Do(TM), but I assume you've tested on 
your devices with this patch, so some other changes might potentially be 
needed to "compensate" for the fix ... 

Thanks,

-- 
Jiri Kosina
SUSE Labs

