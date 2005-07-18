From: Alexey Dobriyan <adobriyan@gmail.com>
Date: Mon, 18 Jul 2005 22:58:14 +0000
Subject: Re: [KJ] RFC - trailing whitespace cleanup script
Message-Id: <20050718225814.GC27059@mipter.zuzino.mipt.ru>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="===============35094948675809823=="
List-Id: <kernel-janitors.vger.kernel.org>
References: <42D9C495.2090405@divsol.com>
In-Reply-To: <42D9C495.2090405@divsol.com>
To: kernel-janitors@vger.kernel.org

--===============35094948675809823==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 18, 2005 at 10:11:51AM -0600, Jim Cromie wrote:
> Alexey Dobriyan wrote:
> 
> >On Mon, Jul 18, 2005 at 03:09:31PM +0200, walter harms wrote:
> > 
> >
> >>that includes an 'indent -kr -i8' ?
> >>   
> >>
> >
> >Of the whole tree? Ick.
> > 
> >
> can you refine that ick ?

Current scripts/Lindent isn't right quite often:
1) misplaces labels

-no_symlink:
+      no_symlink:
 	remove_proc_entry("tty", example_dir);

2) Screws carefully indented C99 initializers

-	.name      = "Ghost Device",
-	.bus_id    = "ghost0",
+	.name = "Ghost Device",
+	.bus_id = "ghost0",

3) Screws carefully indented generic initializers

-	{&master_mtu,     "SIOCGIFMTU",     SIOCGIFMTU},
-	{&master_flags,   "SIOCGIFFLAGS",   SIOCGIFFLAGS},
-	{&master_hwaddr,  "SIOCGIFHWADDR",  SIOCGIFHWADDR},
+	{&master_mtu, "SIOCGIFMTU", SIOCGIFMTU},
+	{&master_flags, "SIOCGIFFLAGS", SIOCGIFFLAGS},
+	{&master_hwaddr, "SIOCGIFHWADDR", SIOCGIFHWADDR},

4) Imagine what will it do with firmware images

5) Some changes one can categorize as "wtf?"
----------------------------------------------------------------------------
 static inline
-struct class_device_attribute *to_class_dev_attr(struct attribute *_attr)
+    struct class_device_attribute *to_class_dev_attr(struct attribute *_attr)
----------------------------------------------------------------------------
-	.attr = {.name = "data", .mode = 0644},
+	.attr = {.name = "data",.mode = 0644},
----------------------------------------------------------------------------
-	ifr.ifr_data = (caddr_t)&info;
+	ifr.ifr_data = (caddr_t) & info;
----------------------------------------------------------------------------
 irongate_read_config(struct pci_bus *bus, unsigned int devfn, int where,
-		     int size, u32 *value)
+		     int size, u32 * value)
----------------------------------------------------------------------------
6-?) Unknown amount of other decreasing readability changes

Though it can be very useful:

1)

	class_dev->class = &firmware_class,	<===
-	class_set_devdata(class_dev, fw_priv);
+	    class_set_devdata(class_dev, fw_priv);

2-?) Unknown amount of increasing readability changes

Conclusion: blind Lindent'ing of huge code blocks is not right thing to
do.


--===============35094948675809823==
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors

--===============35094948675809823==--
