From: "Ronald G. Minnich" <rminnich@lanl.gov>
Date: Fri, 21 Jan 2005 04:35:59 +0000
Subject: Re: [openib-general] Re: [KJ] [RFC] TODO file cleanups
Message-Id: <Pine.LNX.4.58.0501202133380.3215@linux.site>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============40226346987272676=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============40226346987272676==
Content-Type: TEXT/PLAIN; charset=US-ASCII



On Thu, 20 Jan 2005, Grant Grundler wrote:

> I think you overlooked the fact that include/linux/rcupdate.h is
> published under the GPL. Not "dual GPL/BSD". Someone can't take code
> that uses linux's RCU and ship it under a BSD license. There are
> "consumers" of openib.org that want to do that. ergo we can't use RCU
> unless they are willing to give that up.

Does this open up the possibility of a GPL-only "fork" in the code, i.e. 
somebody:
- takes the code, and puts it in another repo somewhere
- adds in RCU
- makes it available to others but only under GPL due to RCU inclusion
- now we have an openib fork that is GPL by definition, that can't be 
  BSD due to inclusion of RCU?

Seems almost inevitable as soon as people really want "Feature XYZ" from 
Linux in their openib code base.

ron

--===============40226346987272676==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============40226346987272676==--
