From: Pavel Machek <pavel@ucw.cz>
Date: Wed, 02 Feb 2005 09:50:14 +0000
Subject: [KJ] Re: driver model u32 -> pm_message_t conversion: help needed
Message-Id: <20050202095014.GA12955@elf.ucw.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============18466172702490402=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050125194710.GA1711@elf.ucw.cz> <yq0brb3qs74.fsf@jaguar.mkp.net>
In-Reply-To: <yq0brb3qs74.fsf@jaguar.mkp.net>
To: Jes Sorensen <jes@wildopensource.com>
Cc: kernel-janitors@osdl.org, kernel list <linux-kernel@vger.kernel.org>, linux-pm@osdl.org, benh@kernel.crashing.org

--===============18466172702490402==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi!

> Pavel> Hi!  Two Long time ago, BenH said that making patches is easy,
> Pavel> so I hope to get his help now... And will probably need more.
> 
> Pavel> Suspend routines change, slowly.
> 
> Pavel> - int (*suspend)(struct device * dev, u32 state); + int
> Pavel> (*suspend)(struct device * dev, pm_message_t state);
> 
> Pavel> For now u32 is typedef-ed to pm_message_t, but that is not
> Pavel> going to be the case for 2.6.12. What needs to be done is
> Pavel> changing all state parameters from u32 to
> Pavel> pm_message_t. suspend() functions should not use state variable
> Pavel> for now (except for PCI ones, those are allowed to call
> Pavel> pci_choose_state and convert state into pci_power_t, and use
> Pavel> that).
> 
> Sorry for being late responding to this, but I'd say this is a prime
> example for typedef's considered evil (see Greg's OLS talk ;).
> 
> It would be a lot cleaner if it was made a struct and then passing a
> struct pointer as the argument instead of passing the struct by value
> as you do right now.

Sorry, can't do that. That would require flag day and change
everything at once. That is just not feasible. When things are
settled, it is okay to change it to struct passed by value.. It is
small anyway and at least we will not have problems with freeing it
etc.

								Pavel
-- 
People were complaining that M$ turns users into beta-testers...
...jr ghea gurz vagb qrirybcref, naq gurl frrz gb yvxr vg gung jnl!

--===============18466172702490402==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============18466172702490402==--
