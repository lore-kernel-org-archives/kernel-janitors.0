From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 31 Jan 2017 10:43:28 +0000
Subject: Re: [bug report] lib: update LZ4 compressor module
Message-Id: <20170131104328.GC6970@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170131104104.GA27172@mwanda>
In-Reply-To: <20170131104104.GA27172@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Same thing for lz4hc_compress() as well.

    lib/lz4/lz4hc_compress.c:622 lz4hc_compress()
    warn: variable dereferenced before check 'dst_len' (see line 612)

regards,
dan carpenter

