From: "Stephen Biggs" <yrgrknmxpzlk@gawab.com>
Date: Tue, 15 Feb 2005 06:42:55 +0000
Subject: Re: [KJ] [PATCH][RESUBMIT][9/21] drivers/net/* - compile warning
Message-Id: <4211B60F.9740.16ED33@localhost>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============61202301881369303=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42113C2C.17871.52BDF2@localhost>
In-Reply-To: <42113C2C.17871.52BDF2@localhost>
To: kernel-janitors@vger.kernel.org

--===============61202301881369303==
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body

On 14 Feb 2005 at 17:15, Dave Jones wrote:

> On Tue, Feb 15, 2005 at 12:02:52AM +0200, Stephen Biggs wrote:
> Content-Description: Mail message body
>  > Description: compile warning cleanup - silence compiler warning for 
>  > unused function that is either actually used as a driver function in a 
>  > table or is truly unused
>  > 
>  > +++ linux-2.6.11-rc3-mm2/drivers/net/ibmlana.c	2005-02-12 17:22:13.000000000 +0200
>  > @@ -901,7 +901,7 @@ static void ibmlana_set_multicast_list(s
>  >  
>  >  static int startslot;		/* counts through slots when probing multiple devices */
>  >  
>  > -static int ibmlana_probe(struct net_device *dev)
>  > +static int __attribute__((unused)) ibmlana_probe(struct net_device *dev)
> 
> It's called in init_module(). I guess you only tried this in the built-in case ?

It compiles both with allyesconfig and allmodconfig.  The "unused" 
attribute is a better solution than #ifdef MODULE.

Please consider applying.

> 
> 		Dave
> 
> 




--===============61202301881369303==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============61202301881369303==--
