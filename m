From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Thu, 11 Aug 2005 03:42:55 +0000
Subject: Re: [KJ] Re: Log2 all through the kernel?
Message-Id: <20050811034255.GA19893@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============03834224752197013=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1123689284.5437.10.camel@localhost.localdomain>
In-Reply-To: <1123689284.5437.10.camel@localhost.localdomain>
To: kernel-janitors@vger.kernel.org

--===============03834224752197013==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 11, 2005 at 01:03:14AM +0200, Rene Herman wrote:
> Erik Mouw wrote:
> >On Wed, Aug 10, 2005 at 05:54:44PM +0200, Oliver Korpilla wrote:
> >>Wouldn't it be more sensible to supply one portable one, with bit
> >>shifts, and people with a need for O(1) timing could implement it using
> >>an array?
> >
> >Send a patch to the linux-kernel mailing list and see what happens.
> 
> Sticking a few defines in a header somewhere should do, I believe:
> 
> #define floor_log2(x) (fls(x) - 1)
> #define ceil_log2(x) (fls((x) - 1)

IMO, one of them should be just "log2".


--===============03834224752197013==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============03834224752197013==--
