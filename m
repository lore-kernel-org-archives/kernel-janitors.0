From: Greg KH <greg@kroah.com>
Date: Tue, 09 Mar 2010 18:12:26 +0000
Subject: Re: [patch] /lib/kobject.c
Message-Id: <20100309181226.GA31027@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <hn3pog$8co$1@dough.gmane.org>
In-Reply-To: <hn3pog$8co$1@dough.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Tue, Mar 09, 2010 at 06:35:27PM +0100, walter harms wrote:
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

Possibly, yes.  But on systems where is is very large, you usually have
very large mounts of memory :)

Either way, you can't manipulate it except if you are root, so all is
fine.

thanks,

greg k-h
