From: "Sven Schmidt (4sschmid)" <4sschmid@informatik.uni-hamburg.de>
Date: Tue, 31 Jan 2017 12:09:23 +0000
Subject: Re: [bug report] lib: update LZ4 compressor module
Message-Id: <E0F70960-4ECC-4317-B902-FBF2BA256056@informatik.uni-hamburg.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170131104104.GA27172@mwanda>
In-Reply-To: <20170131104104.GA27172@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Am 31. Januar 2017 11:43:28 MEZ schrieb Dan Carpenter <dan.carpenter@oracle.com>:
>Same thing for lz4hc_compress() as well.
>
>    lib/lz4/lz4hc_compress.c:622 lz4hc_compress()
>    warn: variable dereferenced before check 'dst_len' (see line 612)
>
>regards,
>dan carpenter

Hi Dan, 

I did not receive any previous E-Mails, so this one is a bit out of context for me. I checked the kernel-janitors archive though and found the E-Mail you may reference to. 

I will fix it.

Is there a way to automatically receive any following messages?

Thanks,

Sven
