From: Pavel Machek <pavel@ucw.cz>
Date: Thu, 03 Feb 2005 10:38:58 +0000
Subject: [KJ] Re: [linux-pm] Re: driver model u32 -> pm_message_t
Message-Id: <20050203103857.GB1389@elf.ucw.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============81829416121837895=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050125194710.GA1711@elf.ucw.cz> <yq0brb3qs74.fsf@jaguar.mkp.net> <20050202095014.GA12955@elf.ucw.cz> <20050202095739.GB12955@elf.ucw.cz> <yq0y8e6ovqt.fsf@jaguar.mkp.net>
In-Reply-To: <yq0y8e6ovqt.fsf@jaguar.mkp.net>
To: Jes Sorensen <jes@wildopensource.com>
Cc: linux-pm@osdl.org, kernel-janitors@osdl.org, kernel list <linux-kernel@vger.kernel.org>

--===============81829416121837895==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

> >> > Sorry for being late responding to this, but I'd say this is a
> >> prime > example for typedef's considered evil (see Greg's OLS talk
> >> ;).
> >> > 
> >> > It would be a lot cleaner if it was made a struct and then
> >> passing a > struct pointer as the argument instead of passing the
> >> struct by value > as you do right now.
> >> 
> >> Sorry, can't do that. That would require flag day and change
> >> everything at once. That is just not feasible. When things are
> >> settled, it is okay to change it to struct passed by value.. It is
> >> small anyway and at least we will not have problems with freeing it
> >> etc.
> 
> Pavel> Well, we could switch to passing struct by reference
> 
> Pavel> (typedef struct pm_message *pm_message_t)
> 
> Pavel> , but AFAICS it would only bring us problems with lifetime
> Pavel> rules etc. Lets not do it.  Pavel
> 
> This way you end up hiding what is really going on, the very problem
> of using typedefs. If the change is really needed why not get it right
> in the first go?

Because it is impossible? 

[You can't change all drivers at once in incompatible way. See
previous discussion, about half a year ago.]
								Pavel
-- 
People were complaining that M$ turns users into beta-testers...
...jr ghea gurz vagb qrirybcref, naq gurl frrz gb yvxr vg gung jnl!

--===============81829416121837895==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============81829416121837895==--
