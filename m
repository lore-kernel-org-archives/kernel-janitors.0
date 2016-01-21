From: Aravind Gopalakrishnan <aravind.gopalakrishnan@amd.com>
Date: Thu, 21 Jan 2016 15:29:55 +0000
Subject: Re: [patch] amd64_edac: shift wrapping issue in f1x_get_norm_dct_addr()
Message-Id: <56A0F973.2040906@amd.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160120095451.GB19898@mwanda> <20160121123205.GE21930@pd.tnic>
In-Reply-To: <20160121123205.GE21930@pd.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Borislav Petkov <bp@alien8.de>, Dan Carpenter <dan.carpenter@oracle.com>
Cc: Doug Thompson <dougthompson@xmission.com>, Mauro Carvalho Chehab <mchehab@osg.samsung.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 1/21/2016 6:32 AM, Borislav Petkov wrote:
> On Wed, Jan 20, 2016 at 12:54:51PM +0300, Dan Carpenter wrote:
>> +	u64 dct_sel_base_off	= (u64)(pvt->dct_sel_hi & 0xFFFFFC00) << 16;
>
>
> @Aravind: do you have a box with
>
> setpci -s 18.2 0x114.l
>
> bits [31:16] not 0?
>
>
>

Nope. I don't see it set on my Fam10h and Fam15h Model 00-0fh systems.

But yes, nice catch!

-Aravind.
