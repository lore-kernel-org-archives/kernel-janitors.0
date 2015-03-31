From: "Wyborny, Carolyn" <carolyn.wyborny@intel.com>
Date: Tue, 31 Mar 2015 18:06:52 +0000
Subject: RE: [E1000-devel] [patch] igb: cleanup igb_enable_mas() a bit
Message-Id: <9BBC4E0CF881AA4299206E2E1412B6264FDA1600@ORSMSX102.amr.corp.intel.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <9B4A1B1917080E46B64F07F2989DADD6534E3B53@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <9B4A1B1917080E46B64F07F2989DADD6534E3B53@ORSMSX114.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

[..]
> I'm looking into this and while the code fix is correct, I'm not sure the
> underlying code is correct.
> 
> Unfortunately, the person who knows the most about this is out for spring
> break. Can we hold off on this patch?

Yes, the intended fix is good.  In addition though, I think igb_enable_mas() should be changed to void and the call to it also modified, since there's no way to fail the enable.  A previous implementation had a way to fail, but the current does not.

Thanks,

Carolyn
