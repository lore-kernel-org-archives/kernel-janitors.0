From: Nishanth Aravamudan <nacc@us.ibm.com>
Date: Thu, 23 Sep 2004 16:07:10 +0000
Subject: [Kernel-janitors] Re: [PATCH][ATM]: [drivers] use msleep() instead
Message-Id: <20040923160710.GB1699@us.ibm.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44350882808528702=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200409212029.i8LKTINv010576@ginger.cmf.nrl.navy.mil>
In-Reply-To: <200409212029.i8LKTINv010576@ginger.cmf.nrl.navy.mil>
To: chas3@users.sourceforge.net
Cc: netdev@oss.sgi.com, davem@redhat.com, kernel-janitors@lists.osdl.org

--===============44350882808528702==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 21, 2004 at 04:29:19PM -0400, chas williams (contractor) wrote:

<snip>
> diff -Nru a/drivers/atm/lanai.c b/drivers/atm/lanai.c
> --- a/drivers/atm/lanai.c	2004-09-21 12:48:17 -04:00
> +++ b/drivers/atm/lanai.c	2004-09-21 12:48:17 -04:00
> @@ -813,7 +813,7 @@
>  			DPRINTK("read, write = %d, %d\n", read, write);
>  			break;
>  		}
> -		schedule_timeout(HZ / 25);
> +		msleep(4);

Somehow this got changed for msleep(40); to msleep(4); !! :) The patch I
sent on 15 September had msleep(40); in it, at least. If you could make
the change in your bk, that would be great!

-Nish

--===============44350882808528702==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44350882808528702==--
