From: David Miller <davem@davemloft.net>
Date: Sun, 19 Sep 2010 18:33:47 +0000
Subject: Re: [patch] ixgbevf: potential NULL dereference on allocation
Message-Id: <20100919.113347.39185228.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20100910115234.GB5959@bicker>
	<20100910.132137.212394088.davem@davemloft.net>
	<43F901BD926A4E43B106BF17856F0755F66821BC@orsmsx508.amr.corp.intel.com>
In-Reply-To: <43F901BD926A4E43B106BF17856F0755F66821BC@orsmsx508.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregory.v.rose@intel.com
Cc: error27@gmail.com, jeffrey.t.kirsher@intel.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: "Rose, Gregory V" <gregory.v.rose@intel.com>
Date: Tue, 14 Sep 2010 09:57:46 -0700

> I've taken up your suggestions and implemented them (roughly) as
> suggested below.  After looking at the code I had to agree that it
> would be very confusing for a user to set new ring parameters, have
> the call partially succeed but get no error and then look at the
> parameters again and not see what he expected.  Now the code will do
> as suggested and just unwind all prior allocations and return an
> error if the new ring sizing didn't work.  The user will be left
> with the prior ring size allocations which is probably what he would
> expect.
>
> The patch is going to be posted internally and after it goes through
> our review process it will be posted to netdev.

Thanks for doing this work Greg.
