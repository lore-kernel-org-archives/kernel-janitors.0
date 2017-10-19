From: Michal =?UTF-8?B?U3VjaMOhbmVr?= <msuchanek@suse.de>
Date: Thu, 19 Oct 2017 12:39:49 +0000
Subject: Re: [PATCH 4/5] powerpc-pseries: Return directly after a failed kzalloc_node() in iommu_pseries_allo
Message-Id: <20171019143949.2c87ea66@kitsune.suse.cz>
List-Id: <kernel-janitors.vger.kernel.org>
References: <0d221be4-1402-0499-d95e-afa4a30e1f33@users.sourceforge.net>
 <a824fe65-1708-16ba-68d6-df0f73e0f49a@users.sourceforge.net>
 <20171019134148.52b890b4@kitsune.suse.cz>
 <2f1e61bd-9d79-1b9f-e686-f9d13a6f0afc@users.sourceforge.net>
In-Reply-To: <2f1e61bd-9d79-1b9f-e686-f9d13a6f0afc@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, Sahil Mehta <sahilmehta17@gmail.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Tyrel Datwyler <tyreld@linux.vnet.ibm.com>, kernel-janitors@vger.kernel.org, Doug Ledford <dledford@redhat.com>, Johan Hovold <johan@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Alex Williamson <alex.williamson@redhat.com>, Paul Mackerras <paulus@samba.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bart Van Assche <bart.vanassche@sandisk.com>, Andrew Morton <akpm@linux-foundation.org>, Nathan Fontenot <nfont@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, David Gibson <david@gibson.dropbear.id.au>

On Thu, 19 Oct 2017 14:04:43 +0200
SF Markus Elfring <elfring@users.sourceforge.net> wrote:

> >> @@ -61,7 +61,7 @@ static struct iommu_table_group
> >> *iommu_pseries_alloc_group(int node) table_group > >> kzalloc_node(sizeof(*table_group), GFP_KERNEL, node); if
> >> (!table_group)
> >> -		goto fail_exit;
> >> +		return NULL;
> >>  
> >>  	tbl = kzalloc_node(sizeof(*tbl), GFP_KERNEL, node);
> >>  	if (!tbl)  
> > 
> > I have seen quite a few fixes that do inverse of this patch after a
> > piece of code allocating some extra piece of memory was added before
> > code that just returns on fail because it is the first allocation in
> > the function.
> > 
> > This is not useful.  
> 
> How do you think about an information from the section “7)
> Centralized exiting of functions” in the document “coding-style.rst”
> then?
> 
> “…
> If there is no cleanup needed then just return directly.
> …”

There is also stated benefit

"
- errors by not updating individual exit points when making
  modifications are prevented
"

which is furthered by using the common cleanup even in case no cleanup
is required but running the cleanup does not cause any harm.

Thanks

Michal
