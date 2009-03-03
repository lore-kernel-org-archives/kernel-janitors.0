From: Stefan Richter <stefanr@s5r6.in-berlin.de>
Date: Tue, 03 Mar 2009 16:22:29 +0000
Subject: Re: [PATCH] Replace deprecated __initcall with device_initcall and
Message-Id: <49AD5945.2030604@s5r6.in-berlin.de>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
In-Reply-To: <ea11fea30902160824l22b10dcblc89c718015e156c8@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Manish Katiyar wrote:
> On Fri, Feb 20, 2009 at 8:19 PM, Manish Katiyar <mkatiyar@gmail.com> wrote:
>> Below is the updated patch
> 
> Hi Stefan,
> 
> Has this been accepted, or is it still not worth it ?

Your last posting looked good to me.  But I am not the one to take it; I
just looked at the thread coincidentally.

One thing that wasn't answered in the discussion is whether
device_initcall is not only the equivalent but also the /best/
replacement of __initcall, specifically for kallsyms_init.  (Maybe it
should be something else; then a mechanical replacement by
device_initcall would lower awareness of the issue --- if there is an
issue.  There probably isn't, but I don't know.)
-- 
Stefan Richter
-===-=--= --= ---=
http://arcgraph.de/sr/
