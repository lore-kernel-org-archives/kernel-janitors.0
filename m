From: Bernd Petrovitsch <bernd@firmix.at>
Date: Tue, 13 Dec 2005 14:19:51 +0000
Subject: Re: [KJ] de-initialization of = 0 globals
Message-Id: <1134483591.30759.20.camel@tara.firmix.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============57016246465822107=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <63769.192.96.150.57.1134482519.squirrel@mail.interexcel.co.za>
In-Reply-To: <63769.192.96.150.57.1134482519.squirrel@mail.interexcel.co.za>
To: kernel-janitors@vger.kernel.org

--===============57016246465822107==
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, 2005-12-13 at 16:01 +0200, Jaco Kroon wrote:
[...]
> Also, if I'm going to be sending patches for these it's obviously a patch
> per affected file, so if I'm going to be sending let's say a hundred of
> these patches it's still a mail per patch or do I just archive them
> somehow and attach them or do I place them on a webserver and mail a uri
> to them?

Make one patch per subsystem (unless told otherwise from core LKML
personnel directly) since
-) these are trivial patches and
-) you actually want to mail them to the relevant
   maintainer/mailing-list and Cc: LKML/k-j only.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services


--===============57016246465822107==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============57016246465822107==--
