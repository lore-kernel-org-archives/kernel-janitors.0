From: Vojtech Pavlik <vojtech@suse.cz>
Date: Fri, 11 Feb 2005 17:57:00 +0000
Subject: [KJ] Re: [PATCH] Add module autoloading support to input layer
Message-Id: <20050211175700.GA1690@ucw.cz>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============85839697473374765=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <20050211074026.GA1675@ucw.cz>
In-Reply-To: <20050211074026.GA1675@ucw.cz>
To: kernel-janitors@vger.kernel.org

--===============85839697473374765==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 11, 2005 at 09:19:49AM -0800, Stephen Hemminger wrote:
> On Fri, 11 Feb 2005 08:40:26 +0100
> Vojtech Pavlik <vojtech@suse.cz> wrote:
> 
> > On Thu, Feb 10, 2005 at 03:33:40PM -0800, Duncan Palmer wrote:
> > > Hi Vojtech,
> > > 
> > > Currently, the input device layer relies on the input
> > > event handler modules being loaded manually, and
> > > doesn't define any module aliases to support
> > > autloading of these from userspace or in-kernel. 
> > > 
> > > The attached patch defines MODULE_ALIAS_INPUT which
> > > creates modules aliases of the form input-handler-xxx,
> > > where xxx is minor >> 5 (to account for the event
> > > handlers working with a range of minor numbers). It
> > > also modifies input.c to load missing event handler
> > > modules.
> > > 
> > > Does this look good to you? If so, will the powers
> > > that be on KJ please consider applying?
> > 
> > I think that autoloading is a dead end of getting modules into the
> > kernel. The correct way is from the other side - from device discovery
> > and through hotplug.
> > 
> > So I'll not apply your patch.
> 
> There are two parts here: one is adding the aliases and the other
> is the auto loading. The aliases are a good idea even without the auto loading
> because it separates the definition from the implementation and simplifies
> the hotplug handling.

However, hotplug doesn't load the handler modules by module name or
module handler device node number. It loads based on module table
bitmaps that either do or don't match a specific input device.

-- 
Vojtech Pavlik
SuSE Labs, SuSE CR

--===============85839697473374765==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
http://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============85839697473374765==--
