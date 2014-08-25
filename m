From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 Aug 2014 10:16:16 +0000
Subject: Re: [PATCH 8/9] video: fbdev: aty: use c99 initializers in structures
Message-Id: <20140825101616.GD5046@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1408792831-25615-1-git-send-email-Julia.Lawall@lip6.fr>
 <1408792831-25615-9-git-send-email-Julia.Lawall@lip6.fr>
 <20140823152015.GB2074@thin>
 <alpine.DEB.2.02.1408231731550.2068@localhost6.localdomain6>
In-Reply-To: <alpine.DEB.2.02.1408231731550.2068@localhost6.localdomain6>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Josh Triplett <josh@joshtriplett.org>, Paul Mackerras <paulus@samba.org>, kernel-janitors@vger.kernel.org, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Aug 23, 2014 at 05:32:37PM +0200, Julia Lawall wrote:
> > 
> > The closing brace should be in column 0 of the next line.  Also, the
> > final field initializer should have a comma after it. (Likewise for the
> > remaining changes in this file.)
> 
> In general, I haven't changed the presence or absence of trailing commas.
> Should I add them everywhere?

Probably, yeah.  Trailing commas are better.

It's not worth resending, but the script should add them I think.

regards,
dan carpenter

