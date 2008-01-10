From: Andi Kleen <andi@firstfloor.org>
Date: Thu, 10 Jan 2008 10:06:57 +0000
Subject: Re: [JANITOR PROPOSAL] Switch ioctl functions to ->unlocked_ioctl
Message-Id: <20080110100657.GB25292@one.firstfloor.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20080108164015.GC31504@one.firstfloor.org> <200801100952.55039.eike-kernel@sf-tec.de> <20080110092528.GA25076@one.firstfloor.org> <200801101102.16971.eike-kernel@sf-tec.de>
In-Reply-To: <200801101102.16971.eike-kernel@sf-tec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Rolf Eike Beer <eike-kernel@sf-tec.de>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, paolo.ciarrocchi@gmail.com, gorcunov@gmail.com

> So if I write my own driver and have never heard of ioctls running on BKL 
> before I can rather be sure that I just can change the interface of the ioctl 
> function, put it in unlocked_ioctl and are fine? Cool.

If you know the BKL is not needed in your code you should use unlocked_ioctl
correct.

-Andi
