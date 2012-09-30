From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Sun, 30 Sep 2012 07:06:46 +0000
Subject: Re: [patch] power: battery: pointer math issue in gab_probe()
Message-Id: <20120930070646.GO4587@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120929071346.GE10993@elgon.mountain>
 <1348978125.7492.2.camel@anish-Inspiron-N5050>
In-Reply-To: <1348978125.7492.2.camel@anish-Inspiron-N5050>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: anish kumar <anish198519851985@gmail.com>
Cc: Anton Vorontsov <cbou@mail.ru>, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, Sep 30, 2012 at 09:38:45AM +0530, anish kumar wrote:
> On Sat, 2012-09-29 at 10:13 +0300, Dan Carpenter wrote:
> > psy->properties is an enum (32 bit type) so adding sizeof() puts us
> > four times further along than we intended.  It should be cast to a char
> > pointer before doing the math.
> You really read this driver to find out this one.
> Good one.

Nah.  It's a static checker thing with Smatch
(http://smatch.sf.net).  When you add pointer + sizeof(), the
pointer should always be char.

regards,
dan carpenter

