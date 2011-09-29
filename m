From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 29 Sep 2011 20:50:30 +0000
Subject: Re: [patch] bluetooth: hci_ll: clean up types a bit
Message-Id: <20110929205030.GH10999@longonot.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20110926061412.GA11832@elgon.mountain>
 <20110929192847.GD2605@joana>
In-Reply-To: <20110929192847.GD2605@joana>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marcel Holtmann <marcel@holtmann.org>, linux-bluetooth@vger.kernel.org, kernel-janitors@vger.kernel.org

On Thu, Sep 29, 2011 at 04:28:47PM -0300, Gustavo Padovan wrote:
> Hi Dan,
> 
> * Dan Carpenter <dan.carpenter@oracle.com> [2011-09-26 09:14:12 +0300]:
> 
> > I'm doing an audit of places where min_t() casting truncates a
> > variable such as:
> > 	len = min_t(unsigned int, ll->rx_count, count);
> > Here ll->rx_count is unsigned long, but we cast it to unsigned int
> > and lose the significant bits.
> > 
> > Looking at the code ->rx_count is never more than 256 so we could
> > just make it an int.
> 
> Where is this 256 maximum? I'm not seeing it?
> 

I'm sorry for this, I was wrong.  I'm not sure where I got that...
I can see at least one place where it goes up to USHRT_MAX in
the case of HCILL_W4_ACL_HDR.

I still think the patch is basically correct, but let me take another
look and resend with an updated commit message.

regards,
dan carpenter

