From: "Brian Jung Myeng Lee" <jm3lee@gmail.com>
Date: Tue, 27 Jun 2006 08:29:20 +0000
Subject: Re: [KJ] [patch 1/1] kernel/resource.c: __request_region argument
Message-Id: <c7cf77ad0606270129y3f727157i2849f48c8de2b0b9@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <c7cf77ad0606270022g174a2fbdje69d94ebebd32363@mail.gmail.com>
In-Reply-To: <c7cf77ad0606270022g174a2fbdje69d94ebebd32363@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Oops, I'm sorry. I guess it's a little bit getting too late.

Here's a copy of my response.

Greg,

I must have misinterpreted what it said on the TODO list. Under Audit
section, request_region() is listed. (I found that request_region() is
a macro that really calls __request_region().) I thought somebody
wanted to check and see if __request_region() returns proper return
values. I noticed that

               res->end = start + n - 1;

in kernel/resource.c:__request_region(). If n = 0, I think res->end <
res->start, which I hope is not the valid region.

Thank you for the feedback.

On 6/27/06, Greg KH <greg@kroah.com> wrote:
> On Tue, Jun 27, 2006 at 04:13:45AM -0400, Brian Jung Myeng Lee wrote:
> > Greg,
>
> Hm, any reason you sent this just to me?  Try responding to the whole
> list please, as it's a bit rude to take conversations off-list for no
> reason.
>
> thanks,
>
> greg k-h
>


-- 
Brian Jung Myeng Lee
Homepage: http://koreanbrian.com
_______________________________________________
Kernel-janitors mailing list
Kernel-janitors@lists.osdl.org
https://lists.osdl.org/mailman/listinfo/kernel-janitors
