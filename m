From: David Miller <davem@davemloft.net>
Date: Tue, 10 Aug 2010 07:01:21 +0000
Subject: Re: [patch 2/2] qlcnic: using too much stack
Message-Id: <20100810.000121.48516818.davem@davemloft.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1281405801.1954.65.camel@Joe-Laptop.home>
	<D084A42E-7F2A-44F7-9273-DDD9214CB877@qlogic.com>
	<1281411546.1954.102.camel@Joe-Laptop.home>
In-Reply-To: <1281411546.1954.102.camel@Joe-Laptop.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: joe@perches.com
Cc: anirban.chakraborty@qlogic.com, error27@gmail.com, amit.salecha@qlogic.com, Linux-Driver@qlogic.com, sucheta.chakraborty@qlogic.com, netdev@vger.kernel.org, kernel-janitors@vger.kernel.org

From: Joe Perches <joe@perches.com>
Date: Mon, 09 Aug 2010 20:39:06 -0700

> On Mon, 2010-08-09 at 20:31 -0700, Anirban Chakraborty wrote:
>> On Aug 10, 2010, at 7:33 AM, Joe Perches wrote:
>> > On Mon, 2010-08-09 at 18:43 -0700, Anirban Chakraborty wrote:
>> >> Your patch is fine except that the preferred way is to use kzalloc over kaclloc. kzalloc does not need that extra
>> >> argument that you are passing to kcalloc.
>> > You probably meant to write "my preferred way"
>> > as the kcalloc to "kzalloc with a multiply"
>> > ratio is pretty high.
>> I was suggesting based on the following:
>> http://lwn.net/Articles/147014/
> 
> Note that article suggests kzalloc for allocating
> a single zeroed object.
> 
> kcalloc is used for multiple zeroed objects and
> protects against oversized allocations.

Agreed, kcalloc should be used here.
