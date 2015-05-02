From: Julia Lawall <julia.lawall@lip6.fr>
Date: Sat, 02 May 2015 06:02:02 +0000
Subject: Re: [HPDD-discuss] [PATCH 2/11] Staging: lustre: fld: Use kzalloc and kfree
Message-Id: <alpine.DEB.2.02.1505020800570.2073@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1430495482-933-1-git-send-email-Julia.Lawall@lip6.fr> <1430495482-933-11-git-send-email-Julia.Lawall@lip6.fr> <a650e757977e491b816c34e7780c1a08@EXCHCS32.ornl.gov> <20150501200221.GF14154@mwanda> <9f81478864bc422c9a59cddbaa723052@EXCHCS32.ornl.gov>
 <20150501204930.GB2265@kroah.com> <CA8D4D3B-39CB-4DE4-835D-047692A7E5DE@intel.com> <20150501205835.GA2692@kroah.com> <C4CA2C71-C25D-42EB-AC52-963405EFE353@intel.com>
In-Reply-To: <C4CA2C71-C25D-42EB-AC52-963405EFE353@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Drokin, Oleg" <oleg.drokin@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>, "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>, "HPDD-discuss@lists.01.org" <HPDD-discuss@ml01.01.org>, "Simmons, James A." <simmonsja@ornl.gov>, Dan Carpenter <dan.carpenter@oracle.com>

> Yes, I imagine Julia will include that as the new lustre_kvzalloc() define
> to be used in all OBD_ALLOC_LARGE instances.
> I can provide the desired code if necessary (it's actually a bit less than trivial
> because in some cases we also have that numa-aware node thing).

Oleg,

If you could send a patch with the proper definition, that would be very
helpful, thanks.  When that is in place, I can update the uses.

thanks,
julia

> though if we are ok to review that later, then almost a copy of ext4 one would do like this:
> void *lustre_kvzalloc(size_t size, gfp_t flags)
> {
>        void *ret;
> 
>        ret = kzalloc(size, flags | __GFP_NOWARN);
>        if (!ret)
>                ret = __vmalloc(size, flags | __GFP_ZERO, PAGE_KERNEL);
>        return ret;
> }
> 
> 
> Bye,
>     Oleg
