From: maks attems <janitor@sternwelten.at>
Date: Sun, 13 Jun 2004 13:39:10 +0000
Subject: Re: [Kernel-janitors] panic todo?
Message-Id: <20040613133910.GD4253@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57658474824769823=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <200406111926.i5BJQV3E015754@sirius.cs.pdx.edu>
In-Reply-To: <200406111926.i5BJQV3E015754@sirius.cs.pdx.edu>
To: kernel-janitors@vger.kernel.org

--===============57658474824769823==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, 12 Jun 2004, Randy.Dunlap wrote:

> On Sat, 12 Jun 2004 11:53:36 +0200 (Walter Harms) wrote:
> 
> | 
> | hi,
> | just for my understanding. i would exspect a halt on panic()
> | while a machine_reboot() is a reboot !?
> 
> RTSL.  or read Documentation/kernel-parameters.txt:

an interesting article on the topic from Jonathan Corbet:
http://lwn.net/Articles/87684/
features a disk dump patch.

a++ maks

--===============57658474824769823==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57658474824769823==--
