From: maximilian attems <janitor@sternwelten.at>
Date: Thu, 27 May 2004 21:50:21 +0000
Subject: Re: [Kernel-janitors] introduction and first questions
Message-Id: <20040527215021.GC1598@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============44705593058733606=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <40B50019.7040607@web.de>
In-Reply-To: <40B50019.7040607@web.de>
To: kernel-janitors@vger.kernel.org

--===============44705593058733606==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hi yoon,

On Wed, 26 May 2004, Yoon Soo wrote:

...
> I created the patch like mentioned in the patchsubmitting-howto of the 
> source documentation, and have tested it. What are now the further 
> steps, just sending the patch as attachement to this list? Another 
> question is, which original source code version should be taken..2.6.6 
> (as I did) or the most actual from the cvs tree?

the more actual the better, but mention on which version your patch
applies. please send the patch inline to the kj mailinglist, not attached.
take a look at 6) -> SubmittingPatches

do take care not to introduce trailing space
or to convert tabs into spaces 
quick  egrep -n "^\+(.* $|        )" helps.
do not forget to mention in your description the testing 
(just compiled in lack of hardware, or actually run).
 
> Very many thanks in advance for helping me making the first steps ;)

you' ll get more feedback as soon your patches lands.
if you don't get any feedback that may also be a good sign,
and your patch may get into next kj patch set.

good luck
a++ maks


--===============44705593058733606==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============44705593058733606==--
