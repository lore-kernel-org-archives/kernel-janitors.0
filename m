From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Tue, 18 Jan 2005 17:45:43 +0000
Subject: Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups
Message-Id: <20050118174543.GA3238@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============19687148567016344=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============19687148567016344==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 18, 2005 at 09:19:40AM -0800, Roland Dreier wrote:
>     Matthew> Funny you should mention that.
> 
>     Matthew> drivers/infiniband/ulp/ipoib/ipoib_ib.c: yield();
>     Matthew> drivers/infiniband/ulp/ipoib/ipoib_ib.c: yield();
> 
>     Matthew> *SLAP*.
> 
> ouch ;)
> 
> What should those uses of yield() be replaced with?  The loops are
> polling for pending work to finish up on an exit path, and don't have
> any strict timing requirements.  cond_resched() seems a bit
> heavyweight, since we don't need to run for our whole time slice.  We
> could do msleep(0) or msleep(1) but I don't quite see why that's much
> of an improvement.

I'm not an expert by any means, but I would *really* appreciate it if you would
not call msleep(0). Just because the function currently has the odd behavior of
sleeping for an extra jiffy, I don't want anyone to get the idea to call
msleep(0) in their drivers! :) It just seems misleading. Call msleep(1) if you
are ok with a millisecond delay (or longer). Currently it will sleep for a
millisecond + 1 jiffy, but hopefully we will eventually be able to implement
accurate delays, in which case it is most important that the intent of the
author (IMO masked by msleep(0)) be clear.

Thanks,
Nish

--===============19687148567016344==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============19687148567016344==--
