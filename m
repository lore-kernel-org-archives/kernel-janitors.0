From: "Kaneda, Erik" <erik.kaneda@intel.com>
Date: Fri, 14 Feb 2020 17:07:53 +0000
Subject: RE: [PATCH] ACPICA: Fix a typo in acuuid.h
Message-Id: <BL0PR11MB29466C25466F5A88B4D4F5B9F0150@BL0PR11MB2946.namprd11.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200214063003.29741-1-christophe.jaillet@wanadoo.fr>
 <2712088.SaWAGPlJqS@kreacher>
In-Reply-To: <2712088.SaWAGPlJqS@kreacher>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: "lenb@kernel.org" <lenb@kernel.org>, "Moore, Robert" <robert.moore@intel.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, "devel@acpica.org" <devel@acpica.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>



> -----Original Message-----
> From: linux-acpi-owner@vger.kernel.org <linux-acpi-
> owner@vger.kernel.org> On Behalf Of Rafael J. Wysocki
> Sent: Friday, February 14, 2020 2:02 AM
> To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>; Kaneda, Erik
> <erik.kaneda@intel.com>
> Cc: lenb@kernel.org; Moore, Robert <robert.moore@intel.com>; linux-
> acpi@vger.kernel.org; devel@acpica.org; linux-kernel@vger.kernel.org;
> kernel-janitors@vger.kernel.org
> Subject: Re: [PATCH] ACPICA: Fix a typo in acuuid.h
> 
> On Friday, February 14, 2020 7:30:03 AM CET Christophe JAILLET wrote:
> > The comment related to the ending of the include guard should be
> > related to __ACUUID_H__, not __AUUID_H__ (i.e. 'C' is missing).
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> 
> Erik, please route this through the upstream.

Thanks for your patch!

I'll add it to our next release (in March)

Erik
> 
> Thanks!
> 
> > ---
> >  include/acpi/acuuid.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/acpi/acuuid.h b/include/acpi/acuuid.h index
> > 9dd4689a39cf..9e1367b19069 100644
> > --- a/include/acpi/acuuid.h
> > +++ b/include/acpi/acuuid.h
> > @@ -57,4 +57,4 @@
> >  #define UUID_THERMAL_EXTENSIONS         "14d399cd-7a27-4b18-8fb4-
> 7cb7b9f4e500"
> >  #define UUID_DEVICE_PROPERTIES          "daffd814-6eba-4d8c-8a91-
> bc9bbf4aa301"
> >
> > -#endif				/* __AUUID_H__ */
> > +#endif				/* __ACUUID_H__ */
> >
> 
> 
> 
