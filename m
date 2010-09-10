From: David Miller <davem@davemloft.net>
Date: Fri, 10 Sep 2010 21:40:44 +0000
Subject: Re: [patch] vxge: potential NULL dereference
Message-Id: <20100910.144044.90810785.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100910115423.GC5959@bicker>
	<20100910.133255.137830993.davem@davemloft.net>
	<20100910213214.GH22321@exar.com>
In-Reply-To: <20100910213214.GH22321@exar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jon.mason@exar.com
Cc: error27@gmail.com, Ramkrishna.Vepa@exar.com, Sivakumar.Subramani@exar.com, Sreenivasa.Honnur@exar.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Jon Mason <jon.mason@exar.com>
Date: Fri, 10 Sep 2010 17:32:15 -0400

> It is possible to the vpath to be NULL in this array if it is not
> populated in __vxge_hw_vp_initialize due to the vpath being masked off
> my the adapter.  vxge_hw_device_begin_irq calls
> __vxge_hw_vpath_alarm_process on all possible vpaths regardless of
> their allocation.  This is the case we need to worry about.
> 
> It is not an issue because in the first instance of the vpath being
> NULL, its sets the alarm_event to be VXGE_HW_EVENT_UNKNOWN.  The first
> check in the out2 error path checks for VXGE_HW_EVENT_UNKNOWN and
> returns.  So its not possible to hit this...though it is ugly code.  I
> welcome a reworking of the code to something mroe elegant. :)

Aha, I see, thanks for explaining this.
