From: Davidlohr Bueso <dave@stgolabs.net>
Date: Sun, 17 Feb 2019 17:33:18 +0000
Subject: Re: [PATCH -next] IB/qib: Remove unused variable 'locked'
Message-Id: <20190217173318.qz3x677ggyut6i6e@linux-r8p5>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20190216033618.116680-1-yuehaibing@huawei.com>
In-Reply-To: <20190216033618.116680-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On Sun, 17 Feb 2019, H?kon Bugge wrote:
>But while looking at the code, the for loop just below looks suspicious:
>
>        for (got = 0; got < num_pages; got += ret) {
>
>as ret is uninitialized.

The first loop will initialize ret with the return of gup_longterm().

Thanks,
Davidlohr
