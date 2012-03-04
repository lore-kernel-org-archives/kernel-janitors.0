From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sun, 04 Mar 2012 22:09:59 +0000
Subject: Re: [PATCH] edac: move const pci_device_id tables from __devinitdata to __devinitconst.
Message-Id: <alpine.DEB.2.02.1203042256550.2919@hadrien>
List-Id: <kernel-janitors.vger.kernel.org>
References: <791782.71473.bm@smtp128.mail.ukl.yahoo.com> <20120227061300.GC4763@mwanda>
In-Reply-To: <20120227061300.GC4763@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Lionel Debroux <lionel_debroux@yahoo.fr>, linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org, kernel-janitors@vger.kernel.org

On Mon, 27 Feb 2012, Dan Carpenter wrote:

> On Sun, Feb 26, 2012 at 09:15:29PM +0100, Lionel Debroux wrote:
>> Based on PaX and earlier work by Andi Kleen.
>>
>> Patch against current Linus tree.
>>
>
> Always write patches against linux-next.  We can't apply this.
>
> I wonder if we could make a coccinelle script for this.

I made two semantic patches for this.  Coccinelle can't match things like 
__devinitdata, so the first one is completely unsafe:

@@
identifier id;
declarer name DEFINE_PCI_DEVICE_TABLE;
@@

-const struct pci_device_id id[] +DEFINE_PCI_DEVICE_TABLE(id)    { ... };

In the second version, I try to figure out whether __devinitdata could be 
there, whether it is or not.  This only allows the array to appear as the 
argument of MODULE_DEVICE_TABLE or in the id_table of a static pci_driver 
structure.  This structure, which I call pcidr, can furthermore only be 
used in function calls of the form f(&pcidr) in the module_init and 
module_exit.  I could have specified the function to be 
pci_register_driver or pci_unregister_driver, but I saw one example that 
had something else in the register case, so I decided to be more general.

The simple semantic patch above affects 168 files, and the safer one below 
affects 145.  On the other hand, the latter is missing some cases where 
the structure is annotated __devinitdata, so my safe strategy is too 
conservative.

In any case, one would have to check the results carefully.

Unfortunately, both semantic patches only work with the soon to be 
released version 1.0.0-rc12.

I don't have time now to check the results and submit patches, but if 
someone else wants to, I could provide the actual results.

julia

-----

The safe(r) semantic patch:

@r@
identifier id;
@@

const struct pci_device_id id[] = { ... };

@one@
expression pci;
identifier r.id;
position p1;
declarer name MODULE_DEVICE_TABLE;
@@

MODULE_DEVICE_TABLE(pci, id@p1);

@str@
identifier pcidr;
identifier r.id;
position pstr;
@@

static struct pci_driver pcidr = {
         .id_table       = id@pstr,
};

@ini@
identifier init;
declarer name module_init;
@@

module_init(init);

@two@
identifier ini.init;
identifier reg;
identifier str.pcidr;
position p2;
@@

init(...) { <... reg(&pcidr@p2) ...> }

@ex@
identifier exit;
declarer name module_exit;
@@

module_exit(exit);

@three@
identifier ex.exit;
identifier unreg;
identifier str.pcidr;
position p3;
@@

exit(...) { <... unreg(&pcidr@p3) ...> }

@badstr expression@
identifier str.pcidr;
position p != {two.p2,three.p3};
@@

pcidr@p

@badid expression@
identifier r.id;
position p != {one.p1,str.pstr};
@@

id@p

@depends on !badstr && !badid@
identifier r.id;
declarer name DEFINE_PCI_DEVICE_TABLE;
@@

-const struct pci_device_id id[] +DEFINE_PCI_DEVICE_TABLE(id)   { ... };
