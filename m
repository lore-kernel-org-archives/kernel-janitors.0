From: maximilian attems <janitor@sternwelten.at>
Date: Sun, 25 Jul 2004 12:34:26 +0000
Subject: Re: [Kernel-janitors] [announce] 2.6.7-kjt2 patchset
Message-Id: <20040725123426.GD1756@stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============044635486373526767=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040711145358.GG1828@sputnik.stro.at>
In-Reply-To: <20040711145358.GG1828@sputnik.stro.at>
To: kernel-janitors@vger.kernel.org

--===============044635486373526767==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

due to ottawa conference there is a bit of delay in merge,
minor feedback below.

and i'm going on leave, surfing :P
next kjt is due for mid august.
a++ maks


On Sun, 11 Jul 2004, maximilian attems wrote:

> ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> all the patches:
> 
> 
> extraver.patch
> faulty-inits-fbmem.patch
acked by Geert Uytterhoeven, on the way to akpm.

> list_for_each-fs-dcache.patch
> list_for_each-fs-dquot.patch
> list_for_each-fs-jffs.patch
while we are at it also do list_for_each_entry()
needs recheck, which of the list_for_each() patches sould do

> remove-old-ifdefs-mtdcore.patch
mostly done in current linus tree, just left unused include.


--===============044635486373526767==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============044635486373526767==--
