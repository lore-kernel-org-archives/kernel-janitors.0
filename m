From: maximilian attems <janitor@sternwelten.at>
Date: Mon, 24 May 2004 15:44:18 +0000
Subject: Re: [Kernel-janitors] Re: kjt patch-set for 2.6.7-rc1
Message-Id: <20040524154418.GK1949@sputnik.stro.at>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============46324050121356986=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20040524140529.GA23877@nd47>
In-Reply-To: <20040524140529.GA23877@nd47>
To: kernel-janitors@vger.kernel.org

--===============46324050121356986==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, 24 May 2004, Domen Puncer wrote:

 ..
> Great idea!
> 
> I have one suggestion, try egrep -n "^\+(.* $|        )", to see if
> patches introduce trailing spaces or spaces instead of tabs.
> This also bit me, so below are links to 2 updated patches.

thanks for your nice feedback and hints, 
for the next releases i'll check the patches.
 
> > +remove-old-ifdefs-fasttimer
> http://coderock.org/kernel/janitor/old_ifdefs-take3/arch-cris-arch-v10-kernel-fasttimer.c_take2
> > +remove-old-ifdefs-mtdcore
> http://coderock.org/kernel/janitor/old_ifdefs-take3/drivers-mtd-mtdcore.c_take2
> > +yield-nicedelay-sb1000
> > +yield-schedtmout-megaraid
> > +yield-schedtmout-sonycd535
> 
> These are the other patches that contain spaces.

yours weren't run with '-p' diff switch (-> SubmittingPatches ;)
for now i've handedited those, didn't see further spaces,
patch a bit smaller now and lot cleaner!!!

great
a++ maks


--===============46324050121356986==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============46324050121356986==--
