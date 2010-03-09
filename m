From: Julia Lawall <julia@diku.dk>
Date: Tue, 09 Mar 2010 18:49:08 +0000
Subject: Re: [patch] /lib/kobject.c
Message-Id: <Pine.LNX.4.64.1003091947450.27434@ask.diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
References: <hn3pog$8co$1@dough.gmane.org>
In-Reply-To: <hn3pog$8co$1@dough.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, 9 Mar 2010, walter harms wrote:

> 
> 
> Greg KH schrieb:
> > On Mon, Mar 08, 2010 at 10:21:20PM +0100, Christophe Jaillet wrote:
> >> From: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
> >>
> >> Hi, here is a patch against /lib/kobject.c.
> >>
> >> No need to allocate more memory than usefull.
> >> Here, we only need 12 (strlen("DEVPATH_OLD=")) + 1 (\0) extra bytes. This
> >> saves 2 bytes !!! and improve readability IMO.
> > 
> > Are you sure this really is even noticable anywhere?  The memory is then
> > freed, right?  So no real memory savings happen here.
> > 
> >>
> >> Signed-off-by: Christophe Jaillet <christophe.jaillet@wanadoo.fr>
> >>
> >> ---
> >>
> >> diff --git a/lib/kobject.c b/lib/kobject.c
> >> index 0487d1f..958cc76 100644
> >> --- a/lib/kobject.c
> >> +++ b/lib/kobject.c
> >> @@ -412,7 +412,7 @@ int kobject_rename(struct kobject *kobj, const char
> >> *new_name)
> >>    error = -ENOMEM;
> >>    goto out;
> > 
> > Your patch is line-wrapped and the tabs converted to spaces, making it
> > impossible to apply :(
> > 
> >>   }
> >> - devpath_string = kmalloc(strlen(devpath) + 15, GFP_KERNEL);
> >> + devpath_string = kmalloc(12 + strlen(devpath) + 1, GFP_KERNEL);
> >>   if (!devpath_string) {
> >>    error = -ENOMEM;
> >>    goto out;
> >>
> >>
> 
> this is actualy done:
> sprintf(devpath_string, "DEVPATH_OLD=%s", devpath);
> 
> i have seen something that works like asprintf()
> devpath_string =  kasprintf(GFP_KERNEL,"DEVPATH_OLD=%s",devpath);
> just put it in place of the kmalloc
> The interessting question is:
> can devpath be manipulated to be VERY large at some point ?
> 
> @julia:
> i did not check but i can imagine that the pattern
> A=kmalloc() ... sprintf(a," ",b);
> 
> come up at some points inside the kernel since a lot of programmers
> do not know about asprint().

Indeed, I find around 40 occurrences, such as:

diff -u -p /var/linuxes/linux-next/arch/ia64/pci/pci.c /tmp/nothing
--- /var/linuxes/linux-next/arch/ia64/pci/pci.c	2010-03-01 07:52:48.000000000 +0
100
+++ /tmp/nothing
@@ -366,11 +366,9 @@ pci_acpi_scan_root(struct acpi_device *d
 		if (!controller->window)
 			goto out2;
 
-		name = kmalloc(16, GFP_KERNEL);
 		if (!name)
 			goto out3;
 
-		sprintf(name, "PCI Bus %04x:%02x", domain, bus);
 		info.bridge = device;
 		info.controller = controller;
 		info.name = name;

(- means "item of interest", not necessarily something to remove)

julia
