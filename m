From: Matthew Wilcox <matthew@wil.cx>
Date: Fri, 24 Sep 2004 18:21:13 +0000
Subject: Re: [Kernel-janitors] [PATCH 2.6.9-rc2 28/38] net/pcnet32: replace
Message-Id: <20040924182113.GD16153@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============45532399432529247=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040924180825.GH1757@us.ibm.com>
In-Reply-To: <20040924180825.GH1757@us.ibm.com>
To: kernel-janitors@vger.kernel.org

--===============45532399432529247==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 24, 2004 at 11:08:25AM -0700, Nishanth Aravamudan wrote:
> Any comments would be appreciated.
> +++ 2.6.9-rc1-mm4/drivers/net/pcnet32.c	2004-09-13 14:38:47.000000000 -0700
> @@ -847,7 +847,7 @@ static int pcnet32_phys_id(struct net_de
>      if ((!data) || (data > (u32)(MAX_SCHEDULE_TIMEOUT / HZ)))
>      data = (u32)(MAX_SCHEDULE_TIMEOUT / HZ);
>  
> -    schedule_timeout(data * HZ);
> +    msleep_interruptible(data * 1000);
>      del_timer_sync(&lp->blink_timer);

Surely that needs to be:

	if ((!data) || (data > (u32)(MAX_SCHEDULE_TIMEOUT / 1000))
		data = (u32)(MAX_SCHEDULE_TIMEOUT / 1000)
	msleep_interruptible(data * 1000);

(and actually, this should be pulled into net/core/ethtool.c out of each
driver).

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============45532399432529247==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============45532399432529247==--
