From: Carlo Perassi <carlo@linux.it>
Date: Wed, 03 Nov 2004 07:43:02 +0000
Subject: Re: [KJ] [PATCH] driver/net/tg3.c: some s/int/unsigned int
Message-Id: <20041103074302.GB3918@voyager>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============30315747658787928=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20041102101835.GA4083@voyager>
In-Reply-To: <20041102101835.GA4083@voyager>
To: kernel-janitors@vger.kernel.org

--===============30315747658787928==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

> 	pedantic comment: Shouldn't you change the function header to 
> 	"static unsigned int", instead of forcing a cast back to int on return?

fiber_autoneg is called just one time
(in tg3_setup_fiber_by_hand as if (fiber_autoneg(...)))
so you are right
I will send a new version later

-- 
Carlo Perassi - http://www.linux.it/~carlo/

--===============30315747658787928==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============30315747658787928==--
