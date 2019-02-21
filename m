From: Andrew Morton <akpm@linux-foundation.org>
Date: Thu, 21 Feb 2019 19:54:26 +0000
Subject: Re: [PATCH 2/2] test_firmware: silence underflow warning in test_dev_config_update_u8()
Message-Id: <20190221115426.f616100906d989eda93d66dc@linux-foundation.org>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190221183700.GA1737@kadam>
        <20190221183826.GA30993@kadam>
        <20190221105458.409d1968961962079c54b815@linux-foundation.org>
        <20190221191855.GB1737@kadam>
In-Reply-To: <20190221191855.GB1737@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Luis R. Rodriguez" <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Thu, 21 Feb 2019 22:18:56 +0300 Dan Carpenter <dan.carpenter@oracle.com> wrote:

> On Thu, Feb 21, 2019 at 10:54:58AM -0800, Andrew Morton wrote:
> > On Thu, 21 Feb 2019 21:38:26 +0300 Dan Carpenter <dan.carpenter@oracle.com> wrote:
> > 
> > > We put an upper bound on "new" but we don't check for negatives.
> > 
> > U8_MAX has unsigned type, so `if (new > U8_MAX)' does check for negative.
> > 
> 
> No, doesn't work in this case.
> 
> #define U8_MAX          ((u8)~0U)
> 
> It would need to unsigned long for the type promotion to prevent
> negatives, but it starts as unsigned int, then unsigned char, which is
> type promoted to int.

OK.

> It would be more clear to just write it as:
> 
> #define U8_MAX 0xff

That doesn't work either.  Tricky.


#include <stdio.h>

typedef unsigned char u8;

#define U8_MAX 0xff

int main(int argc, char *argv[])
{
	long new;

	new = -20;

	if (new > U8_MAX)
		printf("over\n");
}
