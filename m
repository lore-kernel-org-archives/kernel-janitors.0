From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 04 Feb 2020 07:18:49 +0000
Subject: Re: [PATCH] USB: HID: Fix timeout by adding retry loop
Message-Id: <20200204071849.GQ1778@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <51d8ee09-7cd6-5304-00b0-99276e67aec1@gmail.com>
In-Reply-To: <51d8ee09-7cd6-5304-00b0-99276e67aec1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Feb 04, 2020 at 09:00:46AM +0200, Lauri Jakku wrote:
> Hi,
> 
> I'm quite newbie publicly patching stuff, but at anyway:
> 
> On 4.2.2020 8.27, Dan Carpenter wrote:
> > Hi Lauri,
> >
> > There are a bunch of issues with this patch.
> >
> > 1)  There is no way we're going to add a retry loop to
> >     usb_control_msg().  We might add it to a driver, but probably we
> >     would suspect that the hardware is bad.  Maybe the cable is faulty?
> >     Or I could be wrong on that...
> 
> For example there is lot of USB HID related oddities reported
> 
> by multiple users, that have said that after (kernel) update
> 
> of their system USB devices stopped working or work randomly.
> 
> 
> I have problem with my mouse, and the problem went away
> 
> with my patch. I think that the change to driver by driver is
> 
> just code duplication, and with my patch the 'good' HW still
> 
> is not going to sleep even that 20ms, the time that I tought
> 
> to be good. Max retry time is 400ms.
> 

That doesn't sound totally unreasonable.  Go ahead and try sending the
patch.  Maybe they apply it or maybe they don't but either way there
is no harm in sending a patch.

regards,
dan carpenter
