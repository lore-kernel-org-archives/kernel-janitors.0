From: Matthew Wilcox <willy@debian.org>
Date: Tue, 01 Jun 2004 01:32:40 +0000
Subject: Re: [Kernel-janitors] [Patch] eisa_h driverdata access
Message-Id: <20040601013240.GK5850@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============83689936377337193=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040601001308.GA27070@nlx.t-online.de>
In-Reply-To: <20040601001308.GA27070@nlx.t-online.de>
To: kernel-janitors@vger.kernel.org

--===============83689936377337193==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 01, 2004 at 02:13:08AM +0200, yoonsoo@web.de wrote:
> hope I fixed all errors from last time.

Your spacing is still messed up.  Linux style is 1-tab indents.

> @@ -74,12 +74,12 @@ void eisa_driver_unregister (struct eisa
>  /* Mimics pci.h... */
>  static inline void *eisa_get_drvdata (struct eisa_device *edev)
>  {
> -        return edev->dev.driver_data;
> +  return dev_get_drvdata(edev->dev);
>  }


-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain

--===============83689936377337193==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============83689936377337193==--
