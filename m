From: Julia Lawall <julia.lawall@lip6.fr>
Date: Wed, 01 Jul 2015 09:35:46 +0000
Subject: Re: [PATCH] Staging: unisys: virtpci: fixed a brace coding style issue
Message-Id: <alpine.DEB.2.10.1507011134090.2374@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <55930BB1.10502@zoho.com> <20150701065749.GA2411@sudip-PC> <55939890.6090903@zoho.com> <alpine.DEB.2.10.1507010959260.2374@hadrien> <5593B0EA.1070101@zoho.com>
In-Reply-To: <5593B0EA.1070101@zoho.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sohny Thomas <sohnythomas@zoho.com>
Cc: Julia Lawall <julia.lawall@lip6.fr>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>, benjamin.romer@unisys.com, david.kershner@unisys.com, bryan.thompson@unisys.com, erik.arfvidson@unisys.com, devel@driverdev.osuosl.org, gregkh@linuxfoundation.org, sparmaintainer@unisys.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org



On Wed, 1 Jul 2015, Sohny Thomas wrote:

> >>>>   	i = virtpci_device_del(NULL /*no parent bus */, VIRTHBA_TYPE,
> >>>>   			       &scsi.wwnn, NULL);
> >>>> -	if (i) {
> >>>> +	if (i)
> >>>>   		return 1;
> >>>> -	}
> >>>> -	return 0;
> >>>> +	else
> >>>> +		return 0;
> >>> No, now this will introduce a new checkpatch warning that "else is not
> >>> required after return". why did you introduce this "else"?
> >> I did this so that the code is more readable and understandable, I checked and
> >> checkpatch didn't call this out , so its clean.
> >>
> >> Otherwise the above code looks like this
> >>
> >> if(i)
> >>    return 1;
> >> return 0;
> >
> > That looks fine.
> >
> > I haven't looked at the code in detail.  Is it normal that the return
> > values seem to be 0 1 and -1?  Which values represent success and which
> > represent an error?  It is nicer to have the errors under if and success
> > as a direct return at the end.
> Here in this driver directory, return 1 means SUCCESS and return 0 means FAILURE

What is -1?

> So you mean my code change is fine?

I think it would be best to have the success case that is not under an if.
So if (!i)
     return 0;
   return 1;

I guess some day the driver would need more normal error codes?

julia
