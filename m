From: David Miller <davem@davemloft.net>
Date: Mon, 13 Apr 2015 17:39:03 +0000
Subject: Re: [PATCH 1/2] ide: remove deprecated use of pci api
Message-Id: <20150413.133903.354139524800441054.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20150413132530.210f1d3b@lxorguk.ukuu.org.uk>
	<20150413.130813.2058573928379941715.davem@davemloft.net>
	<20150413172324.GZ10964@mwanda>
In-Reply-To: <20150413172324.GZ10964@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan.carpenter@oracle.com
Cc: gnomes@lxorguk.ukuu.org.uk, lambert.quentin@gmail.com, linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 13 Apr 2015 20:23:24 +0300

> On Mon, Apr 13, 2015 at 01:08:13PM -0400, David Miller wrote:
>> From: One Thousand Gnomes <gnomes@lxorguk.ukuu.org.uk>
>> Date: Mon, 13 Apr 2015 13:25:30 +0100
>> 
>> > On Thu,  9 Apr 2015 13:46:27 +0200
>> > Quentin Lambert <lambert.quentin@gmail.com> wrote:
>> > 
>> >> Replace occurences of the pci api by appropriate call to the dma api.
>> >> 
>> > 
>> > Drivers/ide is obsolete. It probably ought to go at this point but even
>> > so it exists solely in case of a problem or compatibility issue with
>> > drivers/ata. Cleaning it up without testing all the drivers makes no
>> > sense IMHO. Cleaning it up and testing them doesn't make much sense
>> > either.
>> 
>> It's a straightforward transformation, that actually evaluates to what
>> the definitions of the deprecated pci DMA interfaces are defined to.
> 
> Almost, except that it uses GFP_KERNEL instead of GFP_DMA.  But I
> reviewed it and I think it's fine. Quentin sent a GFP_ATOMIC patch as
> the first version and I asked him to redo it.  Maybe I shouldn't have
> done that...

No, I'm fine with that part too, don't worry.
