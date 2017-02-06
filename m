From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 06 Feb 2017 09:32:04 +0000
Subject: Re: [PATCH] IB/cma: Fix reversed test
Message-Id: <20170206093204.GB11103@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170127131535.19918-1-christophe.jaillet@wanadoo.fr>
 <1485552696.13218.0.camel@sandisk.com>
 <1485561952.2432.31.camel@redhat.com>
 <20170128065927.GP4149@mwanda>
 <2fde1e87-a345-4697-e205-051a3973e624@redhat.com>
In-Reply-To: <2fde1e87-a345-4697-e205-051a3973e624-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Ledford <dledford-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Bart Van Assche <Bart.VanAssche-XdAiOPVOjttBDgjK7y7TUQ@public.gmane.org>, "christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org" <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>, "hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <hal.rosenstock-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org" <sean.hefty-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-rdma-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>

Right.  The stable tag isn't needed.  But the fixes tag is a different
thing.  Greg doesn't automatically pull patches which have a fixes tag.

Fixes is also useful for collecting metrics about how long it takes to
fix bugs.  It's just really useful on it's own.

regards,
dan carpenter

