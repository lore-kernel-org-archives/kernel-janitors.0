From: Domen Puncer <domen@coderock.org>
Date: Sun, 09 May 2004 13:07:31 +0000
Subject: Re: [Kernel-janitors] [patch 2.6.6-rc3 0/16] remove old kernel ifdefs
Message-Id: <20040509130731.GA1626@masina>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============66443383132932587=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040508233813.GA1636@masina>
In-Reply-To: <20040508233813.GA1636@masina>
To: kernel-janitors@vger.kernel.org

--===============66443383132932587==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 09, 2004 at 02:10:14PM +0200, Arnd Bergmann wrote:
> On Sunday 09 May 2004 01:38, Domen Puncer wrote:
> > Patches to remove some old ifdefs
> 
> Did you to run Randy's scripts/checkversion.pl script over the changed
> files? I'd guess that you can remove most of the #include <linux/version.h>
> from them as well.

Good idea, 8 patches updated.
I'm not flooding you guys again, it's trivial update, get them at:
http://coderock.org/kernel/janitor/old_ifdefs-take2/

--===============66443383132932587==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============66443383132932587==--
