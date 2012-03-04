From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 04 Mar 2012 22:17:04 +0000
Subject: Re: [PATCH] edac: move const pci_device_id tables from __devinitdata to __devinitconst.
Message-Id: <alpine.DEB.2.02.1203042310100.2919@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <791782.71473.bm@smtp128.mail.ukl.yahoo.com> <20120227061300.GC4763@mwanda>
In-Reply-To: <20120227061300.GC4763@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lionel Debroux <lionel_debroux@yahoo.fr>, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org

I also looked at whether PCI_DEVICE and PCI_DEVICE_CLASS could be used 
more often, and came up with the semantic patch shown below.  This should 
work with the current release of Coccinelle.  This affects 40 files, only 
one of which can use PCI_DEVICE_CLASS.  Perhaps it could be useful to 
generalize it.  Again, I don't have time now to look into it in more 
detail, but can provide the results if somone is interested.

julia

@@
identifier id;
expression dev_class, dev_class_mask;
@@

struct pci_device_id id[] = {
   ...,
   {
-   .class = (dev_class), .class_mask = (dev_class_mask),
-   .vendor = PCI_ANY_ID, .device = PCI_ANY_ID,
-   .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID,
+   PCI_DEVICE_CLASS(dev_class,dev_class_mask),
   },
   ...
};

@@
identifier id;
declarer name DEFINE_PCI_DEVICE_TABLE;
expression dev_class, dev_class_mask;
@@

DEFINE_PCI_DEVICE_TABLE(id) = {
   ...,
   {
-   .class = (dev_class), .class_mask = (dev_class_mask),
-   .vendor = PCI_ANY_ID, .device = PCI_ANY_ID,
-   .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID,
+   PCI_DEVICE_CLASS(dev_class,dev_class_mask),
   },
   ...
};

@@
identifier id;
expression vend, dev;
@@

struct pci_device_id id[] = {
   ...,
   {
-   .vendor = (vend), .device = (dev),
-   .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID,
+   PCI_DEVICE(vend,dev),
   },
   ...
};

@@
identifier id;
expression vend, dev;
@@

DEFINE_PCI_DEVICE_TABLE(id) = {
   ...,
   {
-   .vendor = (vend), .device = (dev),
-   .subvendor = PCI_ANY_ID, .subdevice = PCI_ANY_ID,
+   PCI_DEVICE(vend,dev),
   },
   ...
};
