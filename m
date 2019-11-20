From: Markus Elfring <Markus.Elfring@web.de>
Date: Wed, 20 Nov 2019 12:36:05 +0000
Subject: Re: [PATCH v3 10/13] exfat: add nls operations
Message-Id: <cb82f263-4374-c483-7093-03de81618399@web.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191119093718.3501-1-namjae.jeon@samsung.com>
 <CGME20191119094026epcas1p3eea5c655f3b89383e02c0097c491f0bc@epcas1p3.samsung.com>
 <20191119093718.3501-11-namjae.jeon@samsung.com>
 <705cb02b-7707-af52-c2b5-70660debc619@web.de>
 <00b701d59f81$319c1d90$94d458b0$@samsung.com>
In-Reply-To: <00b701d59f81$319c1d90$94d458b0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Namjae Jeon <namjae.jeon@samsung.com>, linux-fsdevel@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christoph Hellwig <hch@lst.de>, Daniel Wagner <dwagner@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sungjong Seo <sj1557.seo@samsung.com>, =?UTF-8?Q?Valdis_Kl=c4=93tnieks?= <valdis.kletnieks@vt.edu>, linkinjeon@gmail.com

>> …
>>> +++ b/fs/exfat/nls.c
>> …
>>> +static int exfat_load_upcase_table(struct super_block *sb,
>>> +		sector_t sector, unsigned long long num_sectors,
>>> +		unsigned int utbl_checksum)
>>> +{
>> …
>>> +error:
>>> +	if (bh)
>>> +		brelse(bh);
…
>> Can the label “release_bh” be more helpful?
…
> I checked not only review point but also your review points in
> other patches, I will fix them on v4.
…

Another software design alternative would be to use a jump target
like “free_table” instead at this source code place, wouldn't it?

Regards,
Markus
