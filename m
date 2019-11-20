From: "Namjae Jeon" <namjae.jeon@samsung.com>
Date: Wed, 20 Nov 2019 09:02:10 +0000
Subject: RE: [PATCH v3 10/13] exfat: add nls operations
Message-Id: <00b701d59f81$319c1d90$94d458b0$@samsung.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119093718.3501-1-namjae.jeon@samsung.com>
        <CGME20191119094026epcas1p3eea5c655f3b89383e02c0097c491f0bc@epcas1p3.samsung.com>
        <20191119093718.3501-11-namjae.jeon@samsung.com>
        <705cb02b-7707-af52-c2b5-70660debc619@web.de>
In-Reply-To: <705cb02b-7707-af52-c2b5-70660debc619@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: 'Markus Elfring' <Markus.Elfring@web.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, 'Christoph Hellwig' <hch@lst.de>, 'Daniel Wagner' <dwagner@suse.de>, 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>, 'Sungjong Seo' <sj1557.seo@samsung.com>, =?UTF-8?Q?'Valdis_Kl=C4=93tnieks'?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com, linux-fsdevel@vger.kernel.org

> …
> > +++ b/fs/exfat/nls.c
> …
> > +static int exfat_load_upcase_table(struct super_block *sb,
> > +		sector_t sector, unsigned long long num_sectors,
> > +		unsigned int utbl_checksum)
> > +{
> …
> > +error:
> > +	if (bh)
> > +		brelse(bh);
> 
> I am informed in the way that this function tolerates the passing
> of null pointers.
> https://protect2.fireeye.com/url?k=58476862-058969b1-5846e32d-000babff317b-
> 2bdcc1db1dc57528&u=https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/
> linux.git/tree/include/linux/buffer_head.h?id=af42d3466bdc8f39806b26f593604f
> dc54140bcb#n292
> https://protect2.fireeye.com/url?k=625424d5-3f9a2506-6255af9a-000babff317b-
> a544a35424b18c18&u=https://elixir.bootlin.com/linux/v5.4-
> rc8/source/include/linux/buffer_head.h#L292
> 
> Thus I suggest to omit the extra pointer check also at similar places.
> 
> Can the label “release_bh” be more helpful?
Hi Markus,

I checked not only review point but also your review points in
other patches, I will fix them on v4.

Thanks for your review!
> 
> Regards,
> Markus
