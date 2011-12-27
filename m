From: Julia Lawall <julia.lawall@lip6.fr>
Date: Tue, 27 Dec 2011 08:36:04 +0000
Subject: Re: [PATCH 2/2] drivers/mtd/maps/lantiq-flash.c: drop iounmap for
Message-Id: <alpine.DEB.2.02.1112270935410.1838@localhost6.localdomain6>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1324921081-13161-2-git-send-email-julia@diku.dk>
 <1324974236.1165.43.camel@sauron.fi.intel.com>
In-Reply-To: <1324974236.1165.43.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Artem Bityutskiy <dedekind1@gmail.com>
Cc: kernel-janitors@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org

On Tue, 27 Dec 2011, Artem Bityutskiy wrote:

> On Mon, 2011-12-26 at 18:38 +0100, Julia Lawall wrote:
>> From: Julia Lawall <julia@diku.dk>
>>
>> Data allocated with devm_ioremap or devm_ioremap_nocache should not be
>> freed using iounmap, because doing so causes a dangling pointer, and a
>> subsequent double free.
>>
>> The semantic match that finds this problem is as follows:
>> (http://coccinelle.lip6.fr/)
>>
>> // <smpl>
>> @r@
>> expression x;
>> @@
>> (
>>  x = devm_ioremap(...)
>> |
>>  x = devm_ioremap_nocache(...)
>> )
>>
>> @@
>> expression r.x;
>> @@
>> * iounmap(x)
>> // </smpl>
>
> Thanks Julia,
>
> surely this semantic patch script is worth adding to scripts/coccinelle?
> Are you going to take care of this?

OK, I will do that.

julia
