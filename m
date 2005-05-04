From: Adrian Bunk <bunk@stusta.de>
Date: Wed, 04 May 2005 12:28:18 +0000
Subject: Re: [KJ] Work on MODULE_PARM must die?
Message-Id: <20050504122818.GQ3592@stusta.de>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============15481979839455384=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <1115185628.3865.6.camel@itchy.kirkandsheila.com>
In-Reply-To: <1115185628.3865.6.camel@itchy.kirkandsheila.com>
To: kernel-janitors@vger.kernel.org

--===============15481979839455384==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 03, 2005 at 10:47:08PM -0700, Kirk True wrote:

> Hi all,

Hi Kirk,

> Is anyone working on "MODULE_PARM must die"? 2.6.12-rc3-kj.patch.bz2
> doesn't show any matches. Is it kosher to work on?

-mm contains several patches that remove MODULE_PARM.

MODULE_PARM removal is a relative active task on linux-kernel and IMHO a 
bad starting point for you.

> Thanks,
> Kirk

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


--===============15481979839455384==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============15481979839455384==--
