From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 03 Mar 2005 20:32:15 +0000
Subject: Re: [KJ] [RFC][PATCH 2/5] char/tpqic02: use poll_event*() interface
Message-Id: <20050303203215.GA16078@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============001609283920839033=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050303182541.GE11600@us.ibm.com>
In-Reply-To: <20050303182541.GE11600@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============001609283920839033==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Mar 03, 2005 at 08:16:54PM +0100, walter harms wrote:
> 
> 
> 
> Nishanth Aravamudan wrote:
> >Hi,
> >
> >Description: Use new poll_event*() interface to encapsulate sleep-loops.
> >
> >Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
> >
> >--- 2.6.11-kj-v/drivers/char/tpqic02.c	2005-03-01 
> >23:38:09.000000000 -0800
> >+++ 2.6.11-kj/drivers/char/tpqic02.c	2005-03-03 10:23:59.000000000 -0800
> >@@ -527,18 +527,14 @@ static int wait_for_ready(time_t timeout
> > 		return TE_OK;	/* covers 99.99% of all calls */
> > 
> > 	/* Then use schedule() a few times */
> >-	spin_t = 3;		/* max 0.03 sec busy waiting */
> >+	spin_t = 3;		/* request max 0.003 sec busy waiting */
> 
> > 	if (spin_t > timeout)
> > 		spin_t = timeout;
> > 	timeout -= spin_t;
> 
> 
> hi nish,
> 	the code above looks like:  timeout%=spin_t;

Could be, but one thing at a time :)

> the poll*() looks reasonable. perhaps its better to use functions ?

I used macros so that the @condition could be passed in as a parameter
(not possible, at least easily, with functions, I don't think).

> As user i would like to know WHY the wait terminated, it may be 
> important to know if a signal or timeout occured, are there ways to find 
> out ?

I certainly could change the macros to respond in the same way that
wait_event*() do.

To the list, does that seem like a more reasonable approach?

Thanks,
Nish

--===============001609283920839033==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============001609283920839033==--
