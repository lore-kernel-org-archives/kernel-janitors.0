From: Domen Puncer <domen@coderock.org>
Date: Tue, 18 Jan 2005 14:06:28 +0000
Subject: Re: [KJ] [RFC] TODO file cleanups
Message-Id: <20050118140628.GF19162@nd47.coderock.org>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============23741124227261845=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050117231123.GC19162@nd47.coderock.org>
In-Reply-To: <20050117231123.GC19162@nd47.coderock.org>
To: kernel-janitors@vger.kernel.org

--===============23741124227261845==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On 18/01/05 00:22 +0100, Michael Veeck wrote:
> Hi!
> 
> I just wanted to check on how the general policy on maintaining patches 
> is since I have done the min/max stuff and some still remain in the 
> kernel. Mostly because the maintainers dont seem to incoporate them 
> (isdn-eicorn for example was send nearly one year ago).
> 
> So shall the remaining min/max stuff be left alone or should at least 
> something be written into Documenteation/*.txt, maybe as a hint for 
> future generations?

isdn was updated 11 month ago (!), some patches seem to got merged around
maintainers. As for min/max, i see 3 in -kj, none is isdn.

Maybe a list of files/dirs that are unmaintained / not worth patching?
Like:
drivers/isdn/
fs/devfs/
sound/oss/
broken drivers?

> 
> As another easy task which might be useful for a newbie is to find other 
> dupicate definitions. When looking myself for MinMax macros, I also 
> stumbled over multiple ARRAY_SIZE().
> 
> And then there is still the question if BIT(x) should be made general 
> which also is defined multiple times.

Added those two.


> Domen Puncer schrieb:
> >Hi.
...
Please don't reply on top, and delete non relevant parts of message you
are replying to.


	Domen

--===============23741124227261845==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============23741124227261845==--
