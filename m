From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Fri, 22 Feb 2019 07:29:14 +0000
Subject: Re: [PATCH 2/2] test_firmware: silence underflow warning in test_dev_config_update_u8()
Message-Id: <20190222072913.GH1711@kadam>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190221183700.GA1737@kadam>
 <20190221183826.GA30993@kadam>
 <20190221105458.409d1968961962079c54b815@linux-foundation.org>
 <20190221191855.GB1737@kadam>
 <20190221115426.f616100906d989eda93d66dc@linux-foundation.org>
In-Reply-To: <20190221115426.f616100906d989eda93d66dc@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

I've looked at this some more and I don't think it's a good idea to
change the type of U8_MAX.  Right now INT_MAX is int and USHRT_MAX is
unsigned short etc.  That's the only intuitive thing for them to be.

regards,
dan carpenter
